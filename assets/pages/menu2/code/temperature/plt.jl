# This file was generated, do not modify it. # hide
using PyPlot, DelimitedFiles, Statistics #hide
d, h = readdlm(joinpath(@__DIR__, "temps.tsv"), '\t', header = true) #hide
figure() #hide
scatter(d[:,1],d[:,2]) #hide
savefig(joinpath(@__DIR__, "plot_judoc.png")) #hide
println("The average is:", mean(d[:,2])) #hide