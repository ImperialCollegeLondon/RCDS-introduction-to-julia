### A Pluto.jl notebook ###
# v0.19.38

using Markdown
using InteractiveUtils

# This Pluto notebook uses @bind for interactivity. When running this notebook outside of Pluto, the following 'mock version' of @bind gives bound variables a default value (instead of an error).
macro bind(def, element)
    quote
        local iv = try Base.loaded_modules[Base.PkgId(Base.UUID("6e696c72-6542-2067-7265-42206c756150"), "AbstractPlutoDingetjes")].Bonds.initial_value catch; b -> missing; end
        local el = $(esc(element))
        global $(esc(def)) = Core.applicable(Base.get, el) ? Base.get(el) : iv(el)
        el
    end
end

# ╔═╡ 327ac340-2893-11ef-3d4d-fd50d66d28e9
using RDatasets, Plots, PlutoUI, Statistics

# ╔═╡ 09a9fdbe-9af3-4a48-9df4-a6f5976dde79
plotly()

# ╔═╡ 14925c90-3b62-45a5-8a7e-dfb78c1ee558
iris = dataset("datasets", "iris")

# ╔═╡ 474206da-8e01-4910-82df-e819d8411c76
md"""
## Check Boxes
Below is a nice scatter plot visualising sepal length v width for all species. Let's see if we can customise it with some interactive UI elements, so we can select which species we're interested in.

We've got the species we're interested in specified inside an array. But wouldn't it be better to give the viewer of this notebook some choice?
"""

# ╔═╡ f6874b8f-b74e-40a2-85ea-10c1b1cacb23
species = ["setosa", "versicolor", "virginica"]

# ╔═╡ 2db4998a-ba87-4dc4-923c-3402f8ca3c40


# ╔═╡ b0728c0f-a570-4d52-92c5-cd41f391f9f6
begin
	filtered_data = filter(row -> row.Species in species, iris)
	
	if !isempty(filtered_data)
		scatter(filtered_data.SepalLength, filtered_data.SepalWidth, group=filtered_data.Species, markersize=5, legend=:topleft)
		xlims!(4, 8)
		ylims!(1.9, 4.5)	
		xlabel!("Sepal Length (cm)")
		ylabel!("Sepal Width (cm)")
		title!("Sepal Length vs Sepal Width")
	end
end

# ╔═╡ dc820f20-db90-4ae9-94e9-c4067deb45da
md"""
## Sliders

Here we have a histogram showing frequency of different petal lengths across the species.

We can currently focus in on certain lengths by changing these variables we have defined. But why not use a UI element to make it more interactive?
"""

# ╔═╡ 5f35bd6b-eb69-4afb-b5b5-34b8a1335738
begin
	min_length = 0
	max_length = 7
end

# ╔═╡ 3e88c67a-848d-40ad-973e-3805b3d90eb8


# ╔═╡ abc4aa4f-f69e-4e46-9ab1-e01ff8acb4e2


# ╔═╡ 8cba5133-5885-43d3-984d-8722d23ee91d
begin
	
		filtered_petal_data = filter(row -> row.PetalLength >= min_length && row.PetalLength <= max_length, iris)
		if !isempty(filtered_petal_data)
		    histogram(filtered_petal_data.PetalLength, bins=15, 
		              group=filtered_petal_data.Species,
		              legend=:topright)
			xlims!(0.5, 7.5)
			ylims!(0, 13)
		    xlabel!("Petal Length (cm)")
		    ylabel!("Frequency")
		    title!("Histogram of Petal Length for Selected Range")
		end
	
end

# ╔═╡ e621a4ae-ea6e-4d08-a357-09b9d35718f1
md"""
## Getting creative

In this last example, we visualise the differences in size between the petal and sepal of different irises, using a drop down element to select the iris, and sliders to modify the lengths and widths!
"""

# ╔═╡ 3e79bb43-f378-462f-8272-fdce8eed6b79
@bind selected_species Select(
    ["setosa", "versicolor", "virginica"]
)

# ╔═╡ 420ef17c-3df9-4e07-9333-af36de1e24a6
md"""
# Appendix
"""

# ╔═╡ bf76eba3-c6c7-4393-a913-e361161bed3c
begin
	# Function to calculate feature ranges for the selected species
	function feature_ranges(species)
	    subset = filter(row -> row.Species == species, iris)
	    sepal_length_min = minimum(subset.SepalLength)
	    sepal_length_max = maximum(subset.SepalLength)
	    sepal_width_min = minimum(subset.SepalWidth)
	    sepal_width_max = maximum(subset.SepalWidth)
	    petal_length_min = minimum(subset.PetalLength)
	    petal_length_max = maximum(subset.PetalLength)
	    petal_width_min = minimum(subset.PetalWidth)
	    petal_width_max = maximum(subset.PetalWidth)
	    return sepal_length_min, sepal_length_max, sepal_width_min, sepal_width_max, petal_length_min, petal_length_max, petal_width_min, petal_width_max
	end
	
	# Get feature ranges for the selected species
	sepal_length_min, sepal_length_max, sepal_width_min, sepal_width_max, petal_length_min, petal_length_max, petal_width_min, petal_width_max = feature_ranges(selected_species)
end

# ╔═╡ e873d9ba-0c59-4fc4-90e9-8700be34f1b9
begin
	md"Petal Width $(@bind petal_width_slider Slider(petal_width_min:0.1:petal_width_max, default=(petal_width_min + petal_width_max) / 2, show_value=true))"
end

# ╔═╡ 13a284ab-57d1-462a-be1b-0e168d6c7d35
md"Petal Length $(@bind petal_length_slider Slider(petal_length_min:0.1:petal_length_max, default=(petal_length_min + petal_length_max) / 2, show_value=true))"

# ╔═╡ 9eaad914-82f1-43bf-9194-db8c0f1c70ef
md"Sepal Width $(@bind sepal_width_slider Slider(sepal_width_min:0.1:sepal_width_max, default=(sepal_width_min + sepal_width_max) / 2, show_value=true))"

# ╔═╡ 16a31c35-62d3-4395-9dc5-853abf9e2160
md"Sepal Length $(@bind sepal_length_slider Slider(sepal_length_min:0.1:sepal_length_max, default=(sepal_length_min + sepal_length_max) / 2, show_value=true))"

# ╔═╡ f143ef8b-c466-42c3-907e-fce1ba32fa1a
function draw_oval(x, y, width, height, rotation=0.0; color=:blue, alpha=0.5)
    t = range(0, stop=2π, length=100)  # Parameter for the ellipse
    x_oval = width * cos.(t)
    y_oval = height * sin.(t)
    
    # Rotate the ellipse by the specified angle
    x_rot = x_oval * cos(rotation) - y_oval * sin(rotation)
    y_rot = x_oval * sin(rotation) + y_oval * cos(rotation)
    
    # Offset to the desired position
    x_oval = x .+ x_rot
    y_oval = y .+ y_rot
    
    return plot!(x_oval, y_oval, legend=false, xticks=false, yticks=false, grid=false, seriestype=:shape, lw=0, c=color, alpha=alpha)
end

# ╔═╡ 190ab0db-ac8b-4ddd-ace3-90e07c2cffaa
begin
	scatter()
	
	draw_oval(1, 1, sepal_width_slider, sepal_length_slider, 1 * π / 8; color=:yellow, alpha=0.5)  
	draw_oval(3, 2, petal_width_slider, petal_length_slider, 1 * π / 8; color=:green, alpha=0.5)
	
	title!("Visualising petal and sepal")
	xlabel!("Width")
	ylabel!("Length")
	ylims!(-7,9)
	xlims!(-5,9)
	
    annotate!(1, 1, text("Sepal", :black, 10, :right))
    annotate!(3, 2, text("Petal", :black, 10, :center))
end


# ╔═╡ Cell order:
# ╠═327ac340-2893-11ef-3d4d-fd50d66d28e9
# ╠═09a9fdbe-9af3-4a48-9df4-a6f5976dde79
# ╠═14925c90-3b62-45a5-8a7e-dfb78c1ee558
# ╟─474206da-8e01-4910-82df-e819d8411c76
# ╠═f6874b8f-b74e-40a2-85ea-10c1b1cacb23
# ╠═2db4998a-ba87-4dc4-923c-3402f8ca3c40
# ╟─b0728c0f-a570-4d52-92c5-cd41f391f9f6
# ╟─dc820f20-db90-4ae9-94e9-c4067deb45da
# ╠═5f35bd6b-eb69-4afb-b5b5-34b8a1335738
# ╠═3e88c67a-848d-40ad-973e-3805b3d90eb8
# ╠═abc4aa4f-f69e-4e46-9ab1-e01ff8acb4e2
# ╟─8cba5133-5885-43d3-984d-8722d23ee91d
# ╟─e621a4ae-ea6e-4d08-a357-09b9d35718f1
# ╟─3e79bb43-f378-462f-8272-fdce8eed6b79
# ╟─e873d9ba-0c59-4fc4-90e9-8700be34f1b9
# ╟─13a284ab-57d1-462a-be1b-0e168d6c7d35
# ╟─9eaad914-82f1-43bf-9194-db8c0f1c70ef
# ╟─16a31c35-62d3-4395-9dc5-853abf9e2160
# ╟─190ab0db-ac8b-4ddd-ace3-90e07c2cffaa
# ╟─420ef17c-3df9-4e07-9333-af36de1e24a6
# ╟─bf76eba3-c6c7-4393-a913-e361161bed3c
# ╟─f143ef8b-c466-42c3-907e-fce1ba32fa1a
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
