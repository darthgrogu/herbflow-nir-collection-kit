# Comece por aqui

Esta página serve a dois propósitos: entender o **fluxo completo** de ponta a
ponta e, logo em seguida, rodar um **primeiro teste real** — usando os dados de
exemplo que já vêm no pacote, sem coletar nada e sem precisar de equipamento.

## Visão geral do fluxo

![Fluxo: planilha, coleta em campo, pasta de leituras, gerador de artefato, duas pastas de saída](assets/diagrams/diagrama-fluxo.svg)

O caminho completo tem 4 etapas, sempre nesta ordem:

1. **Planilha (metadados)** — você abre `herbflow_iHerbSpec.xlsm`, configura a
   sessão e os espécimes, gera a tabela de coleta e define a pasta `readings/`
   ao lado da planilha. Ver [1. Planilha (metadados)](planilha/index.md).
2. **Coleta** — com a planilha como guia, você opera o equipamento espectral e
   salva cada leitura na pasta `readings/`. Ver [2. Coleta](coleta/index.md).
3. **Conversão (Parser)** — o gerador de artefato lê a planilha + a pasta de
   leituras e converte tudo. Ver [3. Conversão (Parser)](parser/index.md).
4. **Artefato de saída** — duas pastas: uma com os dados **brutos** (arquivos
   originais, só renomeados) e outra com os dados **limpos** (leituras
   unificadas, prontas para análise). Ver
   [4. Artefato de saída](saida/index.md).

> As duas ferramentas nunca trocam dado diretamente — é sempre você quem leva
> a informação de uma pra outra (a planilha preenchida + a pasta de leituras).
> Isso é de propósito nesta fase de teste.

## Primeiro teste, usando datasets de exemplo

A pasta `dataset_exemplo/` traz dois datasets reais prontos, um por equipamento
suportado — dá para testar o gerador de artefato sem precisar coletar nada:

- **`dataset_exemplo/innospectra-nir-s-g1/`** — planilha (`metadata.xlsm`) +
  leituras (`readings/`) de uma coleta real completa (14 espécimes, 88
  leituras).
- **`dataset_exemplo/fieldspec/`** — planilha (`metadata.xlsx`) + leituras
  reais de um segundo equipamento suportado (ASD FieldSpec).

!!! warning "Dataset do FieldSpec tem campos placeholder"
    Alguns campos da planilha de exemplo do FieldSpec são **placeholders**
    (valores ainda não confirmados): `targetClass`, `backgroundClass`,
    `instrumentModel`/`instrumentSerialNumber` e `sessionId`. Sirva-se deste
    dataset só para ver o fluxo funcionando com este equipamento — não como
    referência de como preencher esses campos numa coleta real.

Passo a passo, com qualquer um dos dois datasets:

1. Abra `iherbspec_parser.exe`.
2. Em "PASSO 1. Planilha de metadados", escolha a planilha do dataset
   (`metadata.xlsm` ou `metadata.xlsx`).
3. O programa detecta a pasta `readings/` automaticamente (ela está do lado
   da planilha) e mostra o resultado da conferência.
4. Em "PASSO 3. Geração do artefato dataset iHerbSpec", escolha uma pasta de
   saída e clique em gerar.

Pronto — você já viu o fluxo completo funcionando antes de fazer sua própria
coleta. Para entender o que foi gerado, veja
[Artefato de saída](saida/index.md).
