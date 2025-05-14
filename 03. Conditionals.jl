### A Pluto.jl notebook ###
# v0.20.4

using Markdown
using InteractiveUtils

# ╔═╡ cc18a366-138f-11ef-1a39-13a828c1e2cc
md"""
# Conditionals

In Julia, we can build a conditional statement with `if`, `elseif`, `else`, and, like in other Julia blocks, the `end` keyword.
"""

# ╔═╡ 44ac06f0-a578-4694-a9f3-203cba52e9d1
grad_year = 2025

# ╔═╡ f23ad629-6ab7-4e7b-bcb5-6488224e023b


# ╔═╡ a7be95cd-c9d0-4397-9da9-1c0cfc423f18
md"""
We can include many `elseif` expressions, or none at all. The `else` keyword can be used once, or not at all.
"""

# ╔═╡ a4748c59-e1e2-408e-ae42-2dab937dc1ba
divisor = 0

# ╔═╡ 481683e5-7fef-4d95-8471-74a5426c3701
if divisor > 0
	10 / divisor
end

# ╔═╡ c80b42a3-ee7d-4894-a452-c0831c79417f
if divisor > 0
	10 / divisor
else
	"Zero division error!"
end

# ╔═╡ 4adfddf5-a11d-49b8-a837-705713b44a9f
md"""
## Ternary Operators

Julia lets us simplify this last block into a single line of code, by using the ternary operator syntax:

	a ? b : c

which equates to

	if a
		b
	else
		c
	end
"""

# ╔═╡ cb98bf28-6193-453e-91b5-a9aafa8b463b


# ╔═╡ 4801e0be-b866-478f-9cfd-0722322fcdcf
md"""
## Short Circuits

A logical **and** in Julia is given as:

	a && b

which will return `true` if both `a` and `b` are true. If `a` is false, then the overall statement cannot possibly be true, so Julia doesn't need to check `b` at all. Instead, it can just *short-circuit* and return `false`. This is particularly useful where `b` would be invalid, or computationally expensive.
"""

# ╔═╡ c9a128a7-e97b-4bc3-a938-acc5bee136b4


# ╔═╡ 28773138-ff47-4b16-95b2-1a92651d04de
md"""
When `a` is true, then Julia will evaluate `b`. Here we use it for a simpler `if` logic:
"""

# ╔═╡ c514a744-b1f6-4fba-9df8-c8d25662003b


# ╔═╡ 7e3e660d-9776-4a71-a40e-b57f20ab6dc1
md"""
Also have a look at `||` for the logical **or** operation. It will short circuit when `a` is true, so can be used for a fallback when `a` is false.
"""

# ╔═╡ 1293f7b3-5431-44f6-be86-743feca0325e


# ╔═╡ a2d94f49-66ab-4538-8fe4-4f531938544e
md"""
The logical and / or operators are more commonly used when combining conditionals.
"""

# ╔═╡ 00934f5e-767c-4654-a4e2-8fbd4ab322b3
begin
	has_key = true
	has_password = true
	if has_key || has_password
		print("Access granted.")
	end
end

# ╔═╡ 2367bd8d-9184-40b9-a1c6-c4d168ef4911
md"""
# Exercise Break

1. Write a conditional if / else that returns `number` if `number` is even or "odd" if `number` is odd.

"""

# ╔═╡ 28149256-624c-4220-9fa1-ea608b59a7d9
number = 6

# ╔═╡ e302ce00-7ca8-496d-8de8-6f96b9dd034e
## YOUR CODE GOES HERE

# ╔═╡ 80f17424-6f4f-4ac7-9a94-9999b75a31e7
md"""
2. Rewrite the code from **1.** using a ternary operator.
"""

# ╔═╡ 274db092-4449-442d-9723-06241f7c924e
## YOUR CODE GOES HERE

# ╔═╡ Cell order:
# ╟─cc18a366-138f-11ef-1a39-13a828c1e2cc
# ╠═44ac06f0-a578-4694-a9f3-203cba52e9d1
# ╠═f23ad629-6ab7-4e7b-bcb5-6488224e023b
# ╟─a7be95cd-c9d0-4397-9da9-1c0cfc423f18
# ╠═481683e5-7fef-4d95-8471-74a5426c3701
# ╠═c80b42a3-ee7d-4894-a452-c0831c79417f
# ╠═a4748c59-e1e2-408e-ae42-2dab937dc1ba
# ╟─4adfddf5-a11d-49b8-a837-705713b44a9f
# ╠═cb98bf28-6193-453e-91b5-a9aafa8b463b
# ╟─4801e0be-b866-478f-9cfd-0722322fcdcf
# ╠═c9a128a7-e97b-4bc3-a938-acc5bee136b4
# ╟─28773138-ff47-4b16-95b2-1a92651d04de
# ╠═c514a744-b1f6-4fba-9df8-c8d25662003b
# ╟─7e3e660d-9776-4a71-a40e-b57f20ab6dc1
# ╠═1293f7b3-5431-44f6-be86-743feca0325e
# ╟─a2d94f49-66ab-4538-8fe4-4f531938544e
# ╠═00934f5e-767c-4654-a4e2-8fbd4ab322b3
# ╟─2367bd8d-9184-40b9-a1c6-c4d168ef4911
# ╠═28149256-624c-4220-9fa1-ea608b59a7d9
# ╠═e302ce00-7ca8-496d-8de8-6f96b9dd034e
# ╟─80f17424-6f4f-4ac7-9a94-9999b75a31e7
# ╠═274db092-4449-442d-9723-06241f7c924e
