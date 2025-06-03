#import "formal_content.typ": task_description, abbreviations, abstract, kurzzusammenfassung, tools, appendix 

#let tub_thesis_template(
  title: [Title of the Thesis],
  date_submission: [20 November 2025],
  author: [Maxi Mustermensch],
  mail: [muster@campus.tu-berlin.de],
  student_id: [123456],
  prof: [Prof. Dr.-Ing. Julia Kowal],
  supervisor: [Lars Krüger],
  footer_text: [Chair of Electrical Energy Storage Technology],
  body
) = {
  // Font sizes: 
  let h1 = 28pt
  let h2 = 24pt
  let h3 = 20pt
  let h4 = 16pt
  let normal_text = 12pt

  set text(
    size: normal_text
  )

  // Function for changing the default font size and paragraphs for the heading levels 
  show heading: heading_styler => [
    #if heading_styler.depth == 1 [
      #v(7%)
      #text(heading_styler, size: 24pt) \
    ] 
    #if heading_styler.depth == 2 [
      \
      #text(heading_styler, size: 24pt) \
    ]
    #if heading_styler.depth == 3 [
      \
      #text(heading_styler, size: 20pt) \
    ]
    #if heading_styler.depth == 4 [
      \
      #text(heading_styler, size: 16pt) \
    ] 
  ]

  // Title page
  set page(
    margin: (
      top: 2cm,
      bottom: 1.5cm,
      x: 3cm    
    )
  )

  grid(
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

  align(left)[
  Technical University Berlin \ 
  Faculty IV - Electrical Engineering and Computer Science \
  Institute of Energy and Automation Technology \ 
  Electrical Energy Storage Technology
  ]

  v(12%)

  align(center)[
    #text(size: 17pt, [Master Thesis])
    
    #v(4%)

    #text(size: 28pt, title)
    
    #v(3%)

    #grid(
      columns: (20%, 30%),
      rows: 2,
      row-gutter: 12pt,
      grid.cell(
        x:0,
        [submitted by:],
        align: left    
      ),
      grid.cell(
        x:1,
        author,
        align:left    
      ),
      grid.cell(
        y:1,
        [Student ID:],
        align:left    
      ),
      grid.cell(
        y:1,
        student_id,
        align:left    
      )
    )  
    #v(6%)

    to obtain the academic degree\
    #text(weight: "semibold", size: 14pt)[Master of Science]\ 
    (M. Sc.)

    #v(13%)
    
    #align(bottom)[
      #grid(
        columns: (50%, 50%),
        rows: 3,
        row-gutter: 12pt,
        grid.cell(
          x:0,
          [Responsible Professor:],
          align: left    
        ),
        grid.cell(
          x:1,
          prof,
          align:left    
        ),
        grid.cell(
          y:1,
          [Supervisor:],
          align:left    
        ),
        grid.cell(
          y:1,
          supervisor,
          align:left    
        ),
        grid.cell(
          y:2,
          [Submission Date:],
          align:left    
        ),
        grid.cell(
          y:2,
          date_submission,
          align:left    
        )
      )
    ]
  ]

  pagebreak()

  //Define page margins and page numbering with roman numerals for the first pages (Assignment, Daclaration of independence, List of Abbreviations, Abstract, Contents):

  set page(
    margin: (
      top: 3cm,
      bottom: 3cm,
      x: 3cm    
    ),
    footer: (
      grid(
        columns: 1,
        row-gutter: 8pt,
        grid.cell(
          y:1,
          context [
            #h(1fr)
            #counter(page).display("I")
          ]
        )
    
      )
    )
  )
  counter(page).update(1)

  // Page for decription of task:
  text(size: h1, weight: "semibold", [Assignment])

  parbreak()

  task_description
  
  parbreak()

  [I hereby declare that I have read and understood the assignment.]
  
  
  grid(
    columns: (30%, 20%, 50%),
    rows: (6%, 1%),
    row-gutter: 4pt,
    grid.cell(
      date_submission,
      x:0,
      align: bottom
      ),
    grid.cell(
      line(start: (0%, 5%), end: (100%, 5%), stroke: (thickness: 1pt)),
      x:2,
      align: bottom
    ),
    grid.cell(
      text(size: 10pt, "First Name, Second Name"),
      y:1,
      x:2
    )
  )

  pagebreak()

  // Declaration of independence page: 
  text(size: h1, weight: "semibold", [Declaration of independence])

  parbreak()
  
  [I hereby declare under penalty of perjury that I have written this thesis on the subject of]

  align(center)[
    #text(size: 20pt, title)

  ]

  [independently and single-handedly and without unauthorized external help and exclusively using the listed sources and aids.
  Furthermore, I undertake to explicitly mark content that was created with the support of AI or AI-based tools.]
  
  
  grid(
    columns: (30%, 20%, 50%),
    rows: (6%, 1%),
    row-gutter: 4pt,
    grid.cell(
      date_submission,
      x:0,
      align: bottom
      ),
    grid.cell(
      line(start: (0%, 5%), end: (100%, 5%), stroke: (thickness: 1pt)),
      x:2,
      align: bottom
    ),
    grid.cell(
      text(size: 10pt, "First Name, Second Name"),
      y:1,
      x:2
    )
  )


  pagebreak()

  // Page for abbreviations:
  text(size: h1, weight: "semibold", [List of Abbreviations/Nomenclature])
  
  // This function restructures the array so that it can be mapped to the grid (Easier solution possible?) 
  let ab_flat = ()
  let nrows = abbreviations.len()
  for i in range(nrows) [
      #ab_flat.push(abbreviations.at(i).at(0))
      #ab_flat.push(abbreviations.at(i).at(1))
  ]

  grid(
  columns: (40%, 60%),
  row-gutter: 12pt,
  ..ab_flat.map(ab_flat=> [
      #ab_flat
    ])
  )

  pagebreak()

  // Page for Abstract in English
  text(size: h1, weight: "semibold", [Abstract])
  parbreak()

  abstract

  pagebreak()

  // Page for Abstract in German:
  text(size: h1, weight: "semibold", [Kurzzusammenfassung])
  
  parbreak()

  kurzzusammenfassung

  pagebreak()

  // Page for table of contents:
  set heading(numbering: "1.")

  text(size: h1, weight: "semibold", [Contents])
  
  

  // Write every main chapter in bold letters:
  show outline.entry.where(
    level: 1
  ): set text(weight: "bold")

  outline(
    title: none
  )

  pagebreak()

  // Sets the page margin and defines the header and footer
  // The header shows the current chapter. If a new chapter begins, the header is not shown on this page:
  set page(
    margin: (
      top: 3cm,
      bottom: 3cm,
      x: 3cm    
    ),
    header: context {
      let curr_page = here().page()
      let header1s = query(selector(heading.where(level: 1)))
      let anchor = header1s.map(it => {it.location().page()})
      if curr_page not in anchor{
        let elems = query(
          selector(heading.where(level: 1)).before(here()),
        )
        if elems.len() != 0 {
          let body = elems.last().body
          grid(
            columns: 1,
            row-gutter: 4pt,
            grid.cell(
              body
              ),
              grid.cell(
              line(
                start: (0%, 5%), 
                end: (100%, 5%), 
                stroke: (thickness: 0.7pt)
              )
            )
          ) 
        }
      }
    },
    footer: (
      grid(
        columns: (80%, 20%),
        row-gutter: 8pt,
        grid.cell(
          colspan: 2,
          line(
            start: (0%, 5%), 
            end: (100%, 5%), 
            stroke: (thickness: 0.7pt)
          )
        ),
        grid.cell(
          footer_text
        ),
        grid.cell(
          x:1,
          context [
          #h(1fr)
          #counter(page).display("1")
          ]
        )
      )
    )
  )

  // Restart page numbering with numerical numerals:
  counter(page).update(1)


  body

  pagebreak()

  bibliography(
    "Example_bib_file.bib",
    style: "ieee")

  pagebreak()

  // Deactivate heading numbering for last chapters(Tools, Appendix):
  set heading(numbering: none)

  heading([Tools], level: 1)
  tools

  pagebreak()

  heading([Appendix], level: 1)
  appendix
} 