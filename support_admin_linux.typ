#import "@preview/touying:0.6.1": *
#import themes.metropolis: *
#import "@preview/numbly:0.1.0": numbly

#show: metropolis-theme.with(
  aspect-ratio: "16-9",
  footer: self => self.info.institution,
  config-info(
    title: "Administration Linux",
    subtitle: "" ,
    author: "" ,
    date: "",
    institution: "" ,
    logo: "🐧",
  ),
)

#set page(
  footer: context [
    #set align(right)
    #set text(8pt)
    #counter(page).display(
      "1",
      both: false,
    )
  ]  
)

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

#set heading(numbering: numbly("{1}.", default: "1.1"))

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

#title-slide()

== Sommaire <touying:hidden>

#components.adaptive-columns(outline(title: none, indent: 1em))

#include "./pages/admin_linux.typ"
#include "./pages/install_web_server.typ"
#include "./pages/docker.typ"

#include "./pages/support.typ"

