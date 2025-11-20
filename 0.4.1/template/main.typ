#import "@local/letter:0.4.0": *

#show: briefpapier.with(
  show-absender: false,
  show-ruecksende: false,
  ticks: false,
  // datum: [10.02.2025],
  adresse: [
    Testadresse\
    Musterstr. 3
  ],
  referenzen: (
    ([Patient], [00173130]),
    ([Geburtsdatum], [09.08.1972]),
  ),
  betreff: [#highlight("Betreffzeile")],
  // ort: [Dortmund],
  absender-gruss: [
    Dr. Benedikt Claus\
    #text(size: 9pt)[Psychologischer Psychotherapeut (VT)]
  ],
)

Sehr geehrte Damen und Herren,

#lorem(150)

Mit freundlichen Grüßen
