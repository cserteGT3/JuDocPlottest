#jl This is a Julia source file!

# @def title = "Menu 3 with Literate.jl"
# @def hascode = true

# ## Literate.jl

# ## The usual code:

using PyPlot, DelimitedFiles, Statistics #src
d, h = readdlm(joinpath(dirname(@__DIR__), "temperature", "temps.tsv"), '\t', header = true) #src
figure() #src
scatter(d[:,1],d[:,2]) #src
savefig(joinpath(dirname(@__DIR__), "literate", "plot_lit.png")) #src
# ![the plot2](/assets/literate/plot_lit.png)

# Mean temperature: MEANTEMP °C

function update_mean(content) #src
    content = replace(content, "MEANTEMP"=>mean(d[:,2])) #src
    return content #src
end #src

# ## Usage

# 1. `cleanall()`
# 2. updating and pushing the `.tsv` file
# 3. running this file: `include("assets\\literate\\fotw.jl")`
# 8. `publish()`

#src Lines with this tag appear only in this Julia source file.
using Literate                             #src
Literate.markdown("assets/literate/fotw.jl",  #src
    "src/pages/",                          #src
    name="menu3",                 #src
    documenter=false;   #src
    preprocess = update_mean)                      #src
