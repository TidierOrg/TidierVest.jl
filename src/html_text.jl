"""
Returns the text of an HTML.

html_text3(html)

### Input: 

- `html` -- HTMLDocument, HTMLElement or Vector{HTMLNode}

### Output

A single String or a Vector{String} depending on the input

If you want/need whitespaces and other things, you can use html_text or html_text2
"""
function html_text3(html::HTMLDocument)
    text = nodeText(html.root)
    return replace(text, '\n' => "")
end

function html_text3(html::HTMLElement)
    text = nodeText(html)
    return replace(text, '\n' => "")
end

function html_text3(html::HTMLText)
    text = html.text
    return replace(text, '\n' => "")
end

function html_text3(html::Vector{HTMLNode})
    return html_text3.(html)
end

function get_text(htmlstring)
    test = htmlstring
    vector = []
    start = 0 
    for i in eachindex(test)
        if test[i] == '>'
            start = i+1
        end
        if test[i] == '<' && start != 0 
            final = i-1
            vector = vcat(vector,(start,final))
            start = nothing
            final = nothing
        end
    end
    
    text = []
    for i in eachindex(vector)
        temptext = test[vector[i][1]:vector[i][2]]
        text = vcat(text,temptext)
    end
    return text
    ## return reduce(string,text)
end

"""
Returns the text of an HTML but with some whitespaces
"""
function html_text(html::HTMLDocument)
    html = repr(html.root)
    text = get_text(html)
    text = reduce(string,text)
    return text
end

function html_text(html::Vector{HTMLNode})
    html = repr.(html)
    text = get_text.(html)
    text = reduce.(string,text)
    return text
end

function html_text(html::HTMLElement)
    html = repr(html)
    text = get_text(html)
    text = reduce(string,text)
    return text
end

function cleantext(vectortext)
    text = vectortext

    finaltext = []
    for i in eachindex(text)
        temptext = text[i]
        linebreak1 = true
        for j in eachindex(temptext)
            linebreak0 = temptext[j] == '\n' || temptext[j] == ' '
            linebreak1 = linebreak0*linebreak1
        end 
        if linebreak1 == false
            finaltext = vcat(finaltext,temptext)
        end
    end

    breakline = []
    for k in eachindex(finaltext)
        test = finaltext[k]
            for i in eachindex(test)
                bool = test[i] == '\n' || test[i] == ' '
                if bool == false
                    breakline = vcat(breakline,i)
                    break
                end
            end
    end

    ftext = []
    for i in eachindex(finaltext)
        text = finaltext[i]
        ftext = vcat(ftext, text[breakline[i]:length(text)])
    end
    
    if ftext == [] 
        return ""
    else   
        return reduce(string, ftext)
    end

end
"""
Returns the text of an HTML, but cleaner than html_text
"""
function html_text2(html::HTMLDocument)
    html = repr(html.root)
    text = get_text(html)
    text = cleantext(text)
    return text
end

function html_text2(html::Vector{HTMLNode})
    html = repr.(html)
    text = get_text.(html)
    text = cleantext.(text)
    return text
end

function html_text2(html::HTMLElement)
    html = repr(html)
    text = get_text(html)
    text = cleantext(text)
    return text
end
