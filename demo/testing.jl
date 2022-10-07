

url = "https://rvest.tidyverse.org/articles/starwars.html"

html = read_html(url)

sections = html_elements(html, "section")
titles = html_elements(sections, "h2")
text = html_text2(titles)

html_attrs(titles)
html_attrs(titles,"data-id")
