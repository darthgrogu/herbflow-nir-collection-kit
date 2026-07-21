# Relatório de rejeição (RELATORIO_REJEICAO.md)

Quando o lote **não é aceito**, o gerador escreve `RELATORIO_REJEICAO.md` na
pasta de saída, em vez de qualquer pasta de artefato.

!!! note "Ainda é texto simples (Markdown), não HTML"
    Diferente do relatório de sucesso ([RELATORIO.html](relatorio-sucesso.md)),
    o relatório de rejeição ainda é um arquivo `.md` simples — sem menu, sem
    gráficos, sem seletor de idioma. É só texto, mas abre em qualquer editor
    de texto e já traz o essencial: por que o lote foi rejeitado.

O relatório lista exatamente os motivos do bloqueio — por exemplo:

- Linha da planilha inválida (campo obrigatório vazio, chave de busca
  duplicada).
- Arquivo de leitura faltando para alguma linha.
- Arquivo encontrado, mas não reconhecido/não conseguiu ser lido.

A regra do gerador é rígida aqui: **qualquer um** desses motivos, mesmo numa
única linha, rejeita o lote inteiro — não é aceito "gerar o que der certo e
avisar sobre o resto". Corrija o que o relatório apontar e rode de novo.
