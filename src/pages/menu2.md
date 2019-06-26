@def title = "pure JuDoc"

# My attempt with pure JuDoc

This leaves a small inlined code part (which is fixed now on `#master`):

```julia:temperature/plt
using PyPlot, DelimitedFiles, Statistics #hide
d, h = readdlm(joinpath(@__DIR__, "temps.tsv"), '\t', header = true) #hide
figure() #hide
scatter(d[:,1],d[:,2]) #hide
savefig(joinpath(@__DIR__, "plot_judoc.png")) #hide
println("The average is:", mean(d[:,2])) #hide
```

![the plot](/assets/temperature/plot_judoc.png)

The "output" is also shown as code (which is fine, but not what I want)
\output{temperature/plt}

## Usage

1. updating and pushing `temps.tsv`
2. `publish()`

This behaviour is fine for me, the things that I'd like to change is:
* inlined code should not be present if there's nothing to show - **solved**
* I'd like to see the "average text" as plain text, not code output. - **solved**

# Corrected way to do it

This update based on [issue (comment)](https://github.com/tlienart/JuDoc.jl/issues/182#issuecomment-503973974)

```julia:temperature/plt2
# hideall
using PyPlot, DelimitedFiles, Statistics
d, h = readdlm(joinpath(@__DIR__, "temps.tsv"), '\t', header = true)
figure()
scatter(d[:,1],d[:,2])
savefig(joinpath(@__DIR__, "plot_judoc2.png"))
println("The average is:", mean(d[:,2]))
```
Next line should be the average line:

\textoutput{temperature/plt2}

And the plot:

\figalt{On the JuDoc site.}{temperature/plot_judoc2.png}
