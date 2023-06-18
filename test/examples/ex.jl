include("../../src/Harbest.jl")

using .Harbest

url = "https://www.imdb.com/title/tt1439629/episodes?season=1"
html = Harbest.read_html(url)

score = Harbest.html_elements(html,".ipl-rating-star__rating") |> Harbest.html_text3 ## Read scores from HTML
score = score[score .!= "Rate" .&& occursin.(".",score)]  ## Get actual scores
score = parse.(Float64,score)    

b = Harbest.html_elements(html,".info")
b = Harbest.html_elements(b,"strong") |> Harbest.html_text3

Harbest.html_elements(html,[".info","strong"]) |> Harbest.html_text3