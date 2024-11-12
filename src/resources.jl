include("html_text.jl")
include("html_table.jl")

"""
Returns a parsed HTML from a string

parse_html(str::String)::HTMLDocument

### Input: 

- `str::String`

### Output

HTMLDocument
"""
parse_html(str::String)::HTMLDocument = Gumbo.parsehtml(str)

"""
Returns a parsed HTML from an URL string

read_html(url::String)
read_html(file::IOStream)

### Input: 

- `url::String`

or

- `file::IOStream`r 

### Output

HTMLDocument
"""
function read_html(url::String)::HTMLDocument
    r = HTTP.get(url)
    return parsehtml(String(r.body))
end

function read_html(file::IOStream)::HTMLDocument
    return parsehtml(read(file,String))
end

"""
Returns HTML elements

html_elements(html,string)

### Input: 

- `html` -- It can be HTMLDocument, HTMLElement or Vector{HTMLNode}
- `string` -- It's the element in the HTML that you want to find. It can be a String or Vector{String}, if the latter, it will apply the function in sequence

### Output

Your HTML reduced to the element that you indicated
"""
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

function html_elements(html::HTMLDocument,strings::Vector{String})
    result = html
    for string in strings
        result = html_elements(result,string)
    end
    return result
end

function html_elements(html::HTMLElement,strings::Vector{String})
    result = html
    for string in strings
        result = html_elements(result,string)
    end
    return result
end

function html_elements(html::Vector{HTMLNode},strings::Vector{String})
    result = html
    for string in strings
        result = html_elements(result,string)
    end
    return result
end

"""
Get an attribute

html_attrs(html,string)

### Input: 

- `html` -- It can be HTMLDocument, HTMLElement or Vector{HTMLNode}
- `string::String` (optional) -- Define the attribute that you want to return, if not provided, it would try to return a list of the attributes.

### Output

Indicated attribute or a list of the available attributes
"""
function html_attrs(html::HTMLDocument)
    return attrs(html.root)
end

function html_attrs(html::Vector{HTMLNode})
    return attrs.(html)
end

function html_attrs(html::HTMLElement)
    return attrs(html)
end

function html_attrs(html::HTMLDocument,string::String)
    return getattr(html.root,string)
end

function html_attrs(html::Vector{HTMLNode},string::String)
    return getattr.(html,string)
end

function html_attrs(html::HTMLElement,string::String)
    return getattr(html,string)
end

"""
Get the children of an html

### Input: 

- `html` -- It can be HTMLDocument, HTMLElement or Vector{HTMLNode}

### Output

Indicated attribute or a list of the available attributes
"""
function html_children(html::HTMLDocument)
    return html.root.children
end

function html_children(html::HTMLElement)
    return html.children
end

function html_children(html::Vector{HTMLNode})
    return reduce(vcat,html_children.(html))
end