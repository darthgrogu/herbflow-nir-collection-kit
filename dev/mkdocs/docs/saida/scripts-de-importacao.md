# Scripts de importação (Python e R)

Dois scripts prontos para carregar o **artefato limpo**
(`artefato_iherbspec_cleaned/`) direto numa tabela única, pronta para
análise em Python ou R — sem precisar escrever o código de leitura você
mesmo. Funcionam com qualquer artefato limpo gerado pelo gerador de
artefato, não são específicos de um dataset.

O que os dois fazem, igual nos dois idiomas: leem o `metadata.xlsx`, e para
cada linha carregam o espectro correspondente em `sessions/<sessão>/`,
juntando tudo numa única tabela **longa** — uma linha por combinação de
(leitura, comprimento de onda), com todos os metadados da planilha
replicados. É o formato mais direto para começar uma análise (filtrar por
espécie, plotar por comprimento de onda, agrupar por `targetClass`, etc.).

!!! warning "Escopo: só importação, nada de análise"
    Estes scripts **só carregam os dados** — eles não fazem nenhuma análise
    discriminante, treinamento de modelo, nem nenhum tipo de machine
    learning. Também não normalizam os espectros numa matriz única nem
    interpolam os comprimentos de onda entre equipamentos diferentes (ver
    o aviso sobre nomes de coluna mais abaixo) — isso é processamento de
    dados de verdade, fora do escopo desta ferramenta.

    O herbflow é focado no **processo de coleta** — não na análise. Esse
    tipo de processamento mais pesado não deve rodar na máquina de coleta;
    para ter escala e inferências precisas num cenário real, ele vai
    precisar rodar nos servidores do herbário, não aqui.

## Python

Requer `pandas` e `openpyxl`:

```bash
pip install pandas openpyxl
```

[:octicons-download-24: Baixar carregar_artefato.py](../assets/scripts/carregar_artefato.py)

```python
from carregar_artefato import carregar_artefato_limpo

df = carregar_artefato_limpo("caminho/para/artefato_iherbspec_cleaned")
print(df.head())
```

Também roda direto da linha de comando:

```bash
python carregar_artefato.py caminho/para/artefato_iherbspec_cleaned
```

## R

Requer o pacote `readxl` (o resto usa só base R, de propósito — menos
dependência para instalar):

```r
install.packages("readxl")
```

[:octicons-download-24: Baixar carregar_artefato.R](../assets/scripts/carregar_artefato.R)

```r
source("carregar_artefato.R")

df <- carregar_artefato_limpo("caminho/para/artefato_iherbspec_cleaned")
head(df)
```

Também roda direto da linha de comando:

```bash
Rscript carregar_artefato.R caminho/para/artefato_iherbspec_cleaned
```

!!! warning "Nomes de coluna do espectro variam por equipamento"
    O InnoSpectra grava `Absorbance (AU)` / `Reflectance (unitless)`; o
    FieldSpec/ASD grava `Target Signal (raw)` / `Reflectance (%)` — os
    scripts **não** tentam unificar os dois formatos (ver
    [Limitações conhecidas](limitacoes.md)). Cada leitura carrega com as
    colunas que o arquivo realmente tem; a coluna `instrumentmodel` (da
    planilha) diz qual equipamento gerou cada linha, para você decidir como
    tratar isso na sua análise.
