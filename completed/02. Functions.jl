### A Pluto.jl notebook ###
# v0.19.38

using Markdown
using InteractiveUtils

# ╔═╡ b9584f90-d0de-11ee-0cd7-81185dad6eca
md"""
# Functions

Functions are a nice follow-on from compound expressions and `let` blocks, which let us bundle code into discrete, manageable units. Functions go a step further by letting us to execute the same code from different parts of our Notebook without rewriting it.

Topics:
1. How to declare a function
2. Duck-typing in Julia

## How to declare a function

Julia gives us a few different ways to write a function.

The first uses the `function` block. Don't forget the `end` keyword to close the block!

"""

# ╔═╡ 41fcdb73-1fd7-4427-9121-2389fdb2c6da
function say_hi(name)
	println("Hi $name, nice to see you!")
end

# ╔═╡ d4661b4e-90b1-4c01-8357-25cc2564b575
say_hi("everyone")

# ╔═╡ ac423cd7-387c-48d1-b5dd-480f6de01092
function square_it(x)
	x ^ 2
end

# ╔═╡ 8f7a82da-2553-4f63-9a65-2310c768b442
md"""
### Return

Notice we didn't need to use a `return` statement here.

Just like compound expressions evaluate to their last expression, functions return the last expression they evaluate.

Have a look:
"""

# ╔═╡ 5cb275d2-f77c-4c41-a72c-df34109242fc
square_it(12)

# ╔═╡ 3df41292-8099-42ff-8037-c9992c102030
md"""
Here is another function to square some input.
"""

# ╔═╡ c8ab6cb1-1027-437b-861d-4cc04a1e4ca0
function another_square(x)
	x ^ 2
	y = 10
end

# ╔═╡ 2fb0fe41-ff2c-42e8-9bff-912a749d3b5a
md"""
What do we think the output of `another_square(2)` will return? Try it below.
"""

# ╔═╡ cde6390c-32f9-455d-8412-b6c273a91432
another_square(2)

# ╔═╡ 8fe7f524-d075-4685-834f-48607d873567
md"""
To override this behaviour, we can use the explicit `return`.

Fix the code in the cell below to make the function work as expected.
"""

# ╔═╡ 128a3167-c6ff-46e6-b4e6-47d38dfc3f1f
function explicit_square(x)
	x ^ 2 # TODO: Fix this line
	y = 10
end

# ╔═╡ 6eb77158-9ba9-44ba-8115-36b78e322cca
explicit_square(2)

# ╔═╡ d0af7c46-2c38-4e74-9698-46a453d4f213
md"""
### One-liners

For very simple functions, there is a one-line alternative to the `function` block syntax.

We could have defined the above functions like so:
"""

# ╔═╡ 639a498a-877b-4b3c-9d4a-974595f70228
say_hi_again(name) = println("Hi $name, nice to see you again!")

# ╔═╡ 8d9cf0df-bd73-41e5-99d0-f0d2053f57ea
square_it_again(x) = x ^ 2

# ╔═╡ 05e47f0e-69b2-4afc-aa56-155269a1db51
say_hi_again("Jay")

# ╔═╡ 003283d1-3d45-49fb-a33c-f4bd1189d602
square_it_again(24)

# ╔═╡ a845549a-8581-491c-b746-7edbc2f91a64
md"""
### Anonymous functions

Finally, we could have defined these as anonymous functions.

These are most useful when you need a simple function *on the fly*, usually when a function expects another function as an argument.

Anonymous functions are so called because they are not named - useful if you don't need to reuse the function again.

!!! note
	For illustration purposes below, we assign these functions to a variable (effectively giving them a name), but this is not typical usage.
"""

# ╔═╡ 75f29bba-6952-4839-be37-6aaa422ffbfc
hi_once_again = name -> println("Hi $name, we keep running into each other!")

# ╔═╡ 351ca795-7a46-4968-8435-70406e32bf93
square_once_again = x -> x ^ 2

# ╔═╡ ba3115af-240a-447c-be79-44604a2e6f08
hi_once_again("again")

# ╔═╡ 9ca5c34a-d81c-4c32-b9a5-cbef54cba853
square_once_again(48)

# ╔═╡ b0d56dbd-17bd-411f-bb58-4525bfff0bf9
md"""
# Exercise Break

1. Transform the `let` block below into a function so it can be reused to find the area of circles with different radii.

"""

# ╔═╡ 6926ee86-e795-457a-86fc-a7241cbe6b51
let
	r = 3.09
	area = π * r ^ 2
	round(area, digits=2)
end	

# ╔═╡ d533671b-48b5-451a-a9ff-01443a146a8b
# Use this cell to call your function

# ╔═╡ b8b9fb7f-4e9f-4f0d-b53b-7f6b35824daf
md"""
2. Read the documentation on the `do_some_math()` function below and use the function to raise the number 5 to the power of 10.

!!! notice
	Notice that the function expects a function as one of its arguments.
"""

# ╔═╡ 631efa6f-c01d-4e8a-a568-075291da84e7
"""
	do_some_math(num, math_text, math_fun)

Apply the function `math_fun` to `num`, printing `math_text` and the result to the user
"""
function do_some_math(num, math_text, math_fun)
	result = math_fun(num)
	print("$num $math_text is $result")
end

# ╔═╡ 459a3757-f43d-4fc9-95a9-2b4ad86a6344
do_some_math(5, "to the power of 10", x -> x ^ 10)

# ╔═╡ b653fc4a-ecca-4366-8bcf-37d03972e222
md"""
3. Inspect (un-hide) the cell above that displays the documentation for `do_some_math()` to see how documentation is added to a user-defined function. Add documentation for the `say_hi()` function we defined at the top of this notebook and search for it in the *Live Docs* to see it.
"""

# ╔═╡ 70be9c65-0230-4311-8472-e5b78a9dc248
md"""
# Duck-Typing

> "If it quacks like a duck, it's a duck..."

Functions in Julia will work on whatever inputs make sense.

For example, `say_hi()` works on this character from a popular musical.
"""

# ╔═╡ d050a89c-a221-4443-9c30-2fb960a323f7
say_hi(24601)

# ╔═╡ 4f39208e-84bf-4f91-9970-aa61342965b5
md"""
Curiously, `square_it()` will work on a string. 

This is because the `*` operator is defined for string concatenation (joining strings together).
"""

# ╔═╡ fcacb276-d701-4caa-bbb8-24926a88f7f4
square_it("Jay")

# ╔═╡ 01123b4b-2112-4034-990d-d255f8a88176
md"""
Sadly, I cannot `round()` my surname to simplify it.
"""

# ╔═╡ d91d4423-b334-4a6d-a8df-82806d1a30a2
round("DesLauriers")

# ╔═╡ 15a20987-d560-429f-bc79-d67c70207382
md"""
We'll explore more of this when we look at multiple dispatch tomorrow and we'll come back to functions when we start learning about data structures!
"""

# ╔═╡ Cell order:
# ╟─b9584f90-d0de-11ee-0cd7-81185dad6eca
# ╠═41fcdb73-1fd7-4427-9121-2389fdb2c6da
# ╠═d4661b4e-90b1-4c01-8357-25cc2564b575
# ╠═ac423cd7-387c-48d1-b5dd-480f6de01092
# ╟─8f7a82da-2553-4f63-9a65-2310c768b442
# ╠═5cb275d2-f77c-4c41-a72c-df34109242fc
# ╟─3df41292-8099-42ff-8037-c9992c102030
# ╠═c8ab6cb1-1027-437b-861d-4cc04a1e4ca0
# ╟─2fb0fe41-ff2c-42e8-9bff-912a749d3b5a
# ╠═cde6390c-32f9-455d-8412-b6c273a91432
# ╟─8fe7f524-d075-4685-834f-48607d873567
# ╠═128a3167-c6ff-46e6-b4e6-47d38dfc3f1f
# ╠═6eb77158-9ba9-44ba-8115-36b78e322cca
# ╟─d0af7c46-2c38-4e74-9698-46a453d4f213
# ╠═639a498a-877b-4b3c-9d4a-974595f70228
# ╠═8d9cf0df-bd73-41e5-99d0-f0d2053f57ea
# ╠═05e47f0e-69b2-4afc-aa56-155269a1db51
# ╠═003283d1-3d45-49fb-a33c-f4bd1189d602
# ╟─a845549a-8581-491c-b746-7edbc2f91a64
# ╠═75f29bba-6952-4839-be37-6aaa422ffbfc
# ╠═351ca795-7a46-4968-8435-70406e32bf93
# ╠═ba3115af-240a-447c-be79-44604a2e6f08
# ╠═9ca5c34a-d81c-4c32-b9a5-cbef54cba853
# ╟─b0d56dbd-17bd-411f-bb58-4525bfff0bf9
# ╠═6926ee86-e795-457a-86fc-a7241cbe6b51
# ╠═d533671b-48b5-451a-a9ff-01443a146a8b
# ╟─b8b9fb7f-4e9f-4f0d-b53b-7f6b35824daf
# ╟─631efa6f-c01d-4e8a-a568-075291da84e7
# ╠═459a3757-f43d-4fc9-95a9-2b4ad86a6344
# ╟─b653fc4a-ecca-4366-8bcf-37d03972e222
# ╟─70be9c65-0230-4311-8472-e5b78a9dc248
# ╠═d050a89c-a221-4443-9c30-2fb960a323f7
# ╟─4f39208e-84bf-4f91-9970-aa61342965b5
# ╠═fcacb276-d701-4caa-bbb8-24926a88f7f4
# ╟─01123b4b-2112-4034-990d-d255f8a88176
# ╠═d91d4423-b334-4a6d-a8df-82806d1a30a2
# ╟─15a20987-d560-429f-bc79-d67c70207382
