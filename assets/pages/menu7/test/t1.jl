# This file was generated, do not modify it. # hide
using PlotlyJS, DelimitedFiles, Statistics, ORCA
fp = joinpath("assets", "temperature", "temps.tsv")
d, h = readdlm(abspath(fp), '\t', header = true)
sc = scatter(;x=d[:,1], y=d[:,2], mode="markers")
p = plot(sc)
savefig(p, joinpath(@__DIR__, "plotly2.html"), format="html")
savefig(p, joinpath(@__DIR__, "plotly1.png"), format="png")
savefig(p, joinpath(@__DIR__, "output", "t2.out"), format="html")
println("The average is:", mean(d[:,2]))