# Correspondência entre a planilha e as leituras

Esta é a peça crítica da coleta para o fluxo funcionar: para **cada leitura**,
o valor da coluna `filename_prefix` na planilha precisa **corresponder** ao(s)
arquivo(s) que o equipamento gera. É esse casamento que permite a
[conversão](../parser/index.md) juntar automaticamente cada linha da planilha
com suas leituras — sem você apontar arquivo por arquivo.

## O nome na planilha é um prefixo, não o nome final do arquivo

A coluna `filename_prefix` é o valor que identifica a linha — por exemplo
`INPA003_AB_0001`. Mas o **software do próprio equipamento**, ao salvar,
costuma acrescentar informação ao nome físico do arquivo (configuração do
equipamento, data e hora) — então o arquivo que aparece na pasta `readings/`
quase sempre tem um nome mais longo, por exemplo
`INPA003_AB_0001_FolHerbario_20260528_113525.csv`.

**Isso é esperado e não precisa de correção manual.** O gerador de artefato faz
uma **busca por prefixo**: procura em `readings/` todo arquivo cujo nome
*comece* com o valor de `filename_prefix`, não importa o que venha depois.

!!! tip "A regra prática, durante a coleta"
    Garanta que o começo do nome do arquivo salvo pelo equipamento seja
    exatamente o `filename_prefix` da linha correspondente. O que o
    equipamento acrescenta depois (carimbo de data, config) pode ficar — só o
    **prefixo** precisa bater. Não renomeie os arquivos: deixe-os como o
    equipamento salvou.

## Uma leitura pode gerar um ou vários arquivos

A correspondência não é sempre 1-para-1 — depende do equipamento:

### InnoSpectra (NIR-S-G1)

Para um mesmo `filename_prefix`, o equipamento pode gerar até 5 arquivos,
todos com o mesmo prefixo:

| Arquivo | Conteúdo | Entra no artefato limpo? |
|---|---|---|
| `<prefixo>....csv` (sem sufixo) | Arquivo base: comprimento de onda, absorbância e sinais brutos de referência/amostra | Sim |
| `<prefixo>..._r.csv` | Reflectância | Sim (unida ao base) |
| `<prefixo>..._a.csv` | Absorbância — redundante com o base | Não (preservado no bruto) |
| `<prefixo>..._i.csv` | Intensidade — redundante com o base | Não (preservado no bruto) |
| `<prefixo>....dat` | Formato binário próprio do fabricante | Não (preservado no bruto, nunca lido como espectro) |

Nem toda leitura vai ter os 5 — depende de quais opções estavam marcadas no
software do equipamento. O comum é sair pelo menos o arquivo base.

### ASD FieldSpec

Um único arquivo binário `.asd` por leitura — já traz o sinal do alvo e da
referência juntos, sem arquivos separados por sufixo.

## Misturando equipamentos no mesmo lote

O gerador de artefato decide qual equipamento usar olhando o campo
`instrumentModel` preenchido na planilha para cada linha — **não** a extensão
do arquivo. Um mesmo lote pode ter leituras dos dois equipamentos, desde que o
`instrumentModel` de cada linha esteja correto. Mais detalhes sobre
reconhecimento automático e correção manual em
[Passo a passo do parser](../parser/passo-a-passo.md).
