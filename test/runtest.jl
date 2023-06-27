include("../src/Harbest.jl")

using .Harbest

starwars = read_html("https://rvest.tidyverse.org/articles/starwars.html")

films = html_elements(starwars, "section")

title = html_elements(films,"h2")
html_text3(title)
# 7-element Vector{String}:
#  "The Phantom Menace"
#  "Attack of the Clones"
#  "Revenge of the Sith"
#  ⋮
#  "Return of the Jedi"
#  "The Force Awakens"

html = read_html("https://en.wikipedia.org/w/index.php?title=The_Lego_Movie&oldid=998422565")
table = html_elements(html, ".tracklist") |> html_table
# 28×4 DataFrame
#  Row │ No.     Title                              Performer(s)                       Length 
#      │ String  String                             String                             String 
# ─────┼──────────────────────────────────────────────────────────────────────────────────────
#    1 │ 1.      "Everything Is Awesome"            Tegan and Sara featuring The Lon…  2:43   
#    2 │ 2.      "Prologue"                                                            2:28   
#    3 │ 3.      "Emmett's Morning"                                                    2:00   
#    4 │ 4.      "Emmett Falls in Love"                                                1:11   
#    5 │ 5.      "Escape"                                                              3:26
#   ⋮  │   ⋮                     ⋮                                  ⋮                    ⋮
#   25 │ 25.     "Everything Is Awesome"            Jo Li (Joshua Bartholomew and Li…  1:26
#   26 │ 26.     "Everything Is Awesome (unplugge…  Shawn Patterson and Sammy Allen    1:24
#   27 │ 27.     "Untitled Self Portrait"           Will Arnett                        1:08
#   28 │ 28.     "Everything Is Awesome (instrume…                                     2:41
#                                                                              19 rows omitted