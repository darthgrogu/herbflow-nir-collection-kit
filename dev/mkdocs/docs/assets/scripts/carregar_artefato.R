# Carrega um artefato LIMPO do herbflow (artefato_iherbspec_cleaned/) numa
# única tabela "longa" -- uma linha por comprimento de onda por leitura, com
# todos os metadados da planilha replicados em cada linha.
#
# Não é específico de um dataset -- funciona com qualquer artefato limpo
# gerado pelo gerador de artefato, desde que a pasta apontada seja a do
# artefato limpo (a que tem `metadata.xlsx` + `sessions/` diretamente
# dentro).
#
# Uso:
#   source("carregar_artefato.R")
#   df <- carregar_artefato_limpo("caminho/para/artefato_iherbspec_cleaned")
#
# Uso via linha de comando:
#   Rscript carregar_artefato.R caminho/para/artefato_iherbspec_cleaned
#
# Requer só o pacote readxl (base R cuida do resto, de propósito -- menos
# dependência pra instalar):
#   install.packages("readxl")
#
# Limitação conhecida (ver "Limitações conhecidas" no guia): os nomes das
# colunas espectrais variam por equipamento -- hoje o InnoSpectra grava
# "Absorbance (AU)"/"Reflectance (unitless)" e o FieldSpec/ASD grava
# "Target Signal (raw)"/"Reflectance (%)". Esta função NÃO tenta unificar os
# dois -- ela carrega cada leitura com as colunas que o arquivo realmente
# tem; a coluna `instrumentmodel` (vinda da planilha) diz qual equipamento
# gerou cada linha, pra você decidir como tratar isso na sua análise.

carregar_artefato_limpo <- function(pasta_artefato) {
  if (!requireNamespace("readxl", quietly = TRUE)) {
    stop("Pacote 'readxl' não instalado -- rode install.packages(\"readxl\") primeiro.")
  }

  metadata_path <- file.path(pasta_artefato, "metadata.xlsx")
  if (!file.exists(metadata_path)) {
    stop(sprintf(
      "metadata.xlsx nao encontrado em '%s' -- confirme que este e o caminho do artefato LIMPO (artefato_iherbspec_cleaned/), nao o bruto.",
      pasta_artefato
    ))
  }

  metadata <- as.data.frame(readxl::read_excel(metadata_path))

  leituras <- list()
  ausentes <- character(0)

  for (i in seq_len(nrow(metadata))) {
    linha <- metadata[i, , drop = FALSE]
    nome_arquivo <- linha[["filename"]]
    sessao <- linha[["sessionid"]]

    if (is.na(nome_arquivo) || is.na(sessao)) {
      # Linha sem leitura casada nesta camada -- não é erro, só não tem espectro.
      next
    }

    caminho_csv <- file.path(pasta_artefato, "sessions", as.character(sessao), nome_arquivo)
    if (!file.exists(caminho_csv)) {
      ausentes <- c(ausentes, caminho_csv)
      next
    }

    espectro <- read.csv(caminho_csv, check.names = FALSE)

    # Replica os metadados da linha em cada ponto do espectro, virando uma
    # tabela longa (1 linha = 1 (leitura, comprimento de onda)).
    metadados_repetidos <- linha[rep(1, nrow(espectro)), , drop = FALSE]
    rownames(metadados_repetidos) <- NULL
    leituras[[length(leituras) + 1]] <- cbind(metadados_repetidos, espectro)
  }

  if (length(ausentes) > 0) {
    warning(sprintf(
      "%d arquivo(s) listado(s) em metadata.xlsx nao foram encontrados em disco (primeiro: %s).",
      length(ausentes), ausentes[1]
    ))
  }

  if (length(leituras) == 0) {
    stop("Nenhuma leitura pode ser carregada -- confira o caminho e o RELATORIO.html do lote.")
  }

  do.call(rbind, leituras)
}

# Uso via linha de comando (Rscript carregar_artefato.R <pasta>) -- só roda
# quando o script é chamado diretamente, não quando é usado via source().
if (identical(environment(), globalenv()) && !interactive()) {
  args <- commandArgs(trailingOnly = TRUE)
  if (length(args) == 1) {
    df <- carregar_artefato_limpo(args[1])
    print(head(df))
    cat(sprintf("\n%d linhas (comprimento de onda x leitura) carregadas.\n", nrow(df)))
  }
}
