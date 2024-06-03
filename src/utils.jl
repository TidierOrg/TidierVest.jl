"""
    minimal_html(html::AbstractString, title::AbstractString)::String

Takes some HTML and turns it into a minimal HTML document.

"""
function minimal_html(html::AbstractString, title::AbstractString)::String
    doc::String = 
    """
    <!DOCTYPE html>
    <html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>$title</title>
    </head>
    <body>
        $html
    </body>
    </html>
    """
    return doc
end
