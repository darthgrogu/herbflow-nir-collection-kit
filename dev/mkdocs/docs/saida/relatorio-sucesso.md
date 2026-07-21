# Relatório de sucesso (RELATORIO.html)

Quando o lote é **aceito**, o gerador escreve um único `RELATORIO.html`, ao
lado das duas pastas de artefato — um documento autocontido (abre direto no
navegador, sem precisar de internet), organizado em **3 páginas**:

1. **Sobre este artefato** — a página inicial. Explica o que cada parte do
   artefato significa (não muda entre rodadas) e traz dois cartões que já
   levam direto para as outras duas páginas.
2. **Log de conversão** — o que aconteceu durante o processo: inventário
   ("Resumo"), qualquer ocorrência que vale atenção ("Avisos e Erros") e a
   tabela "Equipamento e faixa espectral". Existe **sempre**, mesmo num lote
   só bruto (sem artefato limpo).
3. **Relatório Espectral** — os gráficos de exploração dos dados. Só existe
   quando há artefato **limpo** no lote (ver aviso abaixo) — se não houver,
   essa página nem aparece.

Um **seletor de idioma** (Português / English / Español) no topo troca o
texto da interface em tempo real, sem recarregar a página.

!!! warning "Traduções em rascunho"
    O português é a versão de referência. As versões em inglês e espanhol
    ainda são um rascunho, ainda não revisado — trate como "quase lá", não
    como texto final.

## "Log de conversão" — o que aconteceu no processo

- **Resumo** — quantas leituras, quantas sessões, faixa espectral coberta.
- **Avisos e Erros** — qualquer ocorrência que não impediu a geração mas
  vale a atenção (ex.: leitura sem arquivo de reflectância, aviso de
  configuração regional do Windows afetando números decimais).
- **Equipamento e faixa espectral** — uma tabela com a faixa de comprimento
  de onda, passo e número de pontos por modelo de equipamento presente no
  lote (útil principalmente quando o lote mistura mais de um equipamento).

## "Relatório Espectral" — os dados do lote, em gráfico

Visão geral de todas as leituras, por espécie, por espécime, e uma curva de
divergência entre espécies. Duas abas permitem alternar entre absorbância e
reflectância.

!!! info "Os gráficos vêm só do artefato limpo"
    Todo gráfico desta página é construído a partir da camada **limpa**
    (unificada) das leituras — se você desmarcou "Gerar também o artefato
    limpo" no passo 3 do gerador, o lote ainda é aceito e o `RELATORIO.html`
    ainda sai, só que **sem a página Relatório Espectral** (não há dado
    espectral processado para plotar).

**Esta página pode ser baixada em PDF** — um botão fixo "Exportar PDF" (usa
a função de impressão do próprio navegador, sem precisar de nenhum programa
extra) gera um PDF só com o conteúdo dela, pronto para compartilhar.

O relatório também traz um cabeçalho fixo lembrando que esta é uma
**versão de teste** do kit — não um produto final; esse aviso continua
visível mesmo no PDF exportado, de propósito.

Ver também: [Limitações conhecidas](limitacoes.md), para os casos em que
partes do relatório se comportam de forma diferente do esperado (ex.: lote
com mais de um equipamento).
