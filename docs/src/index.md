# Harbest.jl

Web Scraping is a technique to get data from the internet. In this package you can do this to get data from a static HTML.

This is a port form [tidyverse/Rvest](https://github.com/tidyverse/rvest)

# Usage

```julia
using Harbest

starwars = read_html("https://rvest.tidyverse.org/articles/starwars.html")

titles = html_elements(starwars, ["section", "h2"]) |> html_text3
titles
# 7-element Vector{String}:
#  "The Phantom Menace"
#  "Attack of the Clones"
#  "Revenge of the Sith"
#  ⋮
#  "Return of the Jedi"
#  "The Force Awakens"

html = read_html("https://en.wikipedia.org/w/index.php?title=The_Lego_Movie&oldid=998422565")
table = html_elements(html, ".tracklist") |> html_table
table
# 28×4 DataFrame
#  Row │ No.     Title                              Performer(s)                       Length 
#      │ String  String                             String                             String 
# ─────┼──────────────────────────────────────────────────────────────────────────────────────
#    1 │ 1.      "Everything Is Awesome"            Tegan and Sara featuring The Lon…  2:43   
#    2 │ 2.      "Prologue"                                                            2:28   
#    3 │ 3.      "Emmett's Morning"                                                    2:00   
#    4 │ 4.      "Emmett Falls in Love"                                                1:11   
#    5 │ 5.      "Escape"                                                              3:26
#   ⋮  │   ⋮                     ⋮                                  ⋮                    ⋮
#   25 │ 25.     "Everything Is Awesome"            Jo Li (Joshua Bartholomew and Li…  1:26
#   26 │ 26.     "Everything Is Awesome (unplugge…  Shawn Patterson and Sammy Allen    1:24
#   27 │ 27.     "Untitled Self Portrait"           Will Arnett                        1:08
#   28 │ 28.     "Everything Is Awesome (instrume…                                     2:41
#                                                                              19 rows omitted
```

# Functions

- read_html(url)
- html_elements(html,string) or html_elements(html,strings)
- html_attrs(html,string) or html_attrs(html)
- html_text(html) or html_text2(html) or html_text3(html)

# Tutorial

First, we import

```julia
using Harbest, DataFrames, PlotlyJS
```

Then, scrape the data with `html_elements`, `html_attrs` and `html_text3`

```julia
function get_scores(html)
    score = html_elements(html,".ipl-rating-star__rating") |> html_text3 ## Read scores from HTML
    score = score[score .!= "Rate" .&& occursin.(".",score)]  ## Get actual scores
    scores::Vector{Float64} = parse.(Float64,score)    
    return scores
end

function get_names(html)
    names::Vector{String} = html_elements(html,[".info","strong"]) |> html_text3 
    return names
end

function get_imgs(html)
    data = html_elements(html,["img",".zero-z-index"])
    imgs::Vector{String} = html_attrs(data,"src")
    return imgs
end

function get_n_season(html)
    data = read_html(html)
    data = html_elements(data,["select","option"])[2] |> html_text3
    n_season::Int = parse(Int,data)
    return n_season
end

function get_df(url)
    df::DataFrame = DataFrame()
    n_seasons = get_n_season(url)
    urls = url.*"episodes?season=".*string.(1:n_seasons)
    for i in eachindex(urls)
        html = read_html(urls[i])
        temp_df = DataFrame(scores = get_scores(html),
                  names = get_names(html),
                  season = i,
                  images = get_imgs(html))
        df = [df;temp_df]
    end
    df[!,"N"]= rownumber.(eachrow(df))
    return df
end

function plot_df(df,title)
    return plot(df,
                x = :N,
                y = :scores,
                text = :names,
                color = :season, 
                mode = "lines",
                labels=Dict(
                    :N => "Episode number",
                    :scores => "Score",
                    :season => "Season"
                ),
                Layout(title = title* " score on IMDb")
                )
end
```

```julia
community_df = get_df("https://www.imdb.com/title/tt1439629/")
plot_df(community_df,"Community")
```
```@raw html
<iframe src="plot_community.html" style="height:500px;width:100%;"></iframe>
```

```julia
bojack_df = get_df("https://www.imdb.com/title/tt3398228/")
plot_df(bojack_df,"Bojack Horseman")
```
```@raw html
<iframe src="plot_bojack.html" style="height:500px;width:100%;"></iframe>
```
