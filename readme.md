# Harbest.jl
## The best way to scrape the internet
This library combines HTTP, Gumbo and Cascadia for a more simpler way to scrape information. 

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

## Next functions

### `html_attr`

Get the attribute, very uesful to get href of src.

### `html_table`

Create a table based on a html structure

## To do
- Improve html_elements to receive multiple strings and apply it in sequence.
- Make more tests and support all HTML types within Julia

