# Conversão (Parser) — visão geral

O gerador de artefato (`iherbspec_parser.exe`) é a ferramenta que junta a
planilha preenchida com a pasta `readings/` e produz o artefato final de
dados — organizado, com a nomenclatura do protocolo de referência (hoje o
**iHerbSpec**), e com um relatório detalhado do que foi processado.

> É aqui que o protocolo entra em cena. Hoje a conversão segue o iHerbSpec,
> mas é o parser que dá forma ao artefato — adaptá-lo a outros protocolos
> (outros campos, outra gramática de saída) é uma capacidade a ser ampliada
> nos próximos testes.

Ele roda como uma janela única, com **3 passos sequenciais** que precisam ser
conferidos antes de gerar. Ver [Passo a passo](passo-a-passo.md).

Quer testar o gerador sem coletar nada primeiro? Veja o
[test-drive com os datasets de exemplo](../test-drive.md).
