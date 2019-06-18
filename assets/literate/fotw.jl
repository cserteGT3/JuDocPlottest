#jl This is a Julia source file!

# @def title = "Menu 3 with Literate.jl"
# @def hascode = true

# ## Literate.jls
# I can run this page with:

#md shell> cd \assets\literate

#md julia> include("fotw.jl")

# Here's a hidden code with the temperature plot:

using PyPlot, DelimitedFiles, Statistics #src
d, h = readdlm(joinpath(dirname(@__DIR__), "temperature", "temps.tsv"), '\t', header = true) #src
figure() #src
scatter(d[:,1],d[:,2]) #src
savefig(joinpath(@__DIR__, "plot_lit.png")) #src
println("The average is:", mean(d[:,2])) #src
# ![the plot2](/assets/literate/plot_lit.png)

# So the plotting part works fine - like on the pureJuDoc page, but there's no inlined code part, which I'd prefer.
# But I don't know how to inject the mean of the temperature

# Possibly like this?

# Mean temperature: MEANTEMP °C

function update_mean(content) #src
    content = replace(content, "MEANTEMP"=>mean(d[:,2])) #src
    return content #src
end #src

# ## Usage

# That is awesome! Now I can use this just like JuDoc:
# 1. `cleanall()`
# 2. updating and pushing the `.tsv` file
# 3. running this file: `include("fotw.jl")`
# 8. `publish()`

#src Lines with this tag appear only in this Julia source file.
using Literate                             #src
Literate.markdown("fotw.jl",  #src
    "../../src/pages/",                          #src
    name="menu3",                 #src
    documenter=false;   #src
    preprocess = update_mean)                      #src
