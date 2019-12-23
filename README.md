# JuDocPlottest

See online [here](http://csertegt3.github.io/JuDocPlottest).

Test [Judoc.jl's](https://github.com/tlienart/JuDoc.jl) plot generation.

An example based on [discourse comment](https://discourse.julialang.org/t/ann-judoc-jl-a-static-site-generator-in-julia/23693/15) and discussed in [this]() issue.

The goal is to process a csv file, and place the plot on the page.
Would be nice to insert some strings too, for example: `"The average is: $mean(data)."`
This text should not be inlined, like output of a code, but as normal text.

# [Discourse thread](https://discourse.julialang.org/t/ann-judoc-jl-a-static-site-generator-in-julia/23693/14)

Note: I could not find the "old faithful" dataset, so I used what I've found.

Answer:
This would be in the markdown describing the page, the code below will be displayed and executed:

```julia:oldfaithful/plt
using PyPlot, DelimitedFiles
d, h = readdlm(joinpath(@__DIR__, "data.dat"), ',', header = true)
figure()
scatter(d[:,1], d[:,2])
savefig(joinpath(@__DIR__, "plot.png"))
```

![the plot](/assets/oldfaithful/plot.png)


I consider this as a fix dataset, e.i. it is once saved and stays the same "forever".

## How to use this repo?

Run the followings (tested only on Windows):
```bash
C:\Users\cstamas\Documents\GIT\JuDocPlottest>julia
               _
   _       _ _(_)_     |  Documentation: https://docs.julialang.org
  (_)     | (_) (_)    |
   _ _   _| |_  __ _   |  Type "?" for help, "]?" for Pkg help.
  | | | | | | |/ _` |  |
  | | |_| | | | (_| |  |  Version 1.1.1 (2019-05-16)
 _/ |\__'_|_|_|\__'_|  |  Official https://julialang.org/ release
|__/                   |

(v1.1) pkg> activate .

(JuDocPlottest) pkg> instantiate
  Updating registry at `C:\Users\cstamas\.julia\registries\General`
  Updating git-repo `https://github.com/JuliaRegistries/General.git`

julia> using JuDoc

julia> cleanpull()
→ Removing local output dir...      [done ✔ ]
→ Retrieving updates from the repository... [done ✔ ]

julia> include("assets\\literate\\fotw.jl")
[ Info: generating markdown page from `C:\Users\cstamas\Documents\GIT\JuDocPlottest\assets\literate\fotw.jl`
[ Info: not running on Travis, skipping links will not be correct.
[ Info: writing result to `C:\Users\cstamas\Documents\GIT\JuDocPlottest\src\pages\menu3.md`
"C:\\Users\\cstamas\\Documents\\GIT\\JuDocPlottest\\src\\pages\\menu3.md"

julia> include("assets\\weave\\runweave.jl")
[ Info: Weaving chunk 1 from line 9
[ Info: Weaving chunk 2 from line 18
[ Info: Weaving chunk 3 from line 27
[ Info: Report weaved to C:\Users\cstamas\Documents\GIT\JuDocPlottest\src/pages/menu5.html
[ Info: Weaving chunk 1 from line 9
[ Info: Weaving chunk 2 from line 18
[ Info: Weaving chunk 3 from line 27
[ Info: Report weaved to C:\Users\cstamas\Documents\GIT\JuDocPlottest\src/pages/menu6.md
"C:\\Users\\cstamas\\Documents\\GIT\\JuDocPlottest\\src\\pages\\menu6.md"

julia> serve()
→ Initial full pass...
→ Starting the server...
✓ LiveServer listening on http://localhost:8000/ ...
  (use CTRL+C to shut down)
```
