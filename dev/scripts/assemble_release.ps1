# Monta o zip de release do herbflow NIR Collection Kit a partir dos DOIS builds já
# prontos (o .xlsm do herbflow-excel e o .exe do pytkinter_iherbspec_parser).
# Este script NÃO builda nenhum dos dois (cada build é um passo manual, feito no
# repo de origem — ver CLAUDE.md de cada um) e NÃO publica nada — só produz o
# zip local em release/.
#
# Uso (a partir de qualquer diretório, o script resolve os caminhos sozinho):
#   powershell -File dev/scripts/assemble_release.ps1 -Version "v0.1-teste"

param(
    [Parameter(Mandatory = $true)]
    [string]$Version
)

$ErrorActionPreference = "Stop"

# Este script mora em dev/scripts/ (decisão de 2026-07-20: reorganização de repo,
# ferramentaria de empacotamento/documentação agrupada em dev/ pra não confundir
# quem só quer baixar o release) — dois níveis acima daqui é a raiz do repo.
$RepoRoot   = (Resolve-Path "$PSScriptRoot/../..").Path
$HerbflowWorkbooks = Join-Path $RepoRoot "herbflow-excel/workbooks"
$ParserDist        = Join-Path $RepoRoot "pytkinter_iherbspec_parser/dist"
# decisão de 2026-07-18: os dois datasets de exemplo (um por equipamento
# suportado) entram no zip -- sample_data/ tem uma subpasta por equipamento
# desde 2026-07-17. Nome da pasta de destino de cada um dentro do zip é
# distinto do nome da pasta de origem (decisão do mantenedor): o InnoSpectra
# leva o modelo real no nome (NIR-S-G1, confirmado no dataset);  o FieldSpec
# mantém "fieldspec" só por enquanto -- o mantenedor ainda vai confirmar o
# nome do modelo real desse equipamento.
$SampleDataSets = @(
    @{ Source = Join-Path $RepoRoot "pytkinter_iherbspec_parser/sample_data/innospectra micronir"
       DestName = "innospectra-nir-s-g1"
       MetadataFile = "metadata.xlsm" },
    @{ Source = Join-Path $RepoRoot "pytkinter_iherbspec_parser/sample_data/fieldspec"
       DestName = "fieldspec"
       MetadataFile = "metadata.xlsx" }
)
$GuideSource = Join-Path $RepoRoot "dev/mkdocs/site-release"
# decisão de 2026-07-19: o guia deixou de ser um guia-de-uso.html de arquivo
# único (gerado por docs/build_guide.py) e virou um site MkDocs. IMPORTANTE
# (ver CLAUDE.md §8.3): usa `dev/mkdocs/site-release/`, não `dev/mkdocs/site/`
# -- são DUAS variantes de build a partir do mesmo mkdocs.yml. `site/` (via
# `mkdocs build` normal) é a variante "online" (URLs limpas, busca ligada),
# usada pro GitHub Pages. `site-release/` (via `python -m mkdocs build
# -f dev/mkdocs/mkdocs.release.yml -d dev/mkdocs/site-release`, rodado da raiz
# do repo) é a variante offline-safe (URLs de arquivo .html diretas, sem busca)
# que o zip de release exige.
#
# decisão de 2026-07-20 (reorganização do zip de release): o build do guia vai
# pro zip como `src/` (nome neutro, não é o que o usuário abre diretamente) na
# RAIZ do pacote -- não mais aninhado como `guia-de-uso/`. Quem baixa o zip vê
# só o atalho `Guia de Uso.html` (gerado abaixo, redireciona pra
# `src/index.html` via meta-refresh, funciona offline por file://) -- `src/`
# é implementação, não precisa ser aberta diretamente.
#
# README.md do repositório NÃO entra no zip (decisão de 2026-07-18): é a
# landing page do GitHub, direciona pro download -- estranho pedir pro
# testador abrir um .md local depois de já ter baixado o pacote. Toda a
# introdução/instrução que importa pra quem baixou já está no guia dentro do zip.

$PackageName = "herbflow-nir-collection-kit-$Version"
$ReleaseRoot = Join-Path $RepoRoot "release"
$PackageDir  = Join-Path $ReleaseRoot $PackageName
$ZipPath     = Join-Path $ReleaseRoot "$PackageName.zip"

# --- 1. Localizar o .xlsm buildado -----------------------------------------
# Nome canônico é herbflow_iHerbSpec.xlsm (saída de build_excel.py). Se não
# existir com esse nome exato, aceita qualquer herbflow_iHerbSpec*.xlsm mais
# recente na pasta workbooks/ (ex.: cópias versionadas manualmente), avisando.
$xlsmCandidate = Join-Path $HerbflowWorkbooks "herbflow_iHerbSpec.xlsm"
if (-not (Test-Path $xlsmCandidate)) {
    $fallback = Get-ChildItem -Path $HerbflowWorkbooks -Filter "herbflow_iHerbSpec*.xlsm" -ErrorAction SilentlyContinue |
        Sort-Object LastWriteTime -Descending | Select-Object -First 1
    if ($null -eq $fallback) {
        Write-Error "Nenhum .xlsm buildado encontrado em $HerbflowWorkbooks. Rode build_excel.py no repo herbflow-excel primeiro."
        exit 1
    }
    Write-Warning "Nome canônico 'herbflow_iHerbSpec.xlsm' não encontrado — usando '$($fallback.Name)' em vez disso."
    $xlsmCandidate = $fallback.FullName
}

# --- 2. Localizar o .exe buildado -------------------------------------------
$exeCandidate = Join-Path $ParserDist "iherbspec_parser.exe"
if (-not (Test-Path $exeCandidate)) {
    Write-Error "iherbspec_parser.exe não encontrado em $ParserDist. Rode o build do PyInstaller no repo pytkinter_iherbspec_parser primeiro."
    exit 1
}

# --- 3. Confirmar os dois datasets de exemplo -------------------------------
foreach ($ds in $SampleDataSets) {
    $meta = Join-Path $ds.Source $ds.MetadataFile
    $readings = Join-Path $ds.Source "readings"
    if (-not (Test-Path $meta) -or -not (Test-Path $readings)) {
        Write-Error "Dataset de exemplo incompleto em $($ds.Source) (esperado: $($ds.MetadataFile) + readings/)."
        exit 1
    }
}
if (-not (Test-Path $GuideSource) -or -not (Test-Path (Join-Path $GuideSource "index.html"))) {
    Write-Error "dev/mkdocs/site-release/ (build offline do MkDocs) nao encontrado ou incompleto -- rode 'python -m mkdocs build -f dev/mkdocs/mkdocs.release.yml -d site-release' na raiz do repo primeiro (requer 'pip install -r dev/mkdocs/requirements-docs.txt'; nota: -d e resolvido relativo ao mkdocs.yml, nao ao diretorio atual, por isso e so 'site-release' aqui, nao 'dev/mkdocs/site-release'). Nao confundir com 'python -m mkdocs build -f dev/mkdocs/mkdocs.yml', que gera dev/mkdocs/site/ (variante online, nao serve pro zip)."
    exit 1
}

# --- 4. Montar a pasta de release -------------------------------------------
if (Test-Path $PackageDir) {
    Remove-Item -Recurse -Force $PackageDir
}
New-Item -ItemType Directory -Force -Path $PackageDir | Out-Null

Copy-Item $xlsmCandidate (Join-Path $PackageDir "herbflow_iHerbSpec.xlsm")
Copy-Item $exeCandidate (Join-Path $PackageDir "iherbspec_parser.exe")
Copy-Item -Recurse $GuideSource (Join-Path $PackageDir "src")

# Atalho na raiz do pacote -- só português por ora (decisão de 2026-07-20: o
# guia em si ainda não tem conteúdo real em inglês/espanhol, o seletor de
# idioma no banner existe mas as opções extras estão desabilitadas -- nomear o
# atalho em duas línguas prometeria um conteúdo que ainda não existe).
# Array-de-linhas em vez de here-string (@'...'@): este repo usa quebra de
# linha LF (.gitattributes: eol=lf), e o parser de here-string do PowerShell
# 5.1 é frágil com LF puro. Array + -join evita esse problema por completo.
$shortcutHtmlLines = @(
    '<!doctype html>'
    '<html lang="pt-BR">'
    '<head>'
    '<meta charset="utf-8" />'
    '<meta http-equiv="refresh" content="0; url=src/index.html" />'
    '<title>Guia de Uso - herbflow NIR Collection Kit</title>'
    '</head>'
    '<body>'
    '<p>Abrindo o guia de uso... Se nada acontecer, <a href="src/index.html">clique aqui</a>.</p>'
    '</body>'
    '</html>'
)
# [System.IO.File]::WriteAllText em vez de Set-Content -Encoding utf8: no
# Windows PowerShell 5.1, "-Encoding utf8" sempre grava um BOM -- inofensivo
# pra maioria dos navegadores, mas evitavel; UTF8Encoding($false) garante
# nenhum BOM no .html gerado.
$shortcutPath = Join-Path $PackageDir "Guia de Uso.html"
[System.IO.File]::WriteAllText($shortcutPath, ($shortcutHtmlLines -join "`n"), (New-Object System.Text.UTF8Encoding $false))

foreach ($ds in $SampleDataSets) {
    $destDir = Join-Path $PackageDir "dataset_exemplo/$($ds.DestName)"
    New-Item -ItemType Directory -Force -Path $destDir | Out-Null
    Copy-Item (Join-Path $ds.Source $ds.MetadataFile) (Join-Path $destDir $ds.MetadataFile)
    Copy-Item -Recurse (Join-Path $ds.Source "readings") (Join-Path $destDir "readings")
}

# --- 5. Compactar ------------------------------------------------------------
if (Test-Path $ZipPath) {
    Remove-Item -Force $ZipPath
}
Compress-Archive -Path "$PackageDir/*" -DestinationPath $ZipPath

Write-Host "Release pronta: $ZipPath"
