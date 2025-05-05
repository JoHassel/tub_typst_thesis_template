
#set text(
size: 12pt
)

#set page(
  margin: (
    top: 2cm,
    bottom: 1cm,
    x: 3cm    
  )
)


#let Author = "Maxi Mustermensch"
#let mail = "muster@campus.tu-berlin.de"
#let Matrikelnummer = "123456"

// Title page
#grid(
  columns: (16%, 68%, 16%),
  rows: (6%, 1%),
  row-gutter: 4pt,
  grid.cell(
    image("Graphics\Logo_EET.png", height: 100%),
    x:0,
    align: bottom
    ),
  grid.cell(
    image("Graphics\logo_TU_short.png", height: 100%),
    x:2,
    align: bottom
  ),
  grid.cell(
    line(start: (0%, 5%), end: (100%, 5%), stroke: (thickness: 1pt)),
    y:1,
    colspan: 3
  )
)

#align(left)[
Technische Universität Berlin \ 
Fakultät IV - Elektrotechnik und Informatik \
Institut für Energie- und Automatisierungstechnik\ 
Fachgebiet Elektrische Energiespeichertechnik
]

#v(12%)

#align(center)[
  #text(size: 17pt, [Masterarbeit])
  
  #v(4%)

  #text(size: 25pt, [Title of the Thesis \ Title of the Thesis\ Title of the Thesis]
  )
  
  #v(3%)

  #grid(
    columns: (20%, 30%),
    rows: 2,
    row-gutter: 12pt,
    grid.cell(
      x:0,
      [vorgelegt von:],
      align: left    
    ),
    grid.cell(
      x:1,
      Author,
      align:left    
    ),
    grid.cell(
      y:1,
      [Matrikel-Nr.:],
      align:left    
    ),
    grid.cell(
      y:1,
      Matrikelnummer,
      align:left    
    )
  )  
  #v(6%)

  zur Erlangung des akademischen Grades\
  #text(weight: "semibold", size: 14pt)[Master of Science]\ 
  (M. Sc.)

  #v(16%)
  
  #grid(
    columns: (50%, 50%),
    rows: 3,
    row-gutter: 12pt,
    grid.cell(
      x:0,
      [Verantwortliche Hochschullehrerin:],
      align: left    
    ),
    grid.cell(
      x:1,
      [Prof. X],
      align:left    
    ),
    grid.cell(
      y:1,
      [Betreuer:],
      align:left    
    ),
    grid.cell(
      y:1,
      [Muster_Betreuer*in],
      align:left    
    ),
    grid.cell(
      y:2,
      [Tag der Einreichung:],
      align:left    
    ),
    grid.cell(
      y:2,
      [1. November 2025],
      align:left    
    )
  )
]

#pagebreak()

#set page(
  margin: (
    top: 2cm,
    bottom: 4cm,
    x: 3cm    
  )
)
