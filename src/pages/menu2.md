@def title = "pure JuDoc"

## Pure JuDoc

## The usual code:

```julia:temperature/plt2
using PyPlot, DelimitedFiles, Statistics
d, h = readdlm(joinpath(@__DIR__, "temps.tsv"), '\t', header = true)
figure()
scatter(d[:,1],d[:,2])
savefig(joinpath(@__DIR__, "plot_judoc2.png"))
println("Mean temperature: ", mean(d[:,2]), " °C")
```

\figalt{On the JuDoc site}{temperature/plot_judoc2.png}


\textoutput{temperature/plt2}

## My attempt with pure JuDoc

Updated code is above based on [issue (comment)](https://github.com/tlienart/JuDoc.jl/issues/182#issuecomment-503973974).
This leaves a small inlined code part (which is fixed now on `#master`):

```julia:temperature/plt
using PyPlot, DelimitedFiles, Statistics
fp = joinpath("assets", "temperature", "temps.tsv")
d, h = readdlm(abspath(fp), '\t', header = true)
figure()
scatter(d[:,1],d[:,2])
savefig(joinpath(@__DIR__, "plot_judoc3.png"))
println(fp)
println(abspath(fp))
println(joinpath(@__DIR__, "plot_judoc.png"))
println("The average is:", mean(d[:,2]))
```

![the plot](/assets/temperature/plot_judoc.png)

## New trials with the above code

this does not work:
```
\figalt{new plot}{temperature/plot_judoc3}
```

this should:

```
\figalt{new plot3}{pages/menu2/code/temperature/plot_judoc3}
```

\figalt{new plot3}{pages/menu2/code/temperature/plot_judoc3}

new output:

\output{temperature/plt}
<!--

as text:
\textoutput{temperature/plt}



The "output" is also shown as code (which is fine, but not what I want)
\output{temperature/plt}
-->
## Usage

1. updating and pushing `temps.tsv`
2. `publish()`

This behaviour is fine for me, the things that I'd like to change is:
* inlined code should not be present if there's nothing to show - **solved**
* I'd like to see the "average text" as plain text, not code output. - **solved**
