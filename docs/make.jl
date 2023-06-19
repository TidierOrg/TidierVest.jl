using Documenter, Harbest

makedocs(
    sitename = "Harbest.jl",
    authors = "José Díaz",
    pages = [
        "Home" => "index.md",
        "Instructions" => Any[
            "Web Scraping" => "lib/web_scraping.md",
            "Functions" => "lib/functionss.md",
        ],
        "Tutorial" => "lib/tutorial.md"
    ]
)
 
deploydocs(
    repo = "https://github.com/jdiaz97/Harbest.jl.git",
    push_preview = true
)