# This file was generated, do not modify it. # hide
# hideall
using PyPlot, DelimitedFiles, Statistics
d, h = readdlm(joinpath(@__DIR__, "temps.tsv"), '\t', header = true)
figure()
scatter(d[:,1],d[:,2])
savefig(joinpath(@__DIR__, "plot_judoc2.png"))
println("The average is:", mean(d[:,2]))