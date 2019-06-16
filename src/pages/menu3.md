@def title = "Menu 3 with Literate.jl"
@def hascode = true

## Literate.jls
I can run this page with:

```julia
shell> cd \assets\literate

julia> include("fotw.jl")
```

Here's the code:

Here's the `example.jl` from Literate's docs:

```julia
using Plots
gr()
x = range(0, stop=6π, length=1000)
y1 = sin.(x)
y2 = cos.(x)
f = Plots.plot(x, [y1, y2])
Plots.savefig(f, joinpath(@__DIR__, "plot2.png"))
```

this doesn't really want to work out :/

```julia
![the plot2](/assets/literate/plot2.png)
```

*This page was generated using [Literate.jl](https://github.com/fredrikekre/Literate.jl).*

