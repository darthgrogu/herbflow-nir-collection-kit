# Rodando o gerador de artefato

Abra `iherbspec_parser.exe`. A janela tem 3 passos sequenciais:

1. **PASSO 1. Planilha de metadados** — escolha o arquivo da planilha
   preenchida (`.xlsx`/`.xlsm`/`.xls`/`.csv`). O programa confirma se todas as
   linhas estão preenchidas corretamente antes de avançar.
2. **PASSO 2. Pasta de arquivos** — normalmente detectada automaticamente
   (uma pasta `readings/` ao lado da planilha, buscando também em
   subpastas), mas pode ser escolhida manualmente a qualquer momento. Mostra,
   linha por linha, se cada leitura foi encontrada corretamente.
3. **PASSO 3. Geração do artefato dataset iHerbSpec** — só fica disponível
   quando os passos 1 e 2 estiverem 100% conferidos. Antes de clicar em
   **Gerar artefatos**, este passo também tem:
   - **Pasta de saída** (opcional) — por padrão, usa a mesma pasta de
     entrada.
   - **Nome do artefato** (opcional) — vira o nome da pasta de saída e o
     prefixo das duas pastas de artefato geradas. Deixe em branco para usar
     o nome padrão.
   - **Gerar também o artefato limpo (cleaned)** — checkbox marcado por
     padrão. O artefato bruto é sempre gerado; desmarcar esta opção pula o
     processamento de limpeza/unificação das leituras (mais rápido, mas sem
     a pasta `cleaned/` nem os gráficos do relatório — ver
     [Artefato de saída](../saida/index.md)).
   - **Equipamento** — combobox para sobrepor manualmente a detecção
     automática, útil se o campo `instrumentModel` da planilha não for
     reconhecido (ver [Correspondência entre planilha e leituras](../coleta/correspondencia-arquivos.md)).

Um console lateral acompanha o processamento em tempo real, e pode ser
ocultado/mostrado a qualquer momento.

Se o lote tiver algum problema que impeça a geração (linha inválida, arquivo
faltando, arquivo não reconhecido), **nenhuma pasta de artefato é criada** —
em vez disso, um relatório de rejeição explica exatamente o que precisa ser
corrigido (ver [Relatório de rejeição](../saida/relatorio-rejeicao.md)).
