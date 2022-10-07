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

Parse the text

### `html_text2`

Parse the text but cleaner

### `html_text3`

Parse the text but cleaner and even without line breaks

### `html_attrs`

Get a specific attribute, if string not provided it would try to get some attributes anyway

## Next functions

### `html_table`

Create a table based on the html structure

## To do
- Improve html_elements to receive multiple strings and apply it in sequence.
- Make more tests and support all HTML types within Julia

