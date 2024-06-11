### A Pluto.jl notebook ###
# v0.19.38

using Markdown
using InteractiveUtils

# ╔═╡ 52636042-dec8-4f0e-a11f-71a1827ca301
md"""
# Duck-Typing

> "If it quacks like a duck, it's a duck..."

Functions in Julia will work on whatever inputs make sense.

For example, `say_hi()` works on this character from a popular musical.
"""

# ╔═╡ efc60136-1d6e-4940-8913-1ec8f91f6971


# ╔═╡ 0b604e9b-fef9-48e8-a08f-34349a49c4be
md"""
Curiously, `square_it()` will work on a string. 

This is because the `*` operator is defined for string concatenation (joining strings together).
"""

# ╔═╡ 301fd6af-4a2a-4907-9332-93973098bb3b


# ╔═╡ 060da6cb-3791-411b-ac4f-e02c6ec55619
md"""
Sadly, I cannot `round()` my surname to simplify it.
"""

# ╔═╡ 4b6cea73-ddb6-4c4a-afc8-d4c433a9b189


# ╔═╡ cc18a366-138f-11ef-1a39-13a828c1e2cc
md"""
# Conditionals

In Julia, we can build a conditional statement with `if`, `elseif`, `else`, and, like in other Julia blocks, the `end` keyword.
"""

# ╔═╡ 44ac06f0-a578-4694-a9f3-203cba52e9d1
grad_year = 2025

# ╔═╡ 28ed87a2-9c16-492a-80f0-adeacf30e7ab


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

# ╔═╡ 18745a82-2782-4930-a757-e8de89ccf07e
md"""
# Appendix
"""

# ╔═╡ c3eb4b66-2334-4358-81bc-64eaa1ecef06
say_hi(name) = println("Hi $name !")

# ╔═╡ 5860aed9-c80b-4105-8c54-e40236b8622f
square_it(x) = x ^ 2

# ╔═╡ Cell order:
# ╟─52636042-dec8-4f0e-a11f-71a1827ca301
# ╠═efc60136-1d6e-4940-8913-1ec8f91f6971
# ╟─0b604e9b-fef9-48e8-a08f-34349a49c4be
# ╠═301fd6af-4a2a-4907-9332-93973098bb3b
# ╟─060da6cb-3791-411b-ac4f-e02c6ec55619
# ╠═4b6cea73-ddb6-4c4a-afc8-d4c433a9b189
# ╟─cc18a366-138f-11ef-1a39-13a828c1e2cc
# ╠═44ac06f0-a578-4694-a9f3-203cba52e9d1
# ╠═28ed87a2-9c16-492a-80f0-adeacf30e7ab
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
# ╟─18745a82-2782-4930-a757-e8de89ccf07e
# ╟─c3eb4b66-2334-4358-81bc-64eaa1ecef06
# ╟─5860aed9-c80b-4105-8c54-e40236b8622f
