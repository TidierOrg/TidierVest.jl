# Tutorial

First, we import

```@example tutorial
using Harbest, DataFrames, PlotlyJS
```

Then, scrape the data with `html_elements`, `html_attrs` and `html_text3`

```@example tutorial
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

```@example tutorial
community_df = get_df("https://www.imdb.com/title/tt1439629/")
plot_df(community_df,"Community")
```

```@example tutorial
pokemon_df = get_df("https://www.imdb.com/title/tt0168366/")
plot_df(pokemon_df,"Bojack Horseman")
```