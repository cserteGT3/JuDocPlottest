@def title = "pure JuDoc"

# My attempt with pure JuDoc

This leaves a small inlined code part:

```julia:temperature/plt
using PyPlot, DelimitedFiles, Statistics #hide
d, h = readdlm(joinpath(@__DIR__, "temps.tsv"), '\t', header = true) #hide
figure() #hide
scatter(d[:,1],d[:,2]) #hide
savefig(joinpath(@__DIR__, "plot.png")) #hide
println("The average is:", mean(d[:,2])) #hide
```
![the plot](/assets/temperature/plot.png)

The "output" is also shown as code (which is fine, but not what I want)
\output{temperature/plt}

## Usage

After updating and pushing `temps.tsv`, I can use `publish()`, and the page is updated.
This behaviour is fine for me, the things that I'd like to change is:
* inlined code should not be present if there's nothing to show
* I'd like to see the "average text" as plain text, not code output.
I assume that these can be solved with Literate.

## Solution for output

OK, none of this works:
```
\input{assests/temperature/output/plt.jl}
```
or

```
\input{output}{assests/temperature/output/plt.out}
```

or

```
\input{output}{assests/temperature/output/plt.jl}
```
