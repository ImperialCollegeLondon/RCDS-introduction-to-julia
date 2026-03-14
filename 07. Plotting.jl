### A Pluto.jl notebook ###
# v0.20.8

using Markdown
using InteractiveUtils

# ╔═╡ 7a251168-b76b-4d9a-8b34-be1e3d1c5a71
using CairoMakie

# ╔═╡ 9fbb35b2-27e2-11ef-093b-0bfff810e23f
md"""
# Plotting

## Basics
There are a few different ways to plot in Julia.

Here we'll show you how to use `CairoMakie.jl`, the modern Julia plotting library. CairoMakie produces high-quality static plots and is part of the Makie ecosystem. Let's bring it into our notebook with `using`.
"""

# ╔═╡ d2e05a2d-8514-445e-8d19-d7cf4993f4cf
md"""
In the name of scientific inquiry, let's use this notebook to examine the relationship between the global temperature and the number of pirates between roughly 1860 and 2000. We have some data below that we'd like to plot.
"""

# ╔═╡ f064dc5e-e258-4747-8e95-bf9435ae0c50
global_temp = [14.4, 14.5, 14.8, 15.2, 15.5, 15.8]


# ╔═╡ 2ce938fe-1554-405a-b0fc-36d699faa6b1
num_pirates = [45000, 20000, 15000, 5000, 400, 17]

# ╔═╡ e286b95f-e414-4b4f-989d-c9235eb12a7b
md"""
CairoMakie produces static plots directly — no backend selection is needed. It renders using Cairo, which gives you publication-quality output out of the box.
"""

# ╔═╡ cc9f2dc1-3d92-4697-8723-5544febbcd6a


# ╔═╡ 18a6cf61-8df1-44c2-a05b-a044e8b183a5
md"""
and now we can use commands like `lines` and `scatter` to generate plots. In Makie, `lines` is used for line plots (instead of `plot`).
"""

# ╔═╡ 546c1f6f-b95c-4b6c-b18f-9e043fb0b7b8


# ╔═╡ 9a0ba5d9-2d79-47c1-80c4-a7aab24795a8
md"""
In Makie, the `!` at the end of a function name (like `scatter!`) means it adds to an existing axis rather than creating a new figure. The pattern is to create a `Figure` and an `Axis`, then use `lines!` and `scatter!` to add plot elements to that axis:

```julia
begin
    fig = Figure()
    ax = Axis(fig[1,1])
    lines!(ax, num_pirates, global_temp, label="line")
    scatter!(ax, num_pirates, global_temp, label="points")
    axislegend(ax)
    fig
end
```

Try it yourself in the cell below!
"""

# ╔═╡ e7c452d8-6169-403e-bf7a-1a5ef880f932


# ╔═╡ f81f7f23-947c-4d79-9f3a-816e35da4133
md"""
!!! warning
	As a matter of best practice, all mutating (!) functions related to one plot should be in the same `begin` block. Taking it step-by-step here is helpful for learning, but it can introduce some buggy behaviour.
"""

# ╔═╡ a5c8a475-2b64-4afe-93e2-32e621345ad1
md"""
This still doesn't look quite right. The number of pirates has decreased since 1860, so reading the plot from left to right is like looking backwards in time rather than forwards. Let's flip the x axis to better see how pirate populations have caused global temperatures to change over time!
"""

# ╔═╡ c245eab8-feb9-41b7-857d-3d3d14abe991
begin
	fig = Figure()
	ax = Axis(fig[1,1],
		xlabel="Number of Pirates [Approximate]",
		ylabel="Global Temperature (C)",
		title="Influence of pirate population on global warming")
	lines!(ax, num_pirates, global_temp, label="line")
	scatter!(ax, num_pirates, global_temp, label="points")
	axislegend(ax)
	# TODO: flip this plot
	fig
end

# ╔═╡ 298da6be-db34-4517-86f1-694970074a5b
md"""
And there we have it!

This is a joke about how people often conflate correlation and causation.

CairoMakie produces publication-quality static plots. If you need interactive or GPU-accelerated plots, the Makie ecosystem also offers `WGLMakie` (for web) and `GLMakie` (for desktop), but we won't need those here.
"""

# ╔═╡ 2edd3cfc-9013-4b19-83f2-9b98cbacedcb


# ╔═╡ 627c8d9e-0f07-4c9a-b2bd-5e14426b3fba
md"""
Now let's explore another fun thing we can do with CairoMakie — animations!
"""

# ╔═╡ cc767273-86c3-4ecb-b267-4b92168d7b33

# ╔═╡ 030d8ce3-82ba-4367-aac8-55b4454eafa6
md"""
And create an animated sine wave!
"""

# ╔═╡ 39a6eac1-4ec4-45a7-8b01-662247bfc102
x = 0:0.01:2π # an array with values 0 to 2π , at a step of 0.1

# ╔═╡ 99ed55df-8d00-4954-890e-4dd04bad3bd4


# ╔═╡ 4d73f3e6-579c-4555-9207-a8310efeaf54
md"""
### Exercises

1. Given
```julia
x = -10:10
```
use `lines` to plot y vs. x for $y = x^2$.  If you run into an issue, look at the hint below.
"""

# ╔═╡ a7364ac8-20d5-4ace-8b50-8e4c0881ce2a
## YOUR CODE GOES HERE

# ╔═╡ 6255bd68-0b17-4cb4-a4d3-d2614674e8c4
md"""
!!! hint
	x and y are already defined in the global scope. You could use different variable names, but don't you know a way to limit the scope of a variable?
"""

# ╔═╡ b7379e80-61cc-41dd-b812-e4051f8e1b4a
md"""
2. Execute the following code:
"""

# ╔═╡ 90f6b5ed-bff9-4e5b-a433-ce06666effd6
begin
	z = -10:10
	fig = Figure()
	ax1 = Axis(fig[1,1]); lines!(ax1, z, z)
	ax2 = Axis(fig[1,2]); lines!(ax2, z, z.^2)
	ax3 = Axis(fig[2,1]); lines!(ax3, z, z.^3)
	ax4 = Axis(fig[2,2]); lines!(ax4, z, z.^4)
	fig
end

# ╔═╡ f93ee3be-57f3-4d66-9974-1e857e847989
md"""
and then create a $4x1$ plot using Makie's grid layout (i.e., place four axes in a single column).

Learn more about Makie layouts [here](https://docs.makie.org/stable/tutorials/layout-tutorial).
"""

# ╔═╡ bc776cd3-a9af-423f-8c21-7e1fc1e9a8cd
## YOUR CODE GOES HERE


# ╔═╡ Cell order:
# ╟─9fbb35b2-27e2-11ef-093b-0bfff810e23f
# ╠═7a251168-b76b-4d9a-8b34-be1e3d1c5a71
# ╟─d2e05a2d-8514-445e-8d19-d7cf4993f4cf
# ╠═f064dc5e-e258-4747-8e95-bf9435ae0c50
# ╠═2ce938fe-1554-405a-b0fc-36d699faa6b1
# ╟─e286b95f-e414-4b4f-989d-c9235eb12a7b
# ╠═cc9f2dc1-3d92-4697-8723-5544febbcd6a
# ╟─18a6cf61-8df1-44c2-a05b-a044e8b183a5
# ╠═546c1f6f-b95c-4b6c-b18f-9e043fb0b7b8
# ╟─9a0ba5d9-2d79-47c1-80c4-a7aab24795a8
# ╠═e7c452d8-6169-403e-bf7a-1a5ef880f932
# ╟─f81f7f23-947c-4d79-9f3a-816e35da4133
# ╟─a5c8a475-2b64-4afe-93e2-32e621345ad1
# ╠═c245eab8-feb9-41b7-857d-3d3d14abe991
# ╟─298da6be-db34-4517-86f1-694970074a5b
# ╠═2edd3cfc-9013-4b19-83f2-9b98cbacedcb
# ╟─627c8d9e-0f07-4c9a-b2bd-5e14426b3fba
# ╠═cc767273-86c3-4ecb-b267-4b92168d7b33
# ╟─030d8ce3-82ba-4367-aac8-55b4454eafa6
# ╠═39a6eac1-4ec4-45a7-8b01-662247bfc102
# ╠═99ed55df-8d00-4954-890e-4dd04bad3bd4
# ╟─4d73f3e6-579c-4555-9207-a8310efeaf54
# ╠═a7364ac8-20d5-4ace-8b50-8e4c0881ce2a
# ╟─6255bd68-0b17-4cb4-a4d3-d2614674e8c4
# ╟─b7379e80-61cc-41dd-b812-e4051f8e1b4a
# ╠═90f6b5ed-bff9-4e5b-a433-ce06666effd6
# ╟─f93ee3be-57f3-4d66-9974-1e857e847989
# ╠═bc776cd3-a9af-423f-8c21-7e1fc1e9a8cd
