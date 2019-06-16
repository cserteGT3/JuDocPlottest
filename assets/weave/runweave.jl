using Weave

weave("assets\\weave\\FIR_design.jmd",
  out_path=joinpath(pwd(), "src/pages/menu5.html"),
  doctype = "md2html")