@def title = "pure JuDoc"

# My attempt with pure JuDoc

This leaves a small inlined code part:

```julia:temperature/plt
using PyPlot, DelimitedFiles, Statistics #hide
d, h = readdlm(joinpath(@__DIR__, "temps.tsv"), '\t', header = true) #hide
figure() #hide
scatter(d[:,1],d[:,2]) #hide
savefig(joinpath(@__DIR__, "plot.png")) #hide
println("The average is:", mean(d[:2])) #hide
```
![the plot](/assets/oldfaithful/plot.png)

The "output" is also shown as code (which is fine, but not what I want)
\output{temperature/plt}
