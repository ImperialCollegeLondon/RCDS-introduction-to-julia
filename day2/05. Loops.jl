### A Pluto.jl notebook ###
# v0.19.38

using Markdown
using InteractiveUtils

# ╔═╡ 1e960b8c-26ba-11ef-25f9-5b341174f190
md"""
# Loops

## for loops

The syntax for a `for` loop is

```julia
for *var* in *loop iterable*
    *loop body*
end
```

## while loops

The syntax for a `while` is

```julia
while *condition*
    *loop body*
end
```

What do we think the following will produce?
"""

# ╔═╡ a11024b7-b8e7-49c7-9c02-3f17f4285952
i = 1

# ╔═╡ 19774eda-ecbc-4084-b414-87fad85cf92c
# ╠═╡ show_logs = false
while i <= 10
    println(i)
    i += 1
end

# ╔═╡ 0d60e0b1-72bd-40e8-8043-c01c894f9fff
md"""
#### Quick Quiz

`for` loops are better suited to these kinds of iteration. Write the equivalent `for` loop below
"""

# ╔═╡ 8fe71b97-855a-4185-aa5c-92045302d4ef
## YOUR CODE GOES HERE

# ╔═╡ 42ee3b22-fe61-410a-9839-fb928cbf5791
md"""
We could use a for loop to generate the same powers matrix as we did in the last notebook:
"""

# ╔═╡ bc9bd545-f879-423f-bba1-7cc9c6c19018
let	
	powers = zeros(Int, 8, 3)
	for pow in 1:3
	    for value in 1:8
	        powers[value, pow] = value ^ pow
	    end
	end
	powers
end

# ╔═╡ 4fc23000-43a7-49f9-9a82-a631d31f189c
md"""
# Array Comprehensions

As with most things we've seen so far, there is another way. Comprehensions let us write out more efficient loop logic in fewer lines of code.
"""

# ╔═╡ 066de6ab-f018-4945-be8c-cdef4e48b7fb


# ╔═╡ 66032c7f-f553-47f6-8955-df41ae466182


# ╔═╡ 54099495-cbb9-4624-8dc1-0ebd4b6d123f
md"""
And even our ever popular matrix of powers:
"""

# ╔═╡ 84f9f10e-4e98-4d1e-9640-64de48583384


# ╔═╡ 652545be-5a14-4684-a648-c9821463d489
md"""# The element type

!!! info "Reminder"

	Recall that every time a multidimensional array is output, it is displaying its element type and dimensionality, for example `Array{Int64, 2}`. This describes what it can store — and thus what it can return upon indexing.

Let's look at some behaviours related to element types in an array.

We can modify our `powers` array, by updating it at some index.
"""

# ╔═╡ 7258a3fa-a821-4a99-a49d-c6955cf742ec


# ╔═╡ 2ec0ddac-0b47-446a-a182-5d0760fac3d9
md"""
The above works, because 5.0 can be lesslessly converted to an integer. What happens when that isn't possible?
"""

# ╔═╡ 3ff1c45f-b94f-4931-ae21-7061a73379ad
powers[1, 1] = 5.6 # TODO fix this

# ╔═╡ d47b461b-f11d-40bc-8af2-257edc95fb4f
md"""
Arrays that have an exact and concrete element type are generally significantly faster, so Julia will try to find an amenable element type for you when constructing an array literal.
"""

# ╔═╡ 72e36b42-f570-4716-ae99-c3583b6d5270
fortytwosarray = [42, 42.0, 4.20e1, 4.20f1, 84//2, 0x2a]

# ╔═╡ 79bdcea7-42da-4b2b-ad8b-434794e35486


# ╔═╡ adf3114a-94b8-47d5-95bb-6e7f01e72afe


# ╔═╡ 2bae60ec-53dc-4b67-ad45-6e2057073c91
md"""
As you can see, `Float64` has been chosen as the element type that fits for this array. Every element of the array is now a 64-bit float.

We can disable this behaviour with `Any`.
"""

# ╔═╡ c2616f57-3660-40f9-8604-8093cfefe41c
fortytwos = Any[42, 42.0, 4.20e1, 4.20f1, 84//2, 0x2a]

# ╔═╡ 3b592f79-121c-4584-9c12-b58046b644d4
typeof(fortytwos)

# ╔═╡ 2ec4d6e9-67f8-42c6-9ec5-3cf0f3917dd4
for x in fortytwos
    show(x)
    println("\tisa $(typeof(x))")
end

# ╔═╡ b5397904-d5ba-450e-9193-6e77c87b372f


# ╔═╡ b10e42b9-f0cd-40d6-9638-1fb206c9f6e8


# ╔═╡ fc968c44-e175-4c81-a4a7-f8b191b42288
md"""
## Exercise Break

1. Use a for loop to create the below matrix, calling it `a_matrix`:
```julia
3×3 Matrix{Int64}:
 1  2  3
 4  5  6
 7  8  9
```
"""

# ╔═╡ f6767d55-ebaa-4d72-80eb-49f0d4643c13
## YOUR CODE GOES HERE

# ╔═╡ 9288a8f1-8644-46db-b0c0-a94ef801eb9d
let defined = @isdefined a_matrix
	if defined && a_matrix == [1 2 3; 4 5 6; 7 8 9] && eltype(a_matrix) == Int
		md"""
		$(Markdown.MD(Markdown.Admonition("correct", "Well done!!", [])))"""
	elseif defined && eltype(a_matrix) == Float64
		md"""
		$(Markdown.MD(Markdown.Admonition("warning", "Not quite...", [])))"""
	end
end

# ╔═╡ e1dde0b7-0c50-4cb6-b79d-8560dbed90d5
md"""
2. Use an array comprehension to create an an array `squares_arr` that stores the squares for all integers between 1 and 100.
"""

# ╔═╡ 02e92886-6053-485b-9515-4429e3cd9777
## YOUR CODE GOES HERE

# ╔═╡ a07f6902-cb19-4f45-ac4c-97e0d365719d
let defined = @isdefined squares_arr
	if defined && sum(squares_arr) == 338350
		md"""
		$(Markdown.MD(Markdown.Admonition("correct", "Well done!!", [])))"""
	end
end

# ╔═╡ Cell order:
# ╟─1e960b8c-26ba-11ef-25f9-5b341174f190
# ╠═a11024b7-b8e7-49c7-9c02-3f17f4285952
# ╠═19774eda-ecbc-4084-b414-87fad85cf92c
# ╟─0d60e0b1-72bd-40e8-8043-c01c894f9fff
# ╠═8fe71b97-855a-4185-aa5c-92045302d4ef
# ╟─42ee3b22-fe61-410a-9839-fb928cbf5791
# ╠═bc9bd545-f879-423f-bba1-7cc9c6c19018
# ╟─4fc23000-43a7-49f9-9a82-a631d31f189c
# ╠═066de6ab-f018-4945-be8c-cdef4e48b7fb
# ╠═66032c7f-f553-47f6-8955-df41ae466182
# ╟─54099495-cbb9-4624-8dc1-0ebd4b6d123f
# ╠═84f9f10e-4e98-4d1e-9640-64de48583384
# ╟─652545be-5a14-4684-a648-c9821463d489
# ╠═7258a3fa-a821-4a99-a49d-c6955cf742ec
# ╟─2ec0ddac-0b47-446a-a182-5d0760fac3d9
# ╠═3ff1c45f-b94f-4931-ae21-7061a73379ad
# ╟─d47b461b-f11d-40bc-8af2-257edc95fb4f
# ╠═72e36b42-f570-4716-ae99-c3583b6d5270
# ╠═79bdcea7-42da-4b2b-ad8b-434794e35486
# ╠═adf3114a-94b8-47d5-95bb-6e7f01e72afe
# ╟─2bae60ec-53dc-4b67-ad45-6e2057073c91
# ╠═c2616f57-3660-40f9-8604-8093cfefe41c
# ╠═3b592f79-121c-4584-9c12-b58046b644d4
# ╟─2ec4d6e9-67f8-42c6-9ec5-3cf0f3917dd4
# ╠═b5397904-d5ba-450e-9193-6e77c87b372f
# ╠═b10e42b9-f0cd-40d6-9638-1fb206c9f6e8
# ╟─fc968c44-e175-4c81-a4a7-f8b191b42288
# ╠═f6767d55-ebaa-4d72-80eb-49f0d4643c13
# ╟─9288a8f1-8644-46db-b0c0-a94ef801eb9d
# ╟─e1dde0b7-0c50-4cb6-b79d-8560dbed90d5
# ╠═02e92886-6053-485b-9515-4429e3cd9777
# ╟─a07f6902-cb19-4f45-ac4c-97e0d365719d
