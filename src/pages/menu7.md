@def title = "Working with PlotyJS"
@def hasplotly = true

## Judoc × PlotlyJS

```julia:./test/t1
import PlotlyJS, ORCA
using DelimitedFiles, Statistics
fp = joinpath("assets", "temperature", "temps.tsv")
d, h = readdlm(abspath(fp), '\t', header = true)
sc = PlotlyJS.scatter(;x=d[:,1], y=d[:,2], mode="markers")
p = PlotlyJS.plot(sc)
PlotlyJS.savefig(p, joinpath(@__DIR__, "plotly2.html"), format="html")
PlotlyJS.savefig(p, joinpath(@__DIR__, "plotly1.png"), format="png")
PlotlyJS.savefig(p, joinpath(@__DIR__, "output", "t2.out"), format="html")
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


this does not work ([issuecomment](https://github.com/tlienart/JuDoc.jl/issues/322#issuecomment-568879579)):

```html
~~~
{{insert ../assets/menu7/test/plotly1.html}}
~~~
```

~~~
{{insert ../../assets/menu7/test/plotly1.html}}
~~~

<!--


## Test with div

See [issue325](https://github.com/tlienart/JuDoc.jl/issues/325) for some html code block issues.

This should work from [here](https://github.com/tlienart/JuDoc.jl/issues/322#issuecomment-568882518) and the example generation from PlotlyJS.jl's docs:


```julia:./test/t2
import PlotlyJS
trace1 = PlotlyJS.scatter(;x=1:4, y=[10, 15, 13, 17], mode="markers")
trace2 = PlotlyJS.scatter(;x=2:5, y=[16, 5, 11, 9], mode="lines")
trace3 = PlotlyJS.scatter(;x=1:4, y=[12, 9, 15, 12], mode="lines+markers")
p = PlotlyJS.plot([trace1, trace2])
#p = plot([trace1, trace2, trace3])
#relayout!(p, margin=attr(t=60, b=60, l=50, r=50))
println("""~~~
  <div id=test2 style=width:600px;height:250px;></div>""")
println(PlotlyJS.html_body(p.plot))
println("~~~")
```

\textoutput{./test/t2}


trial two, with margins set:

```julia:./test/t3
import PlotlyJS
trace1 = scatter(;x=1:4, y=[10, 15, 13, 17], mode="markers")
trace2 = scatter(;x=2:5, y=[16, 5, 11, 9], mode="lines")
trace3 = scatter(;x=1:4, y=[12, 9, 15, 12], mode="lines+markers")
p = plot([trace1, trace2, trace3])
relayout!(p, margin=attr(t=60, b=60, l=50, r=50))
println("~~~")
println(PlotlyJS.html_body(p.plot))
println("~~~")
```

\textoutput{./test/t3}


More tests:
```julia:preplot
function jdplotly(plot, id::String, style::String="width:600px;height:250px;")
	println("""
	~~~<div id="$id" style="$style"></div>\n$plot\n~~~""")
end
```

```julia:./test/t4
import PlotlyJS
trace1 = scatter(;x=1:4, y=[10, 15, 13, 17], mode="markers")
trace2 = scatter(;x=2:5, y=[16, 5, 11, 9], mode="lines")
trace3 = scatter(;x=1:4, y=[12, 9, 15, 12], mode="lines+markers")
p = plot([trace1, trace2, trace3])
jdplotly(PlotlyJS.html_body(p.plot), "test4")
```

\textoutput{./test/t4}


## Another test, a bit more complicated

```julia:preplot2
function jdplotly2(plot::String, id::String, style::String="width:600px;height:250px;")
	println("""
	~~~<div id="$id" style="$style"></div>
	<script>
		var fig = JSON.parse('$plot');
		CONTAINER = document.getElementById('$id');
		Plotly.plot(CONTAINER, fig.data, fig.layout);
	</script>
	~~~""")
end
```

```julia:plotly2
import PlotlyJS

trace1 = scatter(;x=1:4, y=[10, 15, 13, 17], mode="markers")
trace2 = scatter(;x=2:5, y=[16, 5, 11, 9], mode="lines")
trace3 = scatter(;x=1:4, y=[12, 9, 15, 12], mode="lines+markers")
p = plot([trace1, trace2, trace3])

jdplotly2(json(p), "test3")
```

\textoutput{plotly2}
-->


## Raw source

~~~
<div id="ee9d7c9d-6faf-488b-aaf9-3ee496ce5954" class="plotly-graph-div"></div>

<script>
    window.PLOTLYENV=window.PLOTLYENV || {};
    window.PLOTLYENV.BASE_URL="https://plot.ly";
    Plotly.newPlot('ee9d7c9d-6faf-488b-aaf9-3ee496ce5954', [{"mode":"markers","y":[10,15,13,17],"type":"scatter","x":[1,2,3,4]},{"mode":"lines","y":[16,5,11,9],"type":"scatter","x":[2,3,4,5]},{"mode":"lines+markers","y":[12,9,15,12],"type":"scatter","x":[1,2,3,4]}],
               {"margin":{"l":50,"b":60,"r":50,"t":60}}, {showLink: false});

 </script>
 ~~~

## JuDoc web

```julia:loadjs
#hideall
import PlotlyJS, Random

function jdplotly(plt, id="jdp"*Random.randstring('a':'z', 3),
     	  	  style="width:600px;height:350px;")
    println("""
    ~~~
    <div id="$id" style="$style"></div>
    <script>
        var fig = JSON.parse('$(PlotlyJS.json(plt))');
        CONTAINER = document.getElementById('$id');
        Plotly.plot(CONTAINER, fig.data, fig.layout);
    </script>
    ~~~""")
end
```

```julia:ex1
#hideall
z =  [10     10.625  12.5  15.625  20
     5.625  6.25    8.125 11.25   15.625
     2.5    3.125   5.    8.125   12.5
     0.625  1.25    3.125 6.25    10.625
     0      0.625   2.5   5.625   10]

data   = PlotlyJS.contour(; z=z)
layout = PlotlyJS.Layout(; title="Basic Contour Plot")
plt    = PlotlyJS.plot(data, layout)

jdplotly(plt)
```

\textoutput{ex1}

## Another try

```julia:ex2
import PlotlyJS

x = y = [-2*pi + 4*pi*i/100 for i in 1:100]
z = [sin(x[i]) * cos(y[j]) * sin(x[i]*x[i]+y[j]*y[j])/log(x[i]*x[i]+y[j]*y[j]+1)
     for i in 1:100 for j in 1:100]
z_ = [z[i:i+99] for i in 1:100:10000]

data = PlotlyJS.contour(;z=z_, x=x, y=y)

plt = PlotlyJS.plot(data)
PlotlyJS.relayout!(plt, margin=PlotlyJS.attr(t=60, b=60, l=50, r=50))
html_block = PlotlyJS.html_body(plt.plot);
println("\n~~~")
println("""<div id="5578125e-fbe3-4b94-8735-4c014bbe94a3" class="plotly-graph-div"></div>""")
println("$html_block")
println("~~~\n\n\n")
```

\textoutput{ex2}
