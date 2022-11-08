using HTTP, Cascadia, Gumbo
include("../src/html_text.jl")

function read_html(url::String)
    r = HTTP.get(url)
    return parsehtml(String(r.body))
end

function html_elements(html::HTMLDocument,string::String)
    elements = eachmatch(Selector(string),html.root)
    return elements
end

function html_elements(html::HTMLElement,string::String)
    elements = eachmatch(Selector(string),html)
    return elements
end

function html_elements(html::Vector{HTMLNode},string::String)
    elements = eachmatch.([Selector(string)],html)
    return reduce(vcat,elements) ## will solve the Vector of Vectors problem
end

## 6 methods, nice sugar code!
## If string not provided, it will just return the attributs.
## Return attributes
function html_attrs(html::HTMLDocument)
    return attrs(html.root)
end

function html_attrs(html::HTMLElement)
    return attrs(html)
end

function html_attrs(html::Vector{HTMLNode})
    return attrs.(html)
end

## With string
function html_attrs(html::HTMLDocument,string::String)
    return getattr(html.root,string)
end

function html_attrs(html::HTMLElement,string::String)
    return getattr(html,string)
end

function html_attrs(html::Vector{HTMLNode},string::String)
    return getattr.(html,string)
end

