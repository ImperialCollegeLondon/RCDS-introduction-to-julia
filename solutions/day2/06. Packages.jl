### A Pluto.jl notebook ###
# v0.19.38

using Markdown
using InteractiveUtils

# ╔═╡ d9fc5cba-f091-42c9-bbce-45ce03359425
using Example

# ╔═╡ 90844152-f568-4cbb-bc53-e92c9943bbc6
using Primes

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

# ╔═╡ c3e828cc-9055-485c-9a4d-0e0d3bb2ea26
my_primes = primes(1000)

# ╔═╡ eb0700c3-d921-42ce-8ca7-abb8feea61e1
if (@isdefined my_primes) && length(my_primes) == 168
	md"""
	$(Markdown.MD(Markdown.Admonition("correct", "Great, there are 168 prime numbers in there.", [])))"""
end

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
Colors = "5ae59095-9a9b-59fe-a467-6f913c188581"
Example = "7876af07-990d-54b4-ab0e-23690620f79a"
Primes = "27ebfcd6-29c5-5fa9-bf4b-fb8fc14df3ae"

[compat]
Colors = "~0.12.11"
Example = "~0.5.3"
Primes = "~0.5.6"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.10.1"
manifest_format = "2.0"
project_hash = "0d6107f692fea3c8b31ea93804ee01a0b736754b"

[[deps.Artifacts]]
uuid = "56f22d72-fd6d-98f1-02f0-08ddc0907c33"

[[deps.ColorTypes]]
deps = ["FixedPointNumbers", "Random"]
git-tree-sha1 = "b10d0b65641d57b8b4d5e234446582de5047050d"
uuid = "3da002f7-5984-5a60-b8a6-cbb66c0b333f"
version = "0.11.5"

[[deps.Colors]]
deps = ["ColorTypes", "FixedPointNumbers", "Reexport"]
git-tree-sha1 = "362a287c3aa50601b0bc359053d5c2468f0e7ce0"
uuid = "5ae59095-9a9b-59fe-a467-6f913c188581"
version = "0.12.11"

[[deps.CompilerSupportLibraries_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "e66e0078-7015-5450-92f7-15fbd957f2ae"
version = "1.1.0+0"

[[deps.Example]]
git-tree-sha1 = "46e44e869b4d90b96bd8ed1fdcf32244fddfb6cc"
uuid = "7876af07-990d-54b4-ab0e-23690620f79a"
version = "0.5.3"

[[deps.FixedPointNumbers]]
deps = ["Statistics"]
git-tree-sha1 = "05882d6995ae5c12bb5f36dd2ed3f61c98cbb172"
uuid = "53c48c17-4a7d-5ca2-90c5-79b7896eea93"
version = "0.8.5"

[[deps.IntegerMathUtils]]
git-tree-sha1 = "b8ffb903da9f7b8cf695a8bead8e01814aa24b30"
uuid = "18e54dd8-cb9d-406c-a71d-865a43cbb235"
version = "0.1.2"

[[deps.Libdl]]
uuid = "8f399da3-3557-5675-b5ff-fb832c97cbdb"

[[deps.LinearAlgebra]]
deps = ["Libdl", "OpenBLAS_jll", "libblastrampoline_jll"]
uuid = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"

[[deps.OpenBLAS_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "Libdl"]
uuid = "4536629a-c528-5b80-bd46-f80d51c5b363"
version = "0.3.23+4"

[[deps.Primes]]
deps = ["IntegerMathUtils"]
git-tree-sha1 = "cb420f77dc474d23ee47ca8d14c90810cafe69e7"
uuid = "27ebfcd6-29c5-5fa9-bf4b-fb8fc14df3ae"
version = "0.5.6"

[[deps.Random]]
deps = ["SHA"]
uuid = "9a3f8284-a2c9-5f02-9a11-845980a1fd5c"

[[deps.Reexport]]
git-tree-sha1 = "45e428421666073eab6f2da5c9d310d99bb12f9b"
uuid = "189a3867-3050-52da-a836-e630ba90ab69"
version = "1.2.2"

[[deps.SHA]]
uuid = "ea8e919c-243c-51af-8825-aaa63cd721ce"
version = "0.7.0"

[[deps.Serialization]]
uuid = "9e88b42a-f829-5b0c-bbe9-9e923198166b"

[[deps.SparseArrays]]
deps = ["Libdl", "LinearAlgebra", "Random", "Serialization", "SuiteSparse_jll"]
uuid = "2f01184e-e22b-5df5-ae63-d93ebab69eaf"
version = "1.10.0"

[[deps.Statistics]]
deps = ["LinearAlgebra", "SparseArrays"]
uuid = "10745b16-79ce-11e8-11f9-7d13ad32a3b2"
version = "1.10.0"

[[deps.SuiteSparse_jll]]
deps = ["Artifacts", "Libdl", "libblastrampoline_jll"]
uuid = "bea87d4a-7f5b-5778-9afe-8cc45184846c"
version = "7.2.1+1"

[[deps.libblastrampoline_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "8e850b90-86db-534c-a0d3-1478176c7d93"
version = "5.8.0+1"
"""

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
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
