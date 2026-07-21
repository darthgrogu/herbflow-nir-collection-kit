# Pasta de imagens (capturas de tela)

Convenção: uma subpasta por seção de topo do guia, espelhando as pastas de
`docs/` (`planilha/`, `coleta/`, `parser/`, `saida/`) — a subpasta pode
não existir ainda no git (pastas vazias não são versionadas), crie-a ao
salvar a primeira imagem daquela seção.

```
assets/images/
├── planilha/
│   └── menu_planilha_suplementos.png
├── coleta/
├── parser/
└── saida/
```

Referencie com sintaxe Markdown padrão, ajustando o `../` conforme a
profundidade da página (uma página em `docs/planilha/*.md` usa `../assets/…`;
uma em `docs/*.md` direto usa `assets/…`, sem subir nível):

```markdown
![Menu iHerbSpec na aba Suplementos do Excel](../assets/images/planilha/menu_planilha_suplementos.png)
```

**Escreva o alt text de verdade** (o texto entre `[ ]`) — é o que aparece se
a imagem não carregar e o que um leitor de tela lê em voz alta. Descreva o
que a captura mostra, não deixe o placeholder genérico.

Se o `mkdocs serve` avisar `"the target ... is not found among documentation
files"`, é só isso: o arquivo de imagem ainda não foi salvo nesse caminho —
a sintaxe do link já está certa, falta o arquivo em si.

Este `README.md` não entra na navegação do site (não está listado em `nav:`
no `mkdocs.yml`) — existe só para documentar a convenção.
