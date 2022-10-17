# Harbest.jl
## The best way to scrape the internet, if you're lazy
This library combines HTTP, Gumbo and Cascadia for a more simple way to scrape data. 

Early version. Based on rvest from R.

## Functions

### `read_html`

Read an url

### `html_elements`

Get the elements you want from an html

### `html_text`

Get the text, you can also use `html_text2` or `html_text3` for cleaner text

### `html_attrs`

Get a specific attribute, if string not provided it would try to get some attributes anyway

## Next functions

### `html_table`

Create a table based on the html structure

### `html_tree`

Returns the structure, so it's easier to navigate the html

## Usage

```julia
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
```

## To do
- Improve html_elements to receive multiple strings and apply it in sequence.
- Make more tests and support all HTML types within Julia

## Notes

  - If you don't have a terrible internet connection and you are going to use for loops in the same domain, you should set up a timer, otherweise you might accidentally DDoS a nice webiste, be polite!