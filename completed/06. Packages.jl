### A Pluto.jl notebook ###
# v0.19.38

using Markdown
using InteractiveUtils

# ╔═╡ d9fc5cba-f091-42c9-bbce-45ce03359425
using Example

# ╔═╡ 49468286-27ce-11ef-004f-631745764f27
md"""
# Packages

Julia has over [10 000](https://github.com/JuliaRegistries/General/blob/master/Registry.toml) registered packages, making packages a huge part of the Julia ecosystem.

To see all available packages, check [juliapackages.com](https://juliapackages.com/)


Let's learn how to install and use a package. Pluto comes with its own package manager, and will automatically install any packages you `import` or are `using` in the notebook.

We'll start by `using` the `Example` package
"""

# ╔═╡ 4785780e-6c9e-498b-b4ab-aa0e5df08cde
if (@isdefined Example)
	md"""
	$(Markdown.MD(Markdown.Admonition("info", "When you ran the cell above, Pluto installed the Example package for you!", [])))"""
end

# ╔═╡ f5c86216-ac85-42b2-9caa-92ca508f4329
md"""
With `using`, we're able to use the objects in a package without having to prefix them. There is a function called `hello` in the `Example` package. Try to call it in the cell below.
"""

# ╔═╡ 40b93bdc-50e9-4a8a-81fa-b829d59eef0a
hello("is it me you're looking for?")

# ╔═╡ be0bd41d-99d0-4ccb-a98a-e391baf5fba3
md"""
Now let's explore a more useful package - called `Colors`. This time we'll `import` it.
"""

# ╔═╡ 7623747f-1b2f-4fcf-b3e3-9f07372dda52
import Colors

# ╔═╡ 275f8938-2dfd-4a08-9101-94afbca94f5c
if (@isdefined Colors)
	md"""
	$(Markdown.MD(Markdown.Admonition("info", "Great, now Colors is installed too!", [])))"""
end

# ╔═╡ 3724b586-70d8-4a8d-89a4-d247d4ac3ba1
md"""
Because we've used `import`, we'll need to use the name of the package to refer to any objects within it. Try calling `distinguishable_colors(10)` in the cell below.
"""

# ╔═╡ 8ca41ba3-8a1a-4fff-b973-76e4e398290e
palette = Colors.distinguishable_colors(40)

# ╔═╡ 03737338-b2a8-485a-a782-5407342a5d43
rand(palette, 3, 3)

# ╔═╡ f31a888d-9b46-49af-9ab0-22e0318c786c
md"""
### Exercise Break

1. Use the `Primes` package to grab all prime numbers up to 1000, storing them in an array called `my_primes`


"""

# ╔═╡ 90844152-f568-4cbb-bc53-e92c9943bbc6


# ╔═╡ c3e828cc-9055-485c-9a4d-0e0d3bb2ea26


# ╔═╡ eb0700c3-d921-42ce-8ca7-abb8feea61e1
if (@isdefined my_primes) && length(my_primes) == 168
	md"""
	$(Markdown.MD(Markdown.Admonition("correct", "Great, there are 168 prime numbers in there.", [])))"""
end

# ╔═╡ Cell order:
# ╟─49468286-27ce-11ef-004f-631745764f27
# ╠═d9fc5cba-f091-42c9-bbce-45ce03359425
# ╟─4785780e-6c9e-498b-b4ab-aa0e5df08cde
# ╟─f5c86216-ac85-42b2-9caa-92ca508f4329
# ╠═40b93bdc-50e9-4a8a-81fa-b829d59eef0a
# ╟─be0bd41d-99d0-4ccb-a98a-e391baf5fba3
# ╠═7623747f-1b2f-4fcf-b3e3-9f07372dda52
# ╟─275f8938-2dfd-4a08-9101-94afbca94f5c
# ╟─3724b586-70d8-4a8d-89a4-d247d4ac3ba1
# ╠═8ca41ba3-8a1a-4fff-b973-76e4e398290e
# ╠═03737338-b2a8-485a-a782-5407342a5d43
# ╟─f31a888d-9b46-49af-9ab0-22e0318c786c
# ╠═90844152-f568-4cbb-bc53-e92c9943bbc6
# ╠═c3e828cc-9055-485c-9a4d-0e0d3bb2ea26
# ╟─eb0700c3-d921-42ce-8ca7-abb8feea61e1
