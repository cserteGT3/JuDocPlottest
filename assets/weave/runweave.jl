using Weave

weave("assets\\weave\\fir.jl", out_path=joinpath(pwd(), "src/pages/menu5.html"), doctype = "md2html")
#weave("assets\\weave\\fir.jl", out_path=joinpath(pwd(), "src/pages/menu4.md"), doctype = "github")
weave("assets\\weave\\fir.jl", out_path=joinpath(pwd(), "src/pages/menu6.md"), doctype = "pandoc")
