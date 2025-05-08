#let briefpapier(
  absender: [],
  show-absender: false,
  absender-gruss: [],
  ruecksende-adresse: [],
  show-ruecksende: false,
  adresse: [],
  ort: [Dortmund],
  betreff: [],
  referenzen: none,
  datum: none,
  ticks: false,
  body,
) = {
  // Generelles Setup
  set page(
    margin: (x: 15mm, y: 20mm),
    background: {
      if ticks [
        #place(left + top, dy: 95mm)[#line(length: 3mm, stroke: stroke(0.5pt))]
        #place(left + top, dy: 138.5mm)[#line(length: 4mm, stroke: stroke(0.5pt))]
        #place(left + bottom, dy: -97mm)[#line(length: 3mm, stroke: stroke(0.5pt))]
      ]
    },
    numbering: (a, b) => if counter(page).final().at(0) == 1 [] else [Seite #a von #b],
  )

  set text(font: "Roboto", lang: "de", size: 11pt)
  set par(justify: true)
  show heading.where(level: 1): set text(size: 11pt)


  // Abstand von oben
  block(width: 100%, height: 15mm, spacing: 0mm)


  // Adresse und Absender
  let final-absender = if show-absender [#absender] else []
  let final-ruecksende = if show-ruecksende { text(size: 9pt, underline(ruecksende-adresse, offset: 1mm)) } else { }

  set table.cell(inset: 0mm)
  table(
    columns: (2fr, 1fr),
    stroke: none,
    [
      #block(width: 100%, height: 45mm, spacing: 0mm)[
        #place(top, final-ruecksende)
        #place(left + horizon, [#box(width: 80mm, adresse)])
      ]
    ],
    [
      #final-absender
    ],
  )

  // Tabellen inset wiederherstellen
  set table.cell(inset: 5pt)
  
  block(height: 6em)

  // Angaben
  if referenzen == none { block(width: 100%, height: 20mm, spacing: 0mm) } else {
    block(width: 100%, height: 20mm, spacing: 0mm)[
      #place(top)[
        #grid(
          columns: (1fr,) * 4,
          row-gutter: 1.8em,
          ..referenzen.map(it => {
            let (key, value) = it

            text(size: 9pt, key)
            linebreak()
            text(size: 11pt, value)
          })
        )
      ]
    ]
  }

  // Datum
  let final-datum = if datum == none { datetime.today().display("[day].[month].[year]") } else { datum }
  block(width: 100%, above: 2em, below: 2em)[
    #set align(top + right)
    #ort, #final-datum
  ]


  // Betreff
  block(width: 100%, above: 0mm, below: 2em)[
    #set text(weight: "bold")
    #betreff
  ]

  body

  v(0.8cm)
  absender-gruss
}
