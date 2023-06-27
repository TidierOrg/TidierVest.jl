function parse_rows(rows)
    rows.children .|> html_text3
end

function transpose(df::DataFrame)
    df = permutedims(df,1)
    return select!(df, Not(:x1))
end

"""
Takes some HTML and turns it into a DataFrame, only if there is a very clear HTML Table.

html_table(table_html)

### Input: 

- `table_html` -- Vector{HTMLNode}

### Output

A DataFrame
"""
function html_table(table_html::Vector{HTMLNode})::DataFrame
    rows = html_elements(table_html, "tr")
    t = parse_rows.(rows)
    t = t[length.(t) .== length(t[1])]

    df = DataFrame(t,:auto) 
    df = transpose(df) ## Not great, will have to replace later
    return df
end