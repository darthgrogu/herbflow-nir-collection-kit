# Glossário

Termos gerais usados ao longo deste guia. Para os campos específicos da
planilha de metadados (com descrição completa, status obrigatório/opcional
e protocolo de origem), veja o
[Dicionário de campos](planilha/dicionario-de-campos.md) — esta página aqui
cobre o vocabulário do processo, não coluna por coluna.

**Artefato** (bruto / limpo)
: O resultado da geração do parser: duas pastas, uma com os arquivos de
  leitura originais renomeados (**bruto**) e outra com as leituras
  unificadas e prontas para análise (**limpo**). Ver
  [Estrutura de pastas](saida/estrutura-pastas.md).

**`filename_prefix`**
: Chave de busca interna que liga uma linha da planilha aos arquivos físicos
  de leitura. Não é o nome de arquivo final do protocolo. Ver
  [Dicionário de campos](planilha/dicionario-de-campos.md).

**Gerador de artefato** (`iherbspec_parser.exe`)
: A ferramenta que lê a planilha preenchida + a pasta `readings/` e produz
  o artefato final. Ver [Gerador de artefato](parser/index.md).

**herbflow**
: Nome do fluxo/produto: o processo completo de coleta de metadados
  espectrais de espécimes de herbário, do qual o iHerbSpec é um dos
  protocolos possíveis (não o único).

**herbflow NIR Collection Kit**
: O nome deste **pacote de distribuição/teste** específico — as duas
  ferramentas (planilha + gerador de artefato) empacotadas juntas, testadas
  com o equipamento NIR usado nesta fase. É um nome de pacote, não do fluxo:
  o **herbflow** em si não é limitado à faixa espectral NIR.

**iHerbSpec**
: O protocolo de metadados usado por este teste (versão **v1.2.1**) —
  define os nomes de campo, os códigos de classificação e a gramática de
  nomes de arquivo que a planilha e o gerador de artefato seguem.

**NIR**
: *Near-Infrared* (infravermelho próximo) — a faixa espectral que o
  equipamento mede.

**`readings/`**
: A pasta, ao lado da planilha preenchida, onde ficam os arquivos gerados
  pelo equipamento durante a coleta. Ver
  [A pasta de leituras](planilha/pasta-de-leituras.md).

**`RELATORIO.html`**
: Relatório gerado quando um lote é aceito — inventário, flags, faixa
  espectral e gráficos de análise. Ver
  [Relatório de sucesso](saida/relatorio-sucesso.md).

**`RELATORIO_REJEICAO.md`**
: Relatório gerado quando um lote é rejeitado — lista os motivos do
  bloqueio. Ver [Relatório de rejeição](saida/relatorio-rejeicao.md).

**Sessão** (`sessionId`)
: Um agrupamento de leituras feitas de uma vez (por exemplo, todas as
  leituras de um dia de coleta). Cada sessão tem um identificador único.

**`targetClass`**
: Classifica o que está sendo medido numa leitura — um tecido específico,
  um fundo, ou uma referência de calibração. Lista completa de códigos no
  [Dicionário de campos](planilha/dicionario-de-campos.md).
