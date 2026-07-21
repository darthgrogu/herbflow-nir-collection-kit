# Artefato de saída — visão geral

Depois da [conversão](../parser/index.md), o gerador produz o **artefato de
saída** — o resultado final de todo o fluxo, pronto para arquivar ou
compartilhar. Esta página explica, de forma introdutória, o que ele é e como
ele se diferencia do que veio antes.

## Duas coisas que não devem se confundir

- **Coleta** — o que você reuniu durante o processo de coleta: a planilha
  preenchida (metadados) + os arquivos de leitura que o equipamento gerou na
  pasta `readings/`. É informação **bruta**, cada arquivo ainda no formato e
  na convenção de nome do próprio equipamento — ver
  [Coleta](../coleta/index.md).
- **Artefato final** — o resultado de rodar o [gerador de
  artefato](../parser/index.md) sobre essa coleta: os mesmos dados,
  reorganizados na gramática de um **protocolo** — hoje, o **iHerbSpec
  v1.2.1**. É essa saída reorganizada que representa o resultado "oficial"
  do fluxo — o que se arquiva, compartilha ou usa como referência.

!!! info "O protocolo é do artefato, não da coleta"
    A coleta em si não depende de protocolo nenhum — só de você conseguir
    fazer a [correspondência entre planilha e leituras](../coleta/correspondencia-arquivos.md).
    É só na conversão que os dados passam a seguir a gramática de um
    protocolo específico. Hoje esse protocolo é o iHerbSpec; o gerador foi
    pensado para se adaptar a outros no futuro (ver [Introdução](../index.md)).

## O que tem nesta seção

- [Estrutura de pastas](estrutura-pastas.md) — as duas pastas do artefato
  (bruta e limpa) e os relatórios que ficam ao lado delas.
- [Scripts de importação (Python e R)](scripts-de-importacao.md) — carregar
  o artefato limpo numa tabela pronta para análise, sem escrever o código de
  leitura você mesmo.
- [Relatório de sucesso](relatorio-sucesso.md) — o que o `RELATORIO.html`
  mostra quando o lote é aceito.
- [Relatório de rejeição](relatorio-rejeicao.md) — o que olhar quando o lote
  não é aceito.
- [Limitações conhecidas](limitacoes.md) — o que ainda não funciona
  perfeitamente nesta versão de teste.
