// Social preview image (OG) — 1280×640
#set page(width: 1280pt, height: 640pt, fill: rgb("#0d1b2a"), margin: 0pt)
#set text(font: "Inter", fill: rgb("#f5f3ec"))

#let gold = rgb("#d9a441")
#let cream = rgb("#f5f3ec")
#let muted = cream.transparentize(38%)
#let ink = rgb("#0d1b2a")
#let node-fill = rgb("#152a41")

#let node(cx, cy, r, label, latent: false) = {
  if latent {
    place(top + left, dx: cx - r, dy: cy - r,
      circle(radius: r, fill: none, stroke: (paint: cream.transparentize(30%), thickness: 2pt, dash: "dashed")))
  } else {
    place(top + left, dx: cx - r, dy: cy - r,
      circle(radius: r, fill: node-fill, stroke: 2pt + gold))
  }
  place(top + left, dx: cx - r, dy: cy - 13pt, box(width: 2 * r)[#align(center,
    text(font: "Georgia", size: 22pt, style: "italic", weight: "semibold", fill: cream, label))])
}

// ── Fondo: retícula + glow ─────────────────────────────────
#for x in range(1, 1280, step: 52) {
  place(top + left, dx: x * 1pt, dy: 0pt, line(start: (0pt, 0pt), end: (0pt, 640pt), stroke: 0.6pt + cream.transparentize(96%)))
}
#for y in range(1, 640, step: 52) {
  place(top + left, dx: 0pt, dy: y * 1pt, line(start: (0pt, 0pt), end: (1280pt, 0pt), stroke: 0.6pt + cream.transparentize(96%)))
}
#place(top + left, dx: 1020pt, dy: -260pt, circle(radius: 300pt, fill: gold.transparentize(91%), stroke: none))
#place(top + left, dx: -260pt, dy: 400pt, circle(radius: 280pt, fill: rgb("#0f4c81").transparentize(72%), stroke: none))

// ── Monograma ─────────────────────────────────────────────
#place(top + left, dx: 64pt, dy: 46pt,
  text(font: "Georgia", size: 28pt, weight: "bold")[JL#text(fill: gold)[.]])

// ── Columna izquierda ─────────────────────────────────────
#place(top + left, dx: 64pt, dy: 120pt,
  text(size: 15pt, weight: "semibold", fill: gold, tracking: 2.4pt)[JAIME LINCOVIL CURIVIL])

#place(top + left, dx: 64pt, dy: 144pt)[#set par(leading: 1.0em)
  #text(font: "Georgia", size: 62pt, weight: "semibold")[Inferencia causal\ que se puede\ #text(fill: gold, style: "italic")[verificar.]]]

#place(top + left, dx: 64pt, dy: 430pt,
  text(size: 17pt, fill: muted)[Ph.D. Estadística (USP)])
#place(top + left, dx: 64pt, dy: 453pt,
  text(size: 17pt, fill: muted)[Director del Centro de Inferencia Causal (UNI, Perú)])

#place(top + left, dx: 64pt, dy: 500pt,
  text(size: 16pt, fill: gold, weight: "semibold")[jelincovil.github.io])
#place(top + left, dx: 64pt, dy: 528pt,
  text(size: 13pt, fill: muted)[#("outliersj@gmail.com · github.com/jelincovil")])

// ── Tarjeta DAG (derecha): card en 736..1216, 118..498 ────
#place(top + left, dx: 736pt, dy: 118pt,
  box(width: 480pt, height: 380pt, radius: 20pt, fill: rgb("#152a41").transparentize(28%), stroke: 1pt + cream.transparentize(84%)))

// Aristas (detrás de los nodos)
#place(top + left, dx: 0pt, dy: 0pt, line(start: (872pt, 322pt), end: (1068pt, 322pt), stroke: 2pt + cream.transparentize(12%)))
#place(top + left, dx: 0pt, dy: 0pt, polygon((1068pt, 314pt), (1068pt, 330pt), (1086pt, 322pt), fill: cream.transparentize(12%)))
#place(top + left, dx: 0pt, dy: 0pt, line(start: (940pt, 206pt), end: (856pt, 290pt), stroke: (paint: cream.transparentize(38%), thickness: 1.6pt, dash: "dashed")))
#place(top + left, dx: 0pt, dy: 0pt, line(start: (1012pt, 206pt), end: (1098pt, 290pt), stroke: (paint: cream.transparentize(38%), thickness: 1.6pt, dash: "dashed")))

// Nodos
#node(976pt, 176pt, 32pt, "U", latent: true)
#node(840pt, 322pt, 32pt, "X")
#node(1116pt, 322pt, 32pt, "Y")

// Pie de tarjeta
#place(top + left, dx: 760pt, dy: 408pt,
  text(size: 12pt, fill: muted, tracking: 0.6pt)[proofs-to-python · seed 42])
#place(top + left, dx: 760pt, dy: 432pt,
  text(size: 14.5pt, fill: gold, weight: "semibold")[|ATE| ≤ W₁ ≤ W#super("G,1")])
