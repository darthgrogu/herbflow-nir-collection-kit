/* =========================================================================
   nav-zones.js — divide o menu lateral em zonas visuais (ver CLAUDE.md §8.5/§8.8)
   - Topo:  páginas de entrada (Início, Baixe o pacote, Comece por aqui)
   - Fluxo: os passos numerados "N. ..." (1. Planilha ... 4. Artefato de saída),
            cada um com sua própria cor (nav-flow-1..4) e um rótulo de zona
   - Resto: páginas soltas depois do fluxo (FAQ, Glossário, ...), sem destaque

   As zonas são detectadas pelo RÓTULO do item (os passos do fluxo começam com
   "N. "), não por posição fixa — então reordenar o nav em mkdocs.yml continua
   funcionando, desde que os passos do fluxo mantenham o prefixo numérico.

   Também força a zona do fluxo a abrir sozinha na PRIMEIRA visita (localStorage
   -- nunca de novo depois disso), sem usar navigation.expand (que reabria tudo
   a cada navegação, inclusive o que o usuário tinha fechado de propósito).

   Idempotente: pode rodar várias vezes sem duplicar rótulos. Puro DOM +
   classes CSS (estilos em assets/stylesheets/extra.css) — funciona offline.
   ========================================================================= */
(function () {
  var FIRST_VISIT_KEY = "herbflow-guide:flow-nav-opened";

  function labelText(item) {
    var node = item.querySelector(":scope > .md-nav__link, :scope > label");
    return node ? node.textContent.trim() : "";
  }

  function makeZoneLabel(title, hint) {
    var li = document.createElement("li");
    li.className = "md-nav__item nav-zonelabel";
    li.setAttribute("role", "presentation");
    li.textContent = title;
    if (hint) {
      var span = document.createElement("span");
      span.className = "nav-zonelabel__hint";
      span.textContent = hint;
      li.appendChild(span);
    }
    return li;
  }

  function openOnFirstVisit(flowItems) {
    var alreadyVisited;
    try {
      alreadyVisited = window.localStorage.getItem(FIRST_VISIT_KEY);
    } catch (e) {
      return; // localStorage indisponível (ex.: navegação privada restrita) -- não força nada
    }
    if (alreadyVisited) return;

    flowItems.forEach(function (el) {
      var toggle = el.querySelector(":scope > input.md-nav__toggle");
      if (toggle) toggle.checked = true;
    });

    try {
      window.localStorage.setItem(FIRST_VISIT_KEY, "1");
    } catch (e) {
      /* silencioso -- pior caso, abre de novo na próxima visita */
    }
  }

  function decorate() {
    var lists = document.querySelectorAll(
      ".md-sidebar--primary .md-nav--primary > .md-nav__list"
    );
    lists.forEach(function (list) {
      // Limpa marcações de uma execução anterior (idempotência).
      list.querySelectorAll(":scope > .nav-zonelabel").forEach(function (n) {
        n.remove();
      });

      var items = Array.prototype.slice.call(list.children).filter(function (el) {
        return (
          el.classList &&
          el.classList.contains("md-nav__item") &&
          !el.classList.contains("nav-zonelabel")
        );
      });
      items.forEach(function (el) {
        el.classList.remove(
          "nav-flow",
          "nav-flow--first",
          "nav-flow--last",
          "nav-flow-1",
          "nav-flow-2",
          "nav-flow-3",
          "nav-flow-4"
        );
      });

      var flow = items.filter(function (el) {
        return /^\d+\.\s/.test(labelText(el));
      });
      if (!flow.length) return;

      flow.forEach(function (el, i) {
        el.classList.add("nav-flow", "nav-flow-" + (i + 1));
        if (i === 0) el.classList.add("nav-flow--first");
        if (i === flow.length - 1) el.classList.add("nav-flow--last");
      });

      // Só o FLUXO ganha rótulo/destaque. As páginas depois dele (FAQ,
      // Glossário, etc.) ficam como "mais páginas associadas", sem rótulo
      // nem cor esmaecida (decisão de 2026-07-19) -- ver extra.css.
      list.insertBefore(
        makeZoneLabel("O fluxo", "siga na ordem, ponta a ponta"),
        flow[0]
      );

      openOnFirstVisit(flow);
    });
  }

  // document$ é o observable do Material (compatível com instant loading);
  // fallback para DOMContentLoaded quando ele não existir.
  if (window.document$ && typeof window.document$.subscribe === "function") {
    window.document$.subscribe(decorate);
  } else if (document.readyState !== "loading") {
    decorate();
  } else {
    document.addEventListener("DOMContentLoaded", decorate);
  }
})();
