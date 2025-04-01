#import "@local/personal-letters:0.1.0":*

#show: briefpapier.with(
  show-absender: false,
  show-ruecksende: false,
  ticks: false,
  datum: [10.02.2025],
  adresse: [
    Stadt Bergkamen\
    Rathausplatz 1\
    59192 Bergkamen
  ],
  referenzen: (
    ([Meine Zeichen], [00173130]),
    ([Ihre Zeichen], [PHP-P/NR]),
    ([Ihr Schreiben vom], [12.08.2024])
  ),
  betreff: [Lastschriftmandat],
  // ort: [Waltrop],
    absender-gruss: [
    Dr. Benedikt Claus\
    #text(size: 9pt)[Psychologischer Psychotherapeut (VT)]
  ],
)

Sehr geehrte Damen und Herren,

#lorem(50)

Mit freundlichen Grüßen
