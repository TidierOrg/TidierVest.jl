# Harbest.jl
## Simple web scraping with Julia
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

Get the content of an attribute, if string not provided it would try to get you an attribute

## Usage

```julia
using Harbest

starwars = read_html("https://rvest.tidyverse.org/articles/starwars.html")

titles = html_elements(starwars, ["section", "h2"])

html_text3(titles)
# 7-element Vector{String}:
#  "The Phantom Menace"
#  "Attack of the Clones"
#  "Revenge of the Sith"
#  ⋮
#  "Return of the Jedi"
#  "The Force Awakens"
```

## Notes

- If you don't have a terrible internet connection and you are going to use for loops in the same domain, you should set up a timer, otherweise you might accidentally DDoS a nice webiste, be polite!