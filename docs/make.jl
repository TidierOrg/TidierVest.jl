using Documenter, Harbest

makedocs(
    sitename = "Harbest.jl",
    authors = "José Díaz",
    pages = [
        "Home" => "index.md",
        "Docstrings" => "lib/docstrings.md"
    ]
)
 
deploydocs(
    repo = "https://github.com/jdiaz97/Harbest.jl.git",
    push_preview = true
)