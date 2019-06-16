@def title = "JuDoc Example"
@def hasmath = true
@def hascode = true

# Discourse thread

[link](https://discourse.julialang.org/t/ann-judoc-jl-a-static-site-generator-in-julia/23693/14)

Answer:
This would be in the markdown describing the page, the code below will be displayed and executed:

```julia:oldfaithful/plt
using PyPlot, DelimitedFiles
d, h = readdlm(joinpath(@__DIR__, "data.dat"), ',', header = true)
figure()
scatter(d[:,1], d[:,2])
savefig(joinpath(@__DIR__, "plot.png"))
```

![the plot](/assets/oldfaithful/plot.png)
