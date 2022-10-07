

url = "https://rvest.tidyverse.org/articles/starwars.html"

html = read_html(url)

sections = html_elements(html, "section")
titles = html_elements(sections, "h2")
html_text(sections)

text = html_text2(sections)

