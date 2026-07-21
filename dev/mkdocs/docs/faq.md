# Perguntas frequentes

Respostas rápidas para dúvidas comuns — cada uma linka para a seção
completa se você quiser mais detalhe.

**Preciso de internet para usar o kit?**
: Não. A planilha e o gerador de artefato rodam 100% offline depois de
  baixados. Este próprio guia também funciona sem internet, aberto direto
  do zip.

**Posso testar sem coletar dados de verdade?**
: Sim — os datasets de exemplo incluídos no pacote deixam testar o fluxo
  completo do gerador de artefato sem precisar de equipamento nenhum. Ver
  [Comece por aqui](test-drive.md).

**Abri o `.xlsm` e não aparece o menu iHerbSpec no Excel. O que eu faço?**
: O caso mais comum é o arquivo ainda estar bloqueado pelo Windows (por ter
  vindo da internet) — o Excel carrega, mas as macros não rodam sem o passo
  de desbloqueio manual. Ver
  [Requisitos e desbloqueio](planilha/requisitos-desbloqueio.md).

**Por que o gerador produz duas pastas em vez de uma só?**
: Uma é o **bruto** (arquivos originais do equipamento, só renomeados —
  cópia de segurança fiel) e outra é o **limpo** (leituras unificadas,
  prontas para análise). Ver [Estrutura de pastas](saida/estrutura-pastas.md).

**O lote foi rejeitado. E agora?**
: Abra o `RELATORIO_REJEICAO.md` na pasta de saída — ele lista exatamente
  os motivos do bloqueio, linha por linha. Corrija e rode de novo. Ver
  [Relatório de rejeição](saida/relatorio-rejeicao.md).

**A caixa de busca deste guia não funciona. É esperado?**
: Sim, quando você abre o guia direto do zip (sem servidor) — desativamos a
  busca de propósito nesse caso, porque ela ficaria travada "carregando"
  para sempre. Use o menu lateral para navegar, ou `Ctrl+F` do navegador
  para buscar dentro da página atual.

**Posso misturar leituras de InnoSpectra e FieldSpec no mesmo lote?**
: Sim, o gerador aceita. Mas os gráficos do relatório hoje só mostram as
  leituras do InnoSpectra — ver
  [Limitações conhecidas](saida/limitacoes.md).

**Encontrei um problema. Onde reporto?**
: Ver [Problemas conhecidos / feedback](feedback.md).
