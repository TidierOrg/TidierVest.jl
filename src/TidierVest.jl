module TidierVest

    using HTTP, Cascadia, Gumbo, DataFrames
    
    ## TidierVest functions
    export parse_html, read_html, html_elements, html_attrs
    export html_text, html_text2, html_text3
    export html_table
    export minimal_html

    ## Gumbo types
    export HTMLDocument, HTMLNode, HTMLElement, HTMLText

    include("resources.jl")
    include("utils.jl")

end