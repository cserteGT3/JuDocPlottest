# This file was generated, do not modify it. # hide
using PyPlot, DelimitedFiles, Statistics
fp = joinpath("assets", "temperature", "temps.tsv")
d, h = readdlm(abspath(fp), '\t', header = true)
figure()
scatter(d[:,1],d[:,2])
savefig(joinpath(@__DIR__, "plot_judoc3.png"))
println(fp)
println(abspath(fp))
println(joinpath(@__DIR__, "plot_judoc.png"))
println("The average is:", mean(d[:,2]))