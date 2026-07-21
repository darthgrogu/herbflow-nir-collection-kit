# Introdução

Olá! Este é o guia de uso do **herbflow** — se é sua primeira vez por aqui,
este guia foi pensado para te acompanhar do início ao fim, sem pressa.
Qualquer dúvida que aparecer no caminho é normal, e voltar aqui pra
consultar é exatamente pra isso que o guia existe.

O **herbflow** reúne duas ferramentas usadas para testar o fluxo de coleta de
dados espectrais de espécimes de herbário:

- **Planilha de coleta** (`herbflow_iHerbSpec.xlsm`) — usada durante a coleta
  em campo/bancada para registrar os metadados de cada leitura (espécime,
  sessão, instrumento, tipo de tecido, etc.).
- **Gerador de artefato** (`iherbspec_parser.exe`) — depois da coleta, junta a
  planilha preenchida com os arquivos de leitura do equipamento e produz o
  pacote final de dados, organizado e pronto para arquivar/compartilhar.

O **herbflow** é o fluxo de coleta em si — ele não depende de um protocolo
específico. Nesta fase de teste usamos o **iHerbSpec (v1.2.1)** como protocolo
de referência: é o que a planilha preenche e o que o artefato de saída segue
hoje. O toolkit foi pensado para se adaptar a outros protocolos (outros campos,
outros formatos de saída), o que será ampliado nos próximos testes.

!!! note "Isto é um teste de fluxo, não o produto final"
    O objetivo é testar com pessoas reais em campo se o caminho planilha →
    coleta → parser funciona bem na prática — qualquer dificuldade ou
    confusão que você encontrar é exatamente o tipo de feedback que este
    teste está procurando. O toolkit (e este guia) vai evoluir a partir do
    que testadores reais relatarem — **qualquer feedback seu é valioso**
    para o aprimoramento da ferramenta. Ver [Feedback](feedback.md).

As duas ferramentas são **propositalmente independentes (planilha + gerador de artefato/parser)** — você roda a
planilha primeiro, depois roda o gerador de artefato manualmente, apontando-o
para os arquivos gerados durante a coleta. Não existe (ainda) comunicação
automática entre os dois; isso é intencional e faz parte do que este teste
está avaliando.

## Por onde começar

<div class="grid cards" markdown>

-   :material-rocket-launch-outline:{ .lg .middle } **Comece por aqui**

    ---

    Teste o fluxo inteiro com dados de exemplo prontos — sem coletar nada,
    sem precisar de equipamento.

    [:octicons-arrow-right-24: Primeiro teste](test-drive.md)

-   :material-file-excel-box:{ .lg .middle } **1. Planilha (metadados)**

    ---

    Requisitos, desbloqueio do `.xlsm`, o menu e a pasta `readings/`.

    [:octicons-arrow-right-24: Ver seção](planilha/index.md)

-   :material-radar:{ .lg .middle } **2. Coleta**

    ---

    Operar o equipamento e salvar as leituras na pasta certa.

    [:octicons-arrow-right-24: Ver seção](coleta/index.md)

-   :material-cog-outline:{ .lg .middle } **3. Conversão (Parser)**

    ---

    Rodar o gerador de artefato, passo a passo.

    [:octicons-arrow-right-24: Ver seção](parser/index.md)

-   :material-package-variant-closed:{ .lg .middle } **4. Artefato de saída**

    ---

    O que o artefato gerado contém, e como ler o relatório.

    [:octicons-arrow-right-24: Ver seção](saida/index.md)

</div>

Novo por aqui? Comece pela página **[Comece por aqui](test-drive.md)** — ela
traz a visão geral do fluxo de ponta a ponta e um primeiro teste que você
roda na hora, com dados de exemplo, sem precisar de equipamento.
