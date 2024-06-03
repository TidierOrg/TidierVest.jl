"""
    minimal_html(html::AbstractString, title::AbstractString)::String

Takes some HTML and turns it into a minimal HTML document.

### Input: 

- `html` --  HTML string that goes in the body of the document
- `title` -- title of the document

### Output:

- `html` --  The complete HTML document

"""
function minimal_html(html::AbstractString, title::AbstractString)::String
    return """
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
end
