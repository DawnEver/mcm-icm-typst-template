#let fontsize = 12pt
#let title-fontsize = 16pt
#let fonttype = "Times New Roman"

// Solution to problem in first-line-indent. Please refer to https://github.com/typst/typst/issues/311#issuecomment-1556115270
#let first-line-indent = 20pt

#let cover(
  body,
  title: "",
  abstract: [],
  keywords: (),
  team-number: "",
  problem-chosen: "",
  year: "",
  )={
  // Team Infomation
  pad(left:-first-line-indent)[#grid(columns: (9fr, 11fr, 11fr), rows: (auto,), gutter: 0pt, align(center)[
    #block(text("Problem Chosen", size: title-fontsize, weight: "bold"))
    #block(text(problem-chosen, size: 30pt, fill: red, weight: "bold"))
  ], align(center)[
    #text(year, size: title-fontsize, weight: "bold")
    #text("\nMCM/ICM\nSummary Sheet", size: title-fontsize, weight: "bold")
  ], align(center)[
    #block(text("Team Control Number", size: title-fontsize, weight: "bold"))
    #block(text(team-number, size: 30pt, fill: red, weight: "bold"))
  ])]

  // dividing line
  pad(left:-first-line-indent)[#line(length: 100%, stroke: black)]

  // Title row.
  align(
    center,
  )[
    #block(text(title, size: 24pt), below: 20pt, above: 20pt)
    #block(text("Summary", size: title-fontsize, weight: "bold"), below: 20pt, above: 20pt)
  ]

  set par(
    // first-line-indent: first-line-indent,
    hanging-indent: -first-line-indent,
    linebreaks: "optimized",
    )

  // abstract
  abstract

  // keywords
  if keywords != () [
    #v(5pt)
    #text("Keywords: ", weight: "bold")
    #keywords.join(", ")
  ]
  body
}

#let project(
  title: "",
  abstract: [],
  keywords: (),
  team-number: "",
  problem-chosen: "",
  year: "",
  bibliography-file: none,
  body,
) = {
  // Set the document's basic properties.
  set document(title: title)
  set page(margin: (left: 80pt, right: 50pt, top: 40pt, bottom: 40pt))

  set text(font: fonttype, size: fontsize)

  // Configure equation numbering and spacing.
  set math.equation(numbering: "(1)", supplement: [])
  show math.equation: set block(spacing: 0.65em)

  // Configure figures and tables.
  set figure(supplement: [])
  show figure: it => {
    set text(fontsize)
    set align(center)
    let has_caption = it.caption != none
    if it.kind == image [
      #box[
        #it.body
        #v(fontsize, weak: true)
        Figure #it.caption
      ]
    ] else if it.kind == table [
      #box[
        #if has_caption{
        text("Table")
        it.caption
        }
        #v(fontsize, weak: true)
        #it.body
      ]   
      
    ] else [
      ...
    ]
  }
  set table(stroke: 0.5pt)
  show table: set text(fontsize)

  // Configure lists.
  // set enum(indent: first-line-indent)
  // set list(indent: first-line-indent)  

  set heading(numbering: "1.")
  show heading: it =>  {
    if it.body in ([Appendices],[Acknowledgment], [Acknowledgement]){
      text(it.body, size: title-fontsize, weight: "bold")
    }else if it.body in ([Contents], ){
      align(center)[
        #text(it.body, size: title-fontsize, weight: "bold")
      ]
    }
    else{
      pad(left: -first-line-indent)[#it]
    }  
  }

  show: cover.with(title: title,
  abstract: abstract,
  keywords: keywords,
  team-number: team-number,
  problem-chosen:problem-chosen,
  year:year)

  // contents
  set page(margin: (left: 60pt, right: 40pt, top: 60pt, bottom: 40pt))
  set par(
    first-line-indent: 0pt,
    hanging-indent: 0pt,
  )
  show outline.entry.where(level: 1): it => {
    v(fontsize, weak: true)

    strong(it)
    
  }
  pagebreak()
  outline(indent: auto)

  // Settings for main body
  set par(
    // first-line-indent: first-line-indent,
    hanging-indent: -first-line-indent,
    linebreaks: "optimized",
  )
  
  let page_counter = counter(page)
  page_counter.update(0)

  set page(
    header: pad(left:-first-line-indent)[#box(stroke: (bottom: 1pt), inset: 5pt)[
      #text("Team #")
      #text(team-number)
      #h(1fr)
      #text("Page")
      #page_counter.display("1 of 1", both: true)
    ]],
    header-ascent: 20%,
    margin: (left: 80pt, right: 50pt, top: 60pt, bottom: 40pt),
  )

  // Display the paper's main body.
  body

  // Display bibliography.
  if bibliography-file != none {
    show bibliography: set text(fontsize)

    bibliography(bibliography-file, title: "References", style: "ieee")
  }
}