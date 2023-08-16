module TidierVest

using HTTP, Cascadia, Gumbo, DataFrames

export read_html, html_elements, html_attrs
export html_text, html_text2, html_text3
export html_table

include("resources.jl")

end # module Harbest