# Dicionário de campos

Esta página lista todos os campos da planilha de metadados, com a mesma
descrição usada pela planilha em si — o menu **Comentários dos Campos**
(ver [Usando o menu iHerbSpec](usando-o-menu.md)) aplica exatamente estes
textos como Nota do Excel em cada cabeçalho de coluna, em três idiomas
(Português, Español, English). Aqui só a versão em português está reunida
num só lugar, junto com o protocolo de origem de cada campo.

!!! info "Base do protocolo"
    A planilha segue o **iHerbSpec Protocol v1.2.1**. A maioria dos campos
    vem diretamente dele; alguns poucos são campos próprios do HerbFlow/INPA,
    sinalizados na coluna **Protocolo** abaixo.

## Campos preenchidos por leitura

Estes campos variam linha a linha, conforme o espécime/tecido/classe de
alvo de cada leitura — a maioria é preenchida automaticamente pelo motor de
expansão de lote (**Criar Tabela por LOTE**), a partir do que você configura
em **Gerenciar Espécimes**.

| Campo | Protocolo | Obrigatório | Tipo | Descrição |
|---|---|---|---|---|
| `targetClass` | iHerbSpec v1.2.1 | Obrigatório | ENUM | Texto livre ou código numerado dos Códigos de Classe Alvo (Tabela 4.5) descrevendo o tipo de tecido ou fundo que está sendo medido. Podem ser usados tanto códigos abreviados quanto códigos completos. |
| `measurementIndex` | iHerbSpec v1.2.1 | Obrigatório | TEXT | O índice do número de medição é anexado ao nome do arquivo base (Parte 3, Tabela 3.2: IDX) para associar corretamente cada linha de metadados ao seu respectivo arquivo de medição. |
| `herbariumCode` | iHerbSpec v1.2.1 | Obrigatório | TEXT | Acrônimo para herbário ou coleção (código Index Herbariorum). |
| `specimenId` | iHerbSpec v1.2.1 | Obrigatório | TEXT | Identificador único da amostra ou registro. |
| `specimenIdDescription` | iHerbSpec v1.2.1 *(nome provisório)* | Obrigatório | TEXT | Tipo de identificador único da amostra ou registro. |
| `scientificName` | iHerbSpec v1.2.1 | Opcional | TEXT | Nome científico completo no nível de confiança mais baixo. |
| `identificationQualifier` | iHerbSpec v1.2.1 | Opcional | TEXT | Incerteza na identificação taxonômica (Darwin Core). |
| `identifiedBy` | iHerbSpec v1.2.1 | Opcional | TEXT | Pessoa/grupo que fez a identificação. |
| `dateIdentified` | iHerbSpec v1.2.1 | Opcional | TEXT | Data de identificação. |
| `isTempControlled` | iHerbSpec v1.2.1 | Opcional | BOOLEAN | O armazenamento possui controle ativo de temperatura? |
| `annualTempMin` | iHerbSpec v1.2.1 | Opcional | NUMERIC | Temperatura mínima anual de armazenamento (°C). |
| `annualTempMax` | iHerbSpec v1.2.1 | Opcional | NUMERIC | Temperatura máxima anual de armazenamento (°C). |
| `isHumidityControlled` | iHerbSpec v1.2.1 | Opcional | BOOLEAN | O armazenamento possui controle ativo de umidade? |
| `annualHumidityMin` | iHerbSpec v1.2.1 | Opcional | NUMERIC | Umidade relativa mínima anual de armazenamento (%). |
| `annualHumidityMax` | iHerbSpec v1.2.1 | Opcional | NUMERIC | Umidade relativa máxima anual de armazenamento (%). |
| `isMounted` | :material-flag-variant-outline: **HerbFlow (INPA)** | Opcional | BOOLEAN | Campo próprio (não é do protocolo iHerbSpec): a amostra já está montada em exsicata, ou ainda está solta (não costurada na cartolina do herbário)? |
| `targetTissueId` | iHerbSpec v1.2.1 | Opcional | TEXT | Índice de caracteres que rastreia as unidades de tecido medidas quando vários tecidos são medidos a partir de uma única amostra (ex.: twig1, twig2). |
| `tissueDevelopmentalStage` | iHerbSpec v1.2.1 | Obrigatório | ENUM | Estágio de desenvolvimento do tecido, conforme codificado na Tabela 4.4 de Códigos de Classe de Estágio de Desenvolvimento. |
| `hasGlue` | iHerbSpec v1.2.1 | Obrigatório | ENUM | Verdadeiro/Falso/Incerto: presença de cola na área de medição. |
| `hasNonGlueContamination` | iHerbSpec v1.2.1 | Obrigatório | ENUM | Valores verdadeiros, falsos ou incertos que indicam a presença de um contaminante diferente de cola na área de medição. |
| `tissueNotes` | iHerbSpec v1.2.1 | Opcional | TEXT | Texto livre para observações adicionais sobre a condição da amostra que possam auxiliar na interpretação dos dados espectrais. |
| `tissueLocation` | iHerbSpec v1.2.1 | Opcional | TEXT (coordenadas) | Localização do tecido alvo na lâmina de herbário — coordenada X,Y em centímetros, com 0,0 no canto superior esquerdo. |
| `backgroundClass` | iHerbSpec v1.2.1 | Obrigatório | ENUM | Código abreviado enumerado da Tabela 4.7 de Códigos de Classe de Fundo, descrevendo o tipo de fundo usado atrás do tecido alvo. |
| `hasLowReflectanceBackground` | iHerbSpec v1.2.1 | Obrigatório | BOOLEAN | Verdadeiro ou falso: a afirmação de que o fundo possui baixa refletância (menos de 4% em toda a faixa espectral do instrumento) é falsa. |
| `backgroundDescription` | iHerbSpec v1.2.1 | Obrigatório | TEXT | Descrição do material de fundo preto ou de outra cor, incluindo fabricante/produto quando disponível. |
| `hasBackgroundInMeasurement` | iHerbSpec v1.2.1 | Obrigatório | BOOLEAN | Indica que o tecido alvo não cobre toda a área de medição e que o fundo faz parte da medição. |
| `percentBackgroundInMeasurement` | iHerbSpec v1.2.1 | Opcional | INTEGER | Estimativa numérica da porcentagem da área de medição correspondente ao material de fundo. |
| `measurementFlags` | iHerbSpec v1.2.1 | Opcional | ENUM | Descritores categóricos padronizados da condição do tecido (Tabela 4.6); múltiplos valores separados por uma barra vertical (`|`). |
| `comment` | iHerbSpec v1.2.1 | Opcional | TEXT | Texto livre para quaisquer notas adicionais relevantes à medição. |

## Campos preenchidos automaticamente (sessão + geração de nome)

Estes campos não variam por linha — 14 deles vêm de um valor único,
definido uma vez em **Configurar Sessão/Instrumento** e copiado
automaticamente para todas as linhas. A exceção é `filename_prefix`
(marcada abaixo): esse é **calculado por linha**, não copiado da
configuração — ver nota ao final da tabela.

| Campo | Protocolo | Obrigatório | Tipo | Descrição |
|---|---|---|---|---|
| `instrumentName` | :material-flag-variant-outline: **HerbFlow (INPA)** | Opcional | TEXT | Nome/identificador do instrumento configurado para a sessão. |
| `projectId` | iHerbSpec v1.2.1 | Obrigatório | TEXT | Identificador único para o projeto de medição espectral. |
| `sessionId` | iHerbSpec v1.2.1 | Obrigatório | TEXT | Identificador único para uma sessão de medição, gerado no formato AAAAMMDDHHMM. |
| `operator` | iHerbSpec v1.2.1 | Opcional | TEXT | Nome(s) da(s) pessoa(s) que realizaram as medições. |
| `instrumentModel` | iHerbSpec v1.2.1 | Obrigatório | TEXT | Nome do modelo do espectrômetro. |
| `instrumentSerialNumber` | iHerbSpec v1.2.1 | Opcional | TEXT | Número de série do espectrômetro. |
| `opticalSetupDescription` | iHerbSpec v1.2.1 | Obrigatório | TEXT | Descrição da configuração da sonda óptica. |
| `measurementSettings` | iHerbSpec v1.2.1 | Obrigatório | TEXT | Configurações do instrumento para as medições. |
| `whiteReferenceDescription` | iHerbSpec v1.2.1 | Obrigatório | TEXT | Material da referência branca. |
| `lightSourceType` | iHerbSpec v1.2.1 | Opcional | TEXT | Fonte de luz para a configuração óptica. |
| `distanceTargetToSensor` | iHerbSpec v1.2.1 | Opcional | NUMERIC | Distância (mm) entre o tecido alvo e a face do sensor. |
| `lensFieldOfView` | iHerbSpec v1.2.1 | Opcional | NUMERIC | Ângulo (graus) do campo de visão do sensor. |
| `angleLightToSensor` | iHerbSpec v1.2.1 | Opcional | NUMERIC | Ângulo (graus) da fonte de luz em relação ao sensor. |
| `measurementAreaDiameter` | iHerbSpec v1.2.1 | Opcional | NUMERIC | Diâmetro (mm) da área do tecido iluminado. |
| `filename_prefix` :material-star-four-points-outline: | :material-flag-variant-outline: **HerbFlow (INPA)** | Obrigatório | TEXT | Prefixo **interno** que cria o vínculo (busca reversa) entre a linha de metadados e os arquivos físicos gerados pelo equipamento. **Não** é o nome de arquivo final do protocolo iHerbSpec — esse é construído depois, na saída do gerador de artefato (ver [Correspondência entre planilha e leituras](../coleta/correspondencia-arquivos.md)). |

!!! note ":material-star-four-points-outline: `filename_prefix` é calculado, não copiado"
    Diferente dos outros 14 campos desta tabela, `filename_prefix` é
    recalculado **a cada linha**, a partir do espécime/classe/índice daquela
    leitura específica — nunca é um valor fixo copiado da tela de
    Configuração.

## O que é campo do protocolo e o que é próprio do HerbFlow

- **iHerbSpec v1.2.1** — vem do protocolo oficial, extraído diretamente da
  planilha de referência usada pelos testers do projeto.
- **HerbFlow (INPA)** — campo que este projeto adicionou por necessidade
  prática, sem existir (ainda) no protocolo oficial: `filename_prefix`
  (chave de busca interna), `instrumentName` (rótulo do instrumento) e
  `isMounted` (se a exsicata já está montada).
- **`specimenIdDescription`** é um caso intermediário: nasceu de feedback de
  campo e reflete um qualificador que o próprio protocolo está considerando
  — o nome ainda pode mudar numa revisão futura do iHerbSpec.

## Novidades recentes

Registro rápido do que mudou desde a primeira versão do template, para quem
já usou a planilha antes:

- **`isMounted`** e o código de tecido **`TG` (Twig/Galho)** são campos
  novos, adicionados a partir de feedback de coleta real.
- **`specimenIdDescription`** é o nome atual do campo que já foi chamado de
  `specimenIdType` — mesmo significado, só o rótulo mudou.
- **`referenceSerialNumber`** (serial do padrão de referência calibrado) foi
  removido temporariamente do template — não é um campo esperado no momento.
