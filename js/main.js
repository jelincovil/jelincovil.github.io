document.addEventListener("DOMContentLoaded", () => {
  const reduceMotion = window.matchMedia("(prefers-reduced-motion: reduce)").matches;

  /* ── Filtros de proyectos ─────────────────────────────── */
  const buttons = document.querySelectorAll(".filter-btn");
  const cards = document.querySelectorAll(".project-card");

  // Rellenar contadores por categoría
  document.querySelectorAll(".filter-count").forEach((el) => {
    const key = el.dataset.countFor;
    const n = key === "all"
      ? cards.length
      : [...cards].filter((c) => c.dataset.type === key).length;
    el.textContent = n;
  });

  buttons.forEach((btn) => {
    btn.addEventListener("click", () => {
      const filter = btn.dataset.filter;

      buttons.forEach((b) => {
        const active = b === btn;
        b.classList.toggle("active", active);
        b.setAttribute("aria-pressed", String(active));
      });

      cards.forEach((card) => {
        const show = filter === "all" || card.dataset.type === filter;
        card.classList.toggle("hidden", !show);
      });
    });
  });

  /* ── Contadores animados en el hero ───────────────────── */
  const counters = document.querySelectorAll(".stat-number");

  const renderCount = (el, value) => {
    el.textContent = value + (el.dataset.suffix || "");
  };

  if (reduceMotion || !("IntersectionObserver" in window)) {
    counters.forEach((el) => renderCount(el, Number(el.dataset.target)));
  } else {
    const io = new IntersectionObserver(
      (entries) => {
        entries.forEach((entry) => {
          if (!entry.isIntersecting) return;
          const el = entry.target;
          const target = Number(el.dataset.target);
          const duration = 1100;
          const start = performance.now();

          const tick = (now) => {
            const p = Math.min((now - start) / duration, 1);
            const eased = 1 - Math.pow(2, -10 * p);
            renderCount(el, Math.round(target * (p === 1 ? 1 : eased)));
            if (p < 1) requestAnimationFrame(tick);
          };

          requestAnimationFrame(tick);
          io.unobserve(el);
        });
      },
      { threshold: 0.6 }
    );

    counters.forEach((el) => io.observe(el));
  }

  /* ── Año vigente en el footer ─────────────────────────── */
  const yearEl = document.getElementById("year");
  if (yearEl) yearEl.textContent = String(new Date().getFullYear());
});
