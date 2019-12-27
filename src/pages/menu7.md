@def title = "Working with PlotyJS"
@def hasplotly = true

## Judoc × PlotlyJS

```julia:./test/t1
using PlotlyJS, DelimitedFiles, Statistics, ORCA
fp = joinpath("assets", "temperature", "temps.tsv")
d, h = readdlm(abspath(fp), '\t', header = true)
sc = scatter(;x=d[:,1], y=d[:,2], mode="markers")
p = plot(sc)
savefig(p, joinpath(@__DIR__, "plotly2.html"), format="html")
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


this does not work ([source: issuecomment](https://github.com/tlienart/JuDoc.jl/issues/322#issuecomment-568879579)):

```html
~~~
{{insert ../assets/menu7/test/plotly1.html}}
~~~
```

~~~
{{insert ../assets/menu7/test/plotly1.html}}
~~~

Some text here in the "standard" layout then you can inject raw HTML:

```
~~~
<div class="row">
  <div class="container">
    <img class="left" src="/assets/infra/rndimg.jpg">
    <p> Marine iguanas are truly splendid creatures. </p>
    <p> Evolution is cool. </p>
    <div style="clear: both"></div>      
  </div>
</div>
~~~
```

and subsequently continue with the standard layout.
