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

#set heading(numbering: numbly("{1}.", default: "1.1"))

#set text(
  font: "Hack",
  size: 16pt
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

