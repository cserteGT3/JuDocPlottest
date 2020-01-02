# This file was generated, do not modify it. # hide
import PlotlyJS, ORCA
using DelimitedFiles, Statistics
fp = joinpath("assets", "temperature", "temps.tsv")
d, h = readdlm(abspath(fp), '\t', header = true)
sc = PlotlyJS.scatter(;x=d[:,1], y=d[:,2], mode="markers")
p = PlotlyJS.plot(sc)
PlotlyJS.savefig(p, joinpath(@__DIR__, "plotly2.html"), format="html")
PlotlyJS.savefig(p, joinpath(@__DIR__, "plotly1.png"), format="png")
PlotlyJS.savefig(p, joinpath(@__DIR__, "output", "t2.out"), format="html")
println("The average is:", mean(d[:,2]))