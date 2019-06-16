#jl This is a Julia source file!

# @def title = "Menu 3 with Literate.jl"
# @def hascode = true

# ## Literate.jls
# I can run this page with:

#md shell> cd \assets\literate
#md 
#md julia> include("fotw.jl")

# Here's the code:

using PyPlot, DelimitedFiles, Statistics #src
d, h = readdlm(joinpath(dirname(@__DIR__), "temperature", "temps.tsv"), '\t', header = true) #src
figure() #src
scatter(d[:,1],d[:,2]) #src
savefig(joinpath(@__DIR__, "plot.png")) #src
println("The average is:", mean(d[:,2])) #src

# Here's the `example.jl` from Literate's docs:
using Plots
gr()
x = range(0, stop=6π, length=1000)
y1 = sin.(x)
y2 = cos.(x)
f = Plots.plot(x, [y1, y2])
Plots.savefig(f, joinpath(@__DIR__, "plot2.png"))
# this doesn't really want to work out :/

#md ![the plot2](/assets/literate/plot2.png)

#src Lines with this tag appear only in this Julia source file.
using Literate                             #src
Literate.markdown("fotw.jl",  #src
    "../../src/pages/",                          #src
    name="menu3",                 #src
    documenter=false)                      #src
