include("../src/html_text.jl")
include("../src/functions.jl")

url = "https://catalogoplantas.udec.cl/?q=node/500"

html = read_html(url)

a = html_elements(html, "a")


html_text2(a)