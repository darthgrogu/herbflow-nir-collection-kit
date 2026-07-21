"""
Carrega um artefato LIMPO do herbflow (artefato_iherbspec_cleaned/) numa
única tabela "longa" em pandas -- uma linha por comprimento de onda por
leitura, com todos os metadados da planilha replicados em cada linha.

Não é específico de um dataset -- funciona com qualquer artefato limpo
gerado pelo gerador de artefato, desde que a pasta apontada seja a do
artefato limpo (a que tem `metadata.xlsx` + `sessions/` diretamente dentro).

Uso como biblioteca:
    from carregar_artefato import carregar_artefato_limpo
    df = carregar_artefato_limpo("caminho/para/artefato_iherbspec_cleaned")

Uso via linha de comando:
    python carregar_artefato.py caminho/para/artefato_iherbspec_cleaned

Requer: pandas, openpyxl (para ler o .xlsx)
    pip install pandas openpyxl

Limitação conhecida (ver "Limitações conhecidas" no guia): os nomes das
colunas espectrais variam por equipamento -- hoje o InnoSpectra grava
"Absorbance (AU)"/"Reflectance (unitless)" e o FieldSpec/ASD grava
"Target Signal (raw)"/"Reflectance (%)". Este script NÃO tenta unificar os
dois -- ele carrega cada leitura com as colunas que o arquivo realmente
tem, e a coluna `instrumentmodel` (vinda da planilha) diz qual equipamento
gerou cada linha, pra você decidir como tratar isso na sua análise.
"""

from __future__ import annotations

from pathlib import Path

import pandas as pd


def carregar_artefato_limpo(pasta_artefato: str | Path) -> pd.DataFrame:
    """Lê metadata.xlsx + todas as leituras em sessions/ e devolve uma
    tabela única em formato longo (metadados + espectro por linha)."""
    pasta_artefato = Path(pasta_artefato)
    metadata_path = pasta_artefato / "metadata.xlsx"
    if not metadata_path.exists():
        raise FileNotFoundError(
            f"metadata.xlsx não encontrado em {pasta_artefato} -- confirme "
            "que este é o caminho do artefato LIMPO "
            "(artefato_iherbspec_cleaned/), não o bruto."
        )

    metadata = pd.read_excel(metadata_path)

    leituras = []
    ausentes = []
    for _, linha in metadata.iterrows():
        nome_arquivo = linha.get("filename")
        sessao = linha.get("sessionid")
        if pd.isna(nome_arquivo) or pd.isna(sessao):
            # Linha sem leitura casada nesta camada (ex.: sem artefato limpo
            # pra essa leitura específica) -- não é erro, só não tem espectro.
            continue

        caminho_csv = pasta_artefato / "sessions" / str(sessao) / str(nome_arquivo)
        if not caminho_csv.exists():
            ausentes.append(str(caminho_csv))
            continue

        espectro = pd.read_csv(caminho_csv)
        # Replica cada coluna de metadados em todas as linhas do espectro
        # daquela leitura, pra virar uma tabela longa (1 linha = 1 (leitura, comprimento de onda)).
        for coluna, valor in linha.items():
            espectro[coluna] = valor
        leituras.append(espectro)

    if ausentes:
        print(
            f"Aviso: {len(ausentes)} arquivo(s) listado(s) em metadata.xlsx "
            "não foram encontrados em disco (primeiro: "
            f"{ausentes[0]})."
        )

    if not leituras:
        raise ValueError(
            "Nenhuma leitura pôde ser carregada -- confira o caminho e o "
            "RELATORIO.html do lote."
        )

    return pd.concat(leituras, ignore_index=True)


if __name__ == "__main__":
    import sys

    if len(sys.argv) != 2:
        print("Uso: python carregar_artefato.py <pasta_do_artefato_limpo>")
        raise SystemExit(1)

    tabela = carregar_artefato_limpo(sys.argv[1])
    print(tabela.head())
    print(f"\n{len(tabela)} linhas (comprimento de onda x leitura) carregadas.")
    print(f"{tabela['specimenid'].nunique() if 'specimenid' in tabela else '?'} espécimes distintos.")
