# JuDocPlottest
Test [Judoc.jl's](https://github.com/tlienart/JuDoc.jl) plot generation.

An example based on [discourse comment](https://discourse.julialang.org/t/ann-judoc-jl-a-static-site-generator-in-julia/23693/15) and discussed in [this]() issue.

The goal is to process a csv file, and place the plot on the page.
Would be nice to insert some strings too, for example: `"The average is: $mean(data)."`
This text should not be inlined, like output of a code, but as normal text.
