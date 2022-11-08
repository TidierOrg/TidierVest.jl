include("../src/harbest.jl")

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
