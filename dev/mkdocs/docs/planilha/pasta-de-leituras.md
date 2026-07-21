# A pasta de leituras (readings/)

Ainda na preparação local — junto com a planilha — vale já definir **onde** as
leituras do equipamento vão ser guardadas: uma pasta chamada `readings/`, ao
lado da planilha preenchida. É esse o local que, durante a
[coleta](../coleta/index.md), você vai indicar no software do equipamento como
destino de salvamento, e que o [gerador de artefato](../parser/index.md) vai
ler depois.

```
pasta_da_coleta/
├── herbflow_iHerbSpec.xlsm
└── readings/
    └── (vazia por enquanto — o equipamento salva os arquivos aqui na coleta)
```

- **Deixe a pasta pronta ao lado da planilha** — como planilha e leituras ficam
  na mesma pasta, o gerador de artefato consegue casar cada linha da planilha
  com seus arquivos automaticamente depois, sem você ter que apontar um a um.
- **Subpastas são aceitas** — se preferir organizar por sessão de coleta (uma
  subpasta por dia, por exemplo), o gerador procura os arquivos em todos os
  níveis dentro de `readings/`, não só no nível principal.
- **Você não renomeia nada** — os arquivos entram na pasta exatamente como o
  equipamento os salva; o que precisa bater é o prefixo do nome, explicado em
  [Correspondência entre planilha e leituras](../coleta/correspondencia-arquivos.md).

!!! note "Fluxo local, por enquanto"
    Nesta fase de teste, planilha e leituras convivem numa pasta local no seu
    computador — não há envio automático para lugar nenhum. Manter as duas
    lado a lado é justamente o que permite a [conversão](../parser/index.md)
    funcionar sem integração entre os aparelhos.
