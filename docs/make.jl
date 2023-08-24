using Documenter, TidierVest

makedocs(
    sitename = "TidierVest.jl",
    authors = "José Díaz",
    modules = [TidierVest],
    doctest = true,
    pages = [
        "Home" => "index.md",
        "Docstrings" => "lib/docstrings.md"
    ]
)
 
deploydocs(
    repo = "https://github.com/TidierOrg/TidierVest.jl.git",
    push_preview = true
)