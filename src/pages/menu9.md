@def title = "Issue334"
@def hasplotly = true
@def reeval = true

## Issue

This works in the REPL, and even if I copy from `assets/pages/menu9/issue334/t1.jl`.

```julia:./issue334/t1
import PlotlyJS
a = PlotlyJS.attr(t=60, b=60, l=50, r=5)
```

\textoutput{./issue334/t1}

Solved with `import` instead of `using`.
