
#' @def title = "Waeve2 and Weave3 with Literate.jl"
#' @def hascode = true

#' ## Weave.jl

#' ## The usual code:

#+ echo=false; eval=true
using PyPlot, DelimitedFiles, Statistics
d, h = readdlm(joinpath(@__DIR__,"assets", "temperature", "temps.tsv"), '\t', header = true)
figure()
scatter(d[:,1],d[:,2])
savefig(joinpath(@__DIR__,"assets","weave", "plot_wew.png"))

#' ![the plot2](/assets/weave/plot_wew.png)

#+ echo=false; eval=true; results="rst"
println("Mean temperature: ", mean(d[:,2]), " °C")

#' ## Usage

#' 1. `cleanall()`
#' 2. updating and pushing the `.tsv` file
#' 3. running this file: `include("assets\\weave\\runweave.jl")`
#' 8. `publish()`
