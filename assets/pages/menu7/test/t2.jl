# This file was generated, do not modify it. # hide
using PlotlyJS
trace1 = scatter(;x=1:4, y=[10, 15, 13, 17], mode="markers")
trace2 = scatter(;x=2:5, y=[16, 5, 11, 9], mode="lines")
trace3 = scatter(;x=1:4, y=[12, 9, 15, 12], mode="lines+markers")
p = plot([trace1, trace2])
#p = plot([trace1, trace2, trace3])
#relayout!(p, margin=attr(t=60, b=60, l=50, r=50))
println("""~~~
  <div id=test2 style=width:600px;height:250px;></div>""")
println(PlotlyJS.html_body(p.plot))
println("~~~")