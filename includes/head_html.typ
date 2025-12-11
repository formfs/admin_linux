#show raw.where(block: false): box.with(
  fill: luma(240),
  inset: (x: 6pt, y: 3pt),
  outset: (y: 3pt),
  radius: 2pt,
)

#show raw.where(block: true): block.with(
  fill: luma(240),
  inset: 1em,
  radius: 4pt,
)

#set text(
  font: "Fira Code",
  size: 14pt
)


#show link: it => {
  set text(blue)
  if type(it.dest) != str {
    it
  }
  else {
    underline(it)
  }
}

#outline(
  title: [Sommaire : Administration linux]
)

