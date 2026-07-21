# Notas de versão

Registro de mudanças no **pacote de distribuição** (o que muda entre um
zip de release e o próximo) — não é o histórico de desenvolvimento de cada
ferramenta, que vive nos repositórios de origem (`herbflow-excel`,
`pytkinter_iherbspec_parser`), cada um com seu próprio changelog interno.

!!! note "Começando a partir de agora"
    Este registro passa a ser mantido a partir desta versão da documentação
    (2026-07-19). Mudanças anteriores do pacote não foram catalogadas aqui
    retroativamente.

## Não lançado (próxima release)

- Guia de uso migrado de um arquivo HTML único (`guia-de-uso.html`) para
  este site de documentação com navegação hierárquica, buscável por seção
  — mesmo conteúdo, organizado em várias páginas.
- Estrutura de saída do artefato atualizada na documentação: os artefatos
  passaram de `.zip` para pastas simples, e o relatório de sucesso passou
  de `RELATORIO.md` para `RELATORIO.html` (com gráficos embutidos e seletor
  de idioma).
- Adicionado o [Dicionário de campos](planilha/dicionario-de-campos.md), o
  [Glossário](glossario.md), este changelog e as
  [Perguntas frequentes](faq.md).
- Guia reorganizado num fluxo de leitura de ponta a ponta: a visão geral do
  fluxo foi para a página [Comece por aqui](test-drive.md), e o menu lateral
  passou a destacar visualmente a sequência de passos.
- Etapas do fluxo renomeadas pela fase (Planilha → Coleta → Conversão →
  Artefato de saída), deixando o caminho mais claro e menos preso ao nome de
  cada ferramenta.
- Narrativa ajustada para deixar o **herbflow** (o fluxo) como foco, com o
  iHerbSpec no papel de protocolo de referência atual — o toolkit se aplica a
  outros protocolos, algo a ampliar nos próximos testes.
- Etapa de Coleta generalizada: o guia não prescreve o protocolo de coleta de
  cada projeto — o essencial é a [correspondência entre a planilha e as
  leituras](coleta/correspondencia-arquivos.md), que ganhou página própria.
- Nova página [Coleta real: iHerbSpec + InnoSpectra + INPA](coleta/exemplo-inpa.md),
  dentro da etapa de Coleta — o exemplo principal deste guia, com espaço para
  outros protocolos/artigos que usem o fluxo ao final da mesma página.
- Guia publicado também como site online (GitHub Pages), além da cópia que
  acompanha o pacote — o mesmo conteúdo, adaptado a cada forma de abrir.
- Tema visual revisado: paleta verde floresta, seletor de idioma movido para
  o cabeçalho principal (ícone de tradução), breadcrumb entre o cabeçalho e o
  conteúdo, e destaque visual mais forte para a zona do fluxo no menu lateral.

---

Ao preparar uma nova release, adicione uma seção `## vX.X-teste
(AAAA-MM-DD)` acima desta linha, com uma lista curta do que mudou desde a
release anterior — focar no que afeta quem testa (novo campo na planilha,
mudança no formato de saída, correção de bug relatado), não em detalhe de
implementação interna.
