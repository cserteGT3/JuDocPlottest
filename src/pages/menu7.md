@def title = "Working with PlotyJS"

## Judoc × PlotlyJS

```julia:./test/t1
using PlotlyJS, DelimitedFiles, Statistics, ORCA
fp = joinpath("assets", "temperature", "temps.tsv")
d, h = readdlm(abspath(fp), '\t', header = true)
sc = scatter(;x=d[:,1], y=d[:,2], mode="markers")
p = plot(sc)
savefig(p, joinpath(@__DIR__, "plotly1.html"), format="html")
savefig(p, joinpath(@__DIR__, "plotly1.png"), format="png")
savefig(p, joinpath(@__DIR__, "output", "t2.out"), format="html")
println("The average is:", mean(d[:,2]))
```

png plot

```
\figalt{new plot3}{./test/plotly1.png}
```

\figalt{new plot3}{./test/plotly1.png}

html2:

\file{plot2}{./test/plotly1.html}

\output{./test/t1}
