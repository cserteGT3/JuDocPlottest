# This file was generated, do not modify it. # hide
import PlotlyJS

x = y = [-2*pi + 4*pi*i/100 for i in 1:100]
z = [sin(x[i]) * cos(y[j]) * sin(x[i]*x[i]+y[j]*y[j])/log(x[i]*x[i]+y[j]*y[j]+1)
     for i in 1:100 for j in 1:100]
z_ = [z[i:i+99] for i in 1:100:10000]

data = PlotlyJS.contour(;z=z_, x=x, y=y)

plt = PlotlyJS.plot(data)
PlotlyJS.relayout!(plt, margin=PlotlyJS.attr(t=60, b=60, l=50, r=50))
html_block = PlotlyJS.html_body(plt.plot);
println("\n~~~")
println("""<div id="5578125e-fbe3-4b94-8735-4c014bbe94a3" class="plotly-graph-div"></div>""")
println("$html_block")
println("~~~\n\n\n")