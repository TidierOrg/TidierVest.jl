using Documenter, Harbest

makedocs(
    sitename = "Harbest.jl",
    authors = "José Díaz",
    pages = [
        "Home" => Any[
            "Web Scraping" => "index.md",
            "Functions" => "functions.md",
        ],
        "Tutorial" => "tutorial.md"
    ]
)
 
deploydocs(
    repo = "https://github.com/jdiaz97/Harbest.jl.git",
    push_preview = true
)