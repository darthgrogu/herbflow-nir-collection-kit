# Coleta — visão geral

A coleta em si — como operar o equipamento, a ordem das medições, os cuidados
de cada tecido — depende do **protocolo de cada projeto ou herbário** e do
modelo de equipamento. Este guia **não prescreve** esse procedimento: ele varia
demais entre projetos, e cada equipe já segue o seu.

O que importa para o *fluxo* funcionar, independente do protocolo de coleta,
são duas coisas:

1. **Salvar as leituras na pasta `readings/`** — aquela que fica ao lado da
   planilha (ver [A pasta de leituras](../planilha/pasta-de-leituras.md)). No
   software do equipamento, aponte o destino de salvamento para ela.
2. **Garantir a correspondência do `filename_prefix`** — para cada leitura, o
   valor da coluna `filename_prefix` na planilha precisa corresponder ao(s)
   arquivo(s) que o equipamento gera. É esse casamento que permite a
   [conversão](../parser/index.md) juntar cada linha da planilha com suas
   leituras. É a peça crítica da coleta para o fluxo, e tem página própria:
   [Correspondência entre a planilha e as leituras](correspondencia-arquivos.md).

> É só isso que o fluxo exige da coleta. O detalhe de *como* cada herbário
> coleta fica com a equipe local; aqui a peça crítica é a correspondência entre
> a planilha e os arquivos gerados.

Uma coleta real, feita nesses termos, está demonstrada em
[Coleta real: iHerbSpec + InnoSpectra + INPA](exemplo-inpa.md) — o exemplo
principal deste guia, e a origem dos datasets de exemplo do pacote. Outros
protocolos/artigos que usem este fluxo também aparecem lá, ao final.

!!! note "Coleta ≠ artefato final"
    O que sai da coleta (planilha + `readings/`) é dado **bruto**, sem
    protocolo nenhum aplicado ainda. É só na conversão que os dados passam a
    seguir a gramática de um protocolo (hoje, o iHerbSpec) — ver
    [Artefato de saída](../saida/index.md) para essa distinção completa.
