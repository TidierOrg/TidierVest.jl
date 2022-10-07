using HTTP, Cascadia, Gumbo

function read_html(url::String)
    r = HTTP.get(url)
    return parsehtml(String(r.body))
end

function html_elements(h::HTMLDocument,string::String)
    elements = eachmatch(Selector(string),h.root)
    return elements
end

function html_elements(html::Vector{HTMLNode},string::String)
    elements = eachmatch.([Selector(string)],html)
    return reduce(vcat,elements) ## will solve the Vector of Vectors problem
end

## html_attr
## html_table
