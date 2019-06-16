@def title = "JuDoc Example"
@def hasmath = true
@def hascode = true

# Discourse thread

[link](https://discourse.julialang.org/t/ann-judoc-jl-a-static-site-generator-in-julia/23693/14)

Note: I could not find the "old faithful" dataset, so I used what I've found.

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


I consider this as a fix dataset, e.i. it is once saved and stays the same "forever".
