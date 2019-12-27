@def title = "Issue325"
@def hasplotly = true

## HTML code block

Copying from the [docs](https://tlienart.github.io/JuDoc.jl/dev/man/syntax/#Using-raw-HTML-1):

Some text here in the "standard" layout then you can inject raw HTML:

```
~~~
<div class="row">
  <div class="container">
    <img class="left" src="/assets/infra/rndimg.jpg">
    <p> Marine iguanas are truly splendid creatures. </p>
    <p> Evolution is cool. </p>
    <div style="clear: both"></div>      
  </div>
</div>
~~~
```

and subsequently continue with the standard layout.

julia code:
```
using LinearAlgebrah
# above doesn't throw an error, because it's not evaluated
```
