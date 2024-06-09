### A Pluto.jl notebook ###
# v0.19.38

using Markdown
using InteractiveUtils

# ╔═╡ e22c1412-cf4c-11ee-1b2b-f98109dfd08f
md"""
# Hello!

And welcome to Introduction to Julia at the Graduate School. We'll be using [`Pluto`](https://plutojl.org/) to get familiar with the language.

Pluto is a Notebook format. It is similar to Jupyter, but there are a few key differences:
* Pluto is just for Julia
* Pluto only has code cells
* Pluto cells contain one expression each
* Pluto doesn't allow variable re-assignment
* Pluto cells are reactive (changes in one cell can affect another)

We'll see some of these quirks in action as we work with Julia in this Notebook.
"""

# ╔═╡ 1c199569-414f-467f-b68a-006c6c10eadc
md"""
In Julia, we usually use `println()` to print. And in Pluto, we use `Shift+Enter` to run a cell. Try it out!
"""


# ╔═╡ fc8b2f88-77a6-4a84-91a1-3efbd0e92317
println("Julia")

# ╔═╡ c964fe22-b644-460c-8960-ec66abeb36ff
md"""
You can see the Julia docs *as-you-type* with the `Live Docs` feature of Pluto. Try it below!
"""

# ╔═╡ 013179fa-3e31-4527-92d0-5c725e56b619
print("Hello")

# ╔═╡ 78ea3d9b-9273-4aa4-b5b7-5eb8154ea5ab
print("World")

# ╔═╡ e452dcb5-b3da-4388-8f7f-1dd02ec48e8c
md"""
# Variables

To assign variables, we need name, value and equals sign. Julia is a dynamic language with type inference and implicit declaration, so no hard requirement to explicitly declare or assign a type.
"""

# ╔═╡ 03b72a74-3428-40b7-94ac-fefe8d613aae
my_answer = 42

# ╔═╡ 71473247-35ee-4bed-95a6-e34162c9fcf2
typeof(my_answer)

# ╔═╡ 37f732d0-d24f-4e91-8c73-4b7ecfe0c6fe
pi

# ╔═╡ cb15ebd0-5580-4b98-b116-df3d58833eca
typeof(pi)

# ╔═╡ 791aa777-d195-434f-ab57-599f4d771d4f
😺 = "my smiley cat!"

# ╔═╡ 5f3bf493-96e4-47c4-a788-8d932f286886
typeof(😺)

# ╔═╡ 0ce1ec85-18ff-44bb-a073-1ee07744f9eb
# \:smi    ---> <tab> ---> select from drop-down ---> <enter>


# ╔═╡ 076f5d7a-9c0e-4ff3-a0af-24b49477f364
md"""
*Normally* in Julia, *outside* of a Pluto Notebook, we can re-assign new values to existing variables. Variables can even change type.
"""

# ╔═╡ 8165649a-746b-48d3-a86e-8b100c4b2c08
typeof(my_pi)

# ╔═╡ a86206f9-4924-4546-8f70-4e70d6b63203
md"""
Notice though, in Pluto, this disables the earlier cell where we originally defined the variable.

This feature of Pluto, as well as *one expression per cell* will take some getting used to, but are well-intentioned, pushing developers to write more reproducible code in a more functional style.

These features also work to make Pluto Notebooks **reactive**.

!!! info "Reactivity"
	The cell below prints `my_pi`. 
	
	Make a change to the definition of `my_pi` in the cell above, and run it.
	
	What happens to the output of the cell below?
"""

# ╔═╡ 6fc44c18-1b85-45a0-8ec9-52e1b38d256f
print(my_pi)

# ╔═╡ ae162d4b-d83f-4dd1-a6fc-742cd8e144be
md"""
# Comments

Here's how comments look in Julia. You can type them in-line with your code.
"""

# ╔═╡ b0c59c61-2f7d-47bd-9082-bcdd44fe6140
# This is a single line comment, using the hashtag

# ╔═╡ da18109b-dc2b-4c13-9c4b-65909928f4e1
#=
	This is a multi-line comment.
	As with the single line comment,
	this text is ignored by the
	interpreter.
=#

# ╔═╡ cf422c68-f253-46ba-ba11-08b204e4038d
md"""
## Documentation

In a Notebook environment, you get the benefit of annotating your code using Markdown - like we've done in this Pluto Notebook.

Pluto will render text to Markdown when it is between these *fences*: `md\"\"\"` and `\"\"\"`. 

!!! tip
	Quickly insert fences with `Ctrl-M`!

I'll hide the raw Markdown in these Notebooks, but if you'd like to see it, click the eye at the top left of a cell 👀. If you inspect the Markdown for this cell, you'll see how we create the tip and notice "call-outs" here.

	
!!! warning "Notice!"
	Be aware that a Markdown block counts as the one expression you're allowed in a cell.
"""

# ╔═╡ 3d345507-5512-4a56-89ce-6bbd424744ed
md"""
# Basic Math

Here are the infix operators for basic arithmetic.
"""

# ╔═╡ 62331f66-fca5-49de-8d17-88b2180fb639
addition = 3 + 7

# ╔═╡ baa6e805-727d-4846-aaae-59b21ce9637e
subtraction = 14 - 4

# ╔═╡ 45dfff43-8eb6-483a-8af4-5e4429c78875
multiplication = 20 * 5

# ╔═╡ c9564bee-6a08-4278-9317-1eb2787a7545
division = 100 / 10

# ╔═╡ 6c4b845a-b4a0-4904-abbf-8f2bd44a5638
exponentiation = 10 ^ 2

# ╔═╡ c1781e49-49fb-4c18-867d-4e927f560563
modulus = 101 % 2 # can also use mod()

# ╔═╡ c9e299e5-9a35-4f41-957c-1c4e5e716ad9
integer_div = 10 ÷ 3 # can also use div()

# ╔═╡ daa92e6c-14a9-4f6d-b27c-a0c3acc71b8b
let
	summed = round(Int, addition + subtraction + multiplication + division + exponentiation + modulus + integer_div)
	sum_text = md"The current sum is **$(round(Int, summed))**"
	if summed == 1000
		md"""#### Quick Quiz
		
		See if you can get the results of the operations above to sum to 1000.
		
		$(Markdown.MD(Markdown.Admonition("correct", "Well done!!", [sum_text])))"""
	else
		md"""#### Quick Quiz
		
		See if you can get the results of the operations above to sum to 1000.
		
		$(Markdown.MD(Markdown.Admonition("danger", "Keep Trying!", [sum_text])))"""
	end
end

# ╔═╡ 023c2eb9-3125-4349-bb34-8b02d12c4894
md"""
# Numbers

There are many ways to express numeric data in Julia.
"""

# ╔═╡ ad2929a3-752c-4139-b13b-db97da7aee25
forty_twos = 42, 42.0, 4.20e1, 4.20f1, 84//2, 0x2a

# ╔═╡ 8a35a9d2-4486-4e9e-8c9d-f1a3d50e3dbc
typeof(forty_twos)

# ╔═╡ 77f3bc77-3071-47c2-bc55-106ba1e544da
md"""
# Text

There are two common ways to represent text in Julia. Strings and characters.
"""

# ╔═╡ 5b1d25f3-c3c4-4f6f-8f95-1346502dc5f0
s1 = "hello world"

# ╔═╡ 028698d3-3402-43b9-9aae-9f5f19dba623
s2 = """hello world"""

# ╔═╡ f869855c-680d-4573-9a0e-4f11a9cf0d9a
s3 = "We'll get an "error" here, because our quotation marks are ambiguous"

# ╔═╡ 6300060a-78ed-45ba-ad20-4a09fba03ba7
s4 = """No "error" here though!"""

# ╔═╡ 6a024b42-2dd2-4adb-94bb-d8d526c137eb
print("""Triple-quoted string literals
		also ignore leading identation, which
		makes it easy to print out long pieces
		of important text""")

# ╔═╡ 78605c79-0ed0-4b4d-9f6a-ef73d9334546
md"""
You might be wondering why we didn't just use single-quotes to take away the ambiguity in `s3` above.
"""

# ╔═╡ 073cc50d-eb4f-4fd8-b01f-eaeeaf4ab13b
c1 = 's'

# ╔═╡ 1ff61dc1-c091-488e-905a-ac2e09be5803
c2 = 'Single quotes means single character, so this will fail'

# ╔═╡ 4422a84a-c814-46b6-8fbb-b0ea3aaccbc3
md"""
# Exercise Break

Use the `convert()` function to change `days` to a 64-bit Float, assigning it to `days_float`.

Then use the type constructor itself (e.g. `Int64`) to convert `days` to the smallest possible integer type.
"""

# ╔═╡ e9810f53-c58b-421a-962a-c5e6275da04e
days = 252

# ╔═╡ d1ddc739-7f88-4295-bc56-d40174eb650e


# ╔═╡ 0072b42a-a17c-4035-a284-684b48d51483


# ╔═╡ 0e03b7cc-4a34-44d6-b567-bffd6dd3b879
md"""
Try to convert the string of numbers below to an integer using `convert()`. 

!!! hint
	Looks like you might need a different approach. What about the parse function?
"""

# ╔═╡ 2b0ed67b-27f3-4ce1-9da8-9f490098262d
nums = "1234"

# ╔═╡ 8ef119c8-a812-45b1-b552-9a0509f2b15e


# ╔═╡ 5bea5fea-c12f-45ea-9b13-02d8f9ce8810
md"""
# String Interpolation

Sometimes we'll want to include variables in text.
"""

# ╔═╡ 49148636-6115-42ea-b7ae-231ae1ef5845
name = "Jay"

# ╔═╡ c6e6dd96-a743-4bf3-a36d-e5ea95a2b874
num_fingers = 10

# ╔═╡ ad71af4f-af8b-43ac-b0f7-dff9a79b6667
num_toes = 10

# ╔═╡ b8a37d04-62c8-4144-a389-29e0458e7c1b
print("""Hello my name is $name.
	I have $num_fingers fingers and $num_toes toes.
	That's $(num_fingers + num_toes) digits in all!""")

# ╔═╡ 9b500b3c-9a7b-48e0-af69-65807fe9e77c
md"""
# Compound Expressions

Typing out the above might have us frustrated with the *one expression per cell* rule in Pluto. The variables `name`, `num_fingers` and `num_toes` are all logically related, so it makes sense to define them all at once.

Thankfully, the Julia language has some features that can help us out.

## Begin Blocks

So called `begin` blocks can include any number of subexpressions, and are allowed in Pluto cells. Typically, as with other blocks in Julia, we indent the body of the block, and must close the block with an `end` statement.
"""

# ╔═╡ 5b624e7d-e420-4aad-bf7e-0817b73c0e01
begin
	empty_seats = 15
	filled_seats = 8
	total_seats = empty_seats + filled_seats
end

# ╔═╡ d96242c0-f9af-4c80-b6d4-395915d7c4e4
md"""
`begin` blocks have a short hand form known as `(;)`, for short compound expressions. It looks like so:
"""

# ╔═╡ c4517e92-b388-4f85-800a-e06bd1aae363
(empty = 15; filled = 8; total = empty + filled)

# ╔═╡ 0b19ea0a-09c2-4d7d-b207-7b8d1504896e
md"""
What is most interesting about compound expressions is that they evaluate to a single value - the final sub expression in the block. This means we can assign a compound expression to a variable!
"""

# ╔═╡ 7bfeee9c-7f4c-4e11-8d20-bd48e86e955e
total_price = begin
	item_exvat = 19.90
	vat = 0.20
	vat_owing = item_exvat * vat
	total_item_price = item_exvat + vat_owing
end	

# ╔═╡ ef5dd965-e329-4fc6-b09a-a2dee7456954
md"""
Variables both inside and outside the compound expression are available for use globally.
"""

# ╔═╡ 66d76b16-01e1-4e46-b56f-4bd6b4329774
print("We have $total_seats seats in total, and the total cost is £$total_price.")

# ╔═╡ 68c9209e-3cde-40dd-a3d4-dba8c649c2a5
md"""
## Let Blocks

For this kind of *show-your-work* programming, where the variables inside the compound expression are not needed again outside of the initial calculation, another type of block exists - the `let` block.

Any variables defined inside a `let` block will be local to that block, and will not exist globally in the Notebook. We can refer to variables defined elsewhere in the Notebook. If we want - we can even *re-use* existing variables by re-assigning them next to the `let` keyword.
"""

# ╔═╡ 48957cfd-9feb-4d6b-b21b-8cfe53dad98c
another_total = let	item_exvat = 25.20 # re-using this variable name
	duty = 0.10
	extra_owing = item_exvat * vat + item_exvat * duty # using vat defined above
	total_cost = item_exvat + extra_owing
end

# ╔═╡ 49f842a5-e609-4285-85b3-6955d9c28c3b
print("Notice that our item price hasn't changed: $item_exvat")

# ╔═╡ 09eca0ae-d542-4f2e-968a-d0c2778ad244
print("And that $duty isn't in this scope!")

# ╔═╡ cb7aee24-e37e-4341-ae7f-0435456b8d4b
md"""
# Exercise Break

The following pancake recipe serves six people
* Flour: 150g
* Sugar: 50g
* Baking Powder: 5g
* Milk: 240ml
* Egg Whites: 60ml
* Melted Butter: 30ml

Scale the recipe for four people and calculate the total amount of dry and wet ingredients into variables named `dry_ingred` and `wet_ingred`, respectively. Show your work ingredient by ingredient, and ensure that only these two named variables are created in the global Notebook scope.
"""

# ╔═╡ 4cd71906-1c8c-4ae1-ae18-e18fdaa1f5ab
## YOUR CODE GOES HERE

# ╔═╡ 410611f5-8d46-4272-9a5b-4daf3705afeb
# ╠═╡ disabled = true
#=╠═╡
my_pi = 3.14159
  ╠═╡ =#

# ╔═╡ 3cefca52-2075-48b7-9835-4fc9f79e332d
my_pi = "3.14"

# ╔═╡ Cell order:
# ╟─e22c1412-cf4c-11ee-1b2b-f98109dfd08f
# ╟─1c199569-414f-467f-b68a-006c6c10eadc
# ╠═fc8b2f88-77a6-4a84-91a1-3efbd0e92317
# ╟─c964fe22-b644-460c-8960-ec66abeb36ff
# ╠═013179fa-3e31-4527-92d0-5c725e56b619
# ╠═78ea3d9b-9273-4aa4-b5b7-5eb8154ea5ab
# ╟─e452dcb5-b3da-4388-8f7f-1dd02ec48e8c
# ╠═03b72a74-3428-40b7-94ac-fefe8d613aae
# ╠═71473247-35ee-4bed-95a6-e34162c9fcf2
# ╠═410611f5-8d46-4272-9a5b-4daf3705afeb
# ╠═8165649a-746b-48d3-a86e-8b100c4b2c08
# ╠═37f732d0-d24f-4e91-8c73-4b7ecfe0c6fe
# ╠═cb15ebd0-5580-4b98-b116-df3d58833eca
# ╠═791aa777-d195-434f-ab57-599f4d771d4f
# ╠═5f3bf493-96e4-47c4-a788-8d932f286886
# ╠═0ce1ec85-18ff-44bb-a073-1ee07744f9eb
# ╟─076f5d7a-9c0e-4ff3-a0af-24b49477f364
# ╠═3cefca52-2075-48b7-9835-4fc9f79e332d
# ╟─a86206f9-4924-4546-8f70-4e70d6b63203
# ╠═6fc44c18-1b85-45a0-8ec9-52e1b38d256f
# ╟─ae162d4b-d83f-4dd1-a6fc-742cd8e144be
# ╠═b0c59c61-2f7d-47bd-9082-bcdd44fe6140
# ╠═da18109b-dc2b-4c13-9c4b-65909928f4e1
# ╟─cf422c68-f253-46ba-ba11-08b204e4038d
# ╟─3d345507-5512-4a56-89ce-6bbd424744ed
# ╠═62331f66-fca5-49de-8d17-88b2180fb639
# ╠═baa6e805-727d-4846-aaae-59b21ce9637e
# ╠═45dfff43-8eb6-483a-8af4-5e4429c78875
# ╠═c9564bee-6a08-4278-9317-1eb2787a7545
# ╠═6c4b845a-b4a0-4904-abbf-8f2bd44a5638
# ╠═c1781e49-49fb-4c18-867d-4e927f560563
# ╠═c9e299e5-9a35-4f41-957c-1c4e5e716ad9
# ╟─daa92e6c-14a9-4f6d-b27c-a0c3acc71b8b
# ╟─023c2eb9-3125-4349-bb34-8b02d12c4894
# ╠═ad2929a3-752c-4139-b13b-db97da7aee25
# ╠═8a35a9d2-4486-4e9e-8c9d-f1a3d50e3dbc
# ╟─77f3bc77-3071-47c2-bc55-106ba1e544da
# ╠═5b1d25f3-c3c4-4f6f-8f95-1346502dc5f0
# ╠═028698d3-3402-43b9-9aae-9f5f19dba623
# ╠═f869855c-680d-4573-9a0e-4f11a9cf0d9a
# ╠═6300060a-78ed-45ba-ad20-4a09fba03ba7
# ╠═6a024b42-2dd2-4adb-94bb-d8d526c137eb
# ╟─78605c79-0ed0-4b4d-9f6a-ef73d9334546
# ╠═073cc50d-eb4f-4fd8-b01f-eaeeaf4ab13b
# ╠═1ff61dc1-c091-488e-905a-ac2e09be5803
# ╟─4422a84a-c814-46b6-8fbb-b0ea3aaccbc3
# ╠═e9810f53-c58b-421a-962a-c5e6275da04e
# ╠═d1ddc739-7f88-4295-bc56-d40174eb650e
# ╠═0072b42a-a17c-4035-a284-684b48d51483
# ╟─0e03b7cc-4a34-44d6-b567-bffd6dd3b879
# ╠═2b0ed67b-27f3-4ce1-9da8-9f490098262d
# ╠═8ef119c8-a812-45b1-b552-9a0509f2b15e
# ╟─5bea5fea-c12f-45ea-9b13-02d8f9ce8810
# ╠═49148636-6115-42ea-b7ae-231ae1ef5845
# ╠═c6e6dd96-a743-4bf3-a36d-e5ea95a2b874
# ╠═ad71af4f-af8b-43ac-b0f7-dff9a79b6667
# ╠═b8a37d04-62c8-4144-a389-29e0458e7c1b
# ╟─9b500b3c-9a7b-48e0-af69-65807fe9e77c
# ╠═5b624e7d-e420-4aad-bf7e-0817b73c0e01
# ╟─d96242c0-f9af-4c80-b6d4-395915d7c4e4
# ╠═c4517e92-b388-4f85-800a-e06bd1aae363
# ╟─0b19ea0a-09c2-4d7d-b207-7b8d1504896e
# ╠═7bfeee9c-7f4c-4e11-8d20-bd48e86e955e
# ╟─ef5dd965-e329-4fc6-b09a-a2dee7456954
# ╠═66d76b16-01e1-4e46-b56f-4bd6b4329774
# ╟─68c9209e-3cde-40dd-a3d4-dba8c649c2a5
# ╠═48957cfd-9feb-4d6b-b21b-8cfe53dad98c
# ╠═49f842a5-e609-4285-85b3-6955d9c28c3b
# ╠═09eca0ae-d542-4f2e-968a-d0c2778ad244
# ╟─cb7aee24-e37e-4341-ae7f-0435456b8d4b
# ╠═4cd71906-1c8c-4ae1-ae18-e18fdaa1f5ab
