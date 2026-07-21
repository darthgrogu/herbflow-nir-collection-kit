# Limitações conhecidas

Registro honesto do que ainda não funciona perfeitamente nesta versão de
teste — para você não gastar tempo achando que é erro seu.

- **Lote com mais de um equipamento**: a tabela "Equipamento e faixa
  espectral" (no Log de conversão) funciona bem com qualquer combinação. Mas
  os **gráficos do Relatório Espectral** hoje só mostram leituras do
  InnoSpectra — o FieldSpec/ASD usa nomes de coluna diferentes internamente
  (ex.: reflectância com outra unidade), então as leituras desse equipamento
  não aparecem nos gráficos, mesmo tendo dado espectral real. Isto é uma
  limitação conhecida, não um erro de processamento — a tabela e as duas
  pastas de artefato continuam corretas para os dois equipamentos.
- **Traduções em inglês/espanhol**: o seletor de idioma do `RELATORIO.html`
  já funciona, mas as duas traduções são rascunho — só o português foi
  revisado como final.
- **Texto dentro dos gráficos não traduz**: ao trocar o idioma, o título das
  seções muda, mas o texto desenhado dentro das imagens dos gráficos
  (eixos, legendas) continua em português — é uma limitação técnica dos
  gráficos serem gerados como imagem.
- **Sem grade espectral comum entre equipamentos**: se um lote tem leituras
  de equipamentos com faixas espectrais muito diferentes, alguns gráficos
  (faixa de dispersão, curva de divergência) são pulados para aquelas
  leituras em vez de mostrar uma comparação incorreta — o relatório avisa
  quando isso acontece, não falha silenciosamente.

Encontrou algo que não está nesta lista? É exatamente o tipo de coisa que
vale reportar — ver [Problemas conhecidos / feedback](../feedback.md).
