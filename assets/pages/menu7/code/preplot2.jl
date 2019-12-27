# This file was generated, do not modify it. # hide
function jdplotly2(plot::String, id::String, style::String="width:600px;height:250px;")
	println("""
	~~~<div id="$id" style="$style"></div>
	<script>
		var fig = JSON.parse('$plot');
		CONTAINER = document.getElementById('$id');
		Plotly.plot(CONTAINER, fig.data, fig.layout);
	</script>
	~~~""")
end