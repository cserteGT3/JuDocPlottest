# This file was generated, do not modify it. # hide
using PyPlot, DelimitedFiles
d, h = readdlm(joinpath(@__DIR__, "data.dat"), ',', header = true)
figure()
scatter(d[:,1], d[:,2])
savefig(joinpath(@__DIR__, "plot.png"))