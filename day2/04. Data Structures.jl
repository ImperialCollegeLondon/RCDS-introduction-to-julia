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

# ╔═╡ 9ea71f1c-9ce3-41a8-ad3d-35b57a800438
using PlutoUI

# ╔═╡ 02950a3c-bc01-49f5-86f3-873a024e00d9
md"""
# Data structures

Once we start working with many pieces of data at once, it will be convenient for us to store data in structures like arrays or dictionaries (rather than just relying on variables).

Types of data structures covered:
1. Tuples
2. Dictionaries
3. Arrays


As an overview, tuples and arrays are both ordered sequences of elements (so we can index into them). 

Dictionaries and arrays are both **mutable**, whereas tuples are **immutable**

We'll explain this more below!
"""

# ╔═╡ 1b124ebf-29da-432e-a023-b8194097cb95
md"""
## Tuples

We can create a tuple by enclosing an ordered collection of elements in `( )`.

Syntax:
```julia
(item1, item2, ...)
```

"""

# ╔═╡ f2411031-e042-495c-b2fd-e6b3499e1464


# ╔═╡ 9df3caa6-fe69-43f5-8b4f-28aea7cce305


# ╔═╡ 562980df-0eb4-463f-b3e0-7a2df2002560
md"""
We can index into a tuple
"""

# ╔═╡ 8cfed49d-c553-4b63-b1a6-530feee76c32


# ╔═╡ 1c0cf3b2-4968-4456-9c70-ea6b041b627e
md"""
But since they are immutable, we can't update them.
"""

# ╔═╡ 544c53c1-f14c-40ca-bba5-34fc7dcde3d3


# ╔═╡ 650bac1d-afeb-445e-a99c-74531ced9509


# ╔═╡ f915a8a7-4b34-449d-9eac-bdfb30d752ab
md"""
At this point, you've realised that Julia is 1-based indexing.

(Although, there is [flexibility](https://docs.julialang.org/en/v1/devdocs/offset-arrays/) in that)
"""

# ╔═╡ bda03a81-d34b-4725-9cdc-4ae2a375da7f
md"""
### NamedTuples

As you might guess, a `NamedTuple` is just like a `Tuple` except that each element additionally has a name! They have a special syntax using `=` inside a tuple:

```julia
(name1 = item1, name2 = item2, ...)
```
"""

# ╔═╡ f09d5c83-8481-4f28-9563-10f8b7c6448b


# ╔═╡ 0461a502-bc97-4e79-9614-a1549ef3dd98
md"""
Like regular `Tuples`, `NamedTuples` are ordered, so we can retrieve their elements via indexing.
"""

# ╔═╡ 89005bd8-4fd4-49f9-94fa-14f6f5a639ec


# ╔═╡ fdb43c68-6b07-42c2-a2e1-7bd0ec3f5801
md"""
But they come with the advantage of being able to access values by their name, using dot notation.
"""

# ╔═╡ 7508e09d-ca7a-4f77-94c3-f2f627106771


# ╔═╡ 4a0f73d5-458b-4764-a12e-35becb935732
md"""
## Dictionaries

If we have sets of data related to one another, we may choose to store that data in a dictionary. We can create a dictionary using the `Dict()` function, which we can initialize as an empty dictionary or one storing key, value pairs.


```julia
Dict(key1 => value1, key2 => value2, ...)
```

A good example is a contacts list, where we associate names with phone numbers.
"""

# ╔═╡ 15654f58-7dd2-45f9-b6c4-d2efe82c81aa
phonebook = Dict()

# ╔═╡ f80fca09-4254-4994-aa12-557aeb75b723
md"""
In this example, each name is a **key** and each number is a **value**. Often called a key-value pair collectively. We can grab Yianni's number (the value) using the associated key.
"""

# ╔═╡ 2ca467e7-89ce-48bb-a92b-ebea1bde9be8


# ╔═╡ bf69d093-d29e-4cfd-a860-df186f09c919
md"""
We can add new entries to a dictionary by assigning a value to a new key.
"""

# ╔═╡ ec9cd9be-94da-405e-82f7-f4ab90e47b7e


# ╔═╡ 0f848cd7-59c1-42df-9983-c021660a6d81
md"""
Have a look at our phone book now.
"""

# ╔═╡ b87db87b-288c-42c0-8492-be1d865f9fc7
phonebook

# ╔═╡ b8caf068-370a-4258-9d20-e21b713b2674
md"""
We can delete Yiannis' number from our contact list - and simultaenously grab his number - by using the `pop!` function.
"""

# ╔═╡ c2e61322-57f1-42c3-a793-6d350bef11b2


# ╔═╡ edae592b-273a-4c2d-94e0-473384ec8a23
phonebook

# ╔═╡ f75c7c4d-2441-40a8-b906-54b7375c70f5
md"""

!!! warning "Mutating Functions"

	By convention, functions that end in a `!` will alter, or **mutate** their inputs. Consider the `!` to be a small warning that your data may change.
"""

# ╔═╡ cd4c9856-b585-44d7-8763-5bfb6e43e038
md"""
Unlike tuples and arrays, dictionaries are not ordered. So, we can't index into them.
"""

# ╔═╡ 576eadb2-4dd2-4875-bc86-182768305222
phonebook[1]

# ╔═╡ 74f7b1ec-1116-43d6-8f55-3c3535d11700
md"""
In the cell above, Julia thinks you're trying to access a value associated with the key `1`.
"""

# ╔═╡ 0c6e94a8-b271-4c08-9bef-a3f82389fb9e
md"""
### Exercise Break

1. Try to add "Emergency" as a key to `phonebook` with the value `911` with the following code
```julia
phonebook["Emergency"] = 911
```

Why doesn't this work?

"""

# ╔═╡ 188b63d5-7e37-450f-883c-a694a9ff7803
## TRY IT OUT HERE

# ╔═╡ 085e3084-639a-417f-ac9a-b79fe7e310b8
md"""
2. Create a new dictionary called `flexible_phonebook` that has:
* Jenny's number (**9671111**) stored as an integer
* The Ghostbusters' number (**1-800-GHOSTS**) stored as a string

What does the `type` of this new dictionary tell you? Compare its type with that of the original phonebook if needed.
"""

# ╔═╡ 3a22833c-3a27-4977-8dca-37d79c0cda01
## YOUR CODE GOES HERE

# ╔═╡ 61056783-ade1-4b71-bee1-956e7e3173f8


# ╔═╡ 5a3eeb35-046a-4097-a4af-c76417972896


# ╔═╡ 2bd8adf0-ccb3-40e5-bbe6-e3671232f62a
md"""
## Arrays

Unlike tuples, arrays are mutable. Unlike dictionaries, arrays contain ordered collections.

We can create an array by enclosing this collection in `[ ]`.

```julia
[item1, item2, ...]
```

For example, we might create an array to keep track of pokemon

"""

# ╔═╡ 54242790-e509-47a4-827d-51b92782a348


# ╔═╡ dafe9fb9-ee8a-4457-ad59-2b448bb2dab3


# ╔═╡ 77cb3556-1260-4d22-b0b4-cfa5ed77182a
md"""
Checking the type, `Vector` is shorthand for a 1D array. The `{String}` following it indicates the elements are of the type `String`. Combined, this is an alias for `Array{String, 1}`.

An array can store a sequence of numbers, or mixed type sequences
"""

# ╔═╡ dba354d9-fa4f-4877-ac57-a656d9941cc6
fibonacci = [1, 1, 2, 3, 5, 8, 13]

# ╔═╡ caaa6917-99e9-4071-8e23-70ab98da8b3d
mixture = [1, 1, 2, 3, "Yiannis", "Jay"]

# ╔═╡ c03b83ad-4329-4236-a42a-8abd09d5cf84
md"""
Once we have an array, we can grab individual pieces of data from inside that array by indexing into the array. For example, if we want the third pokemon listed in `pokemon`, we write
"""

# ╔═╡ b8c7dacd-eed2-42ce-955b-e939841ecb72


# ╔═╡ 705716bb-4081-46a5-a8f6-5f17c8fe2174


# ╔═╡ 78ad482c-9d1e-4a55-ab20-4567f0e13542


# ╔═╡ 0b07b4e6-cc0c-4883-b225-368e8a6d010a
md"""
We can also edit the array by using the `push!` and `pop!` functions. `push!` adds an element to the end of an array and `pop!` removes the last element of an array. (also see `pushfirst!` and `popfirst!`)

Remember the Julia notation `!` means the object changes.

We can add another number to our fibonnaci sequence
"""

# ╔═╡ a7b04b21-b1c7-4d98-a82c-6f01c9dea713


# ╔═╡ f83f093e-8874-470f-a0bb-d9155bbf095c


# ╔═╡ a8bf1c9c-2b60-4e7f-bcf6-1ddf421da49f


# ╔═╡ bb5e28e4-f2c8-4523-ab8d-dde2ea17663d
md"""
So far we've given examples of only 1D arrays of scalars, but arrays can have an arbitrary number of dimensions and can also store other arrays. 

For example, the following are arrays of arrays:
"""

# ╔═╡ 2e4d7abe-42d8-4f79-996d-4a1cecfdaa39
faves = [
	["ice-cream", "chocolate", "eggs"],
	["penguins", "cats", "spiders"]
]

# ╔═╡ 2a717b83-1b83-4574-9518-549b2a963687
nums = [
	[1, 2, 3],
	[4, 5],
	[6, 7, 8, 9],
]

# ╔═╡ c4230a92-144d-438d-82a6-82a55cfbd077
md"""
We index twice to get at a individual value in the above:
"""

# ╔═╡ 4b93ee2e-804b-433c-a1f3-0fa1974cc1b6


# ╔═╡ af90beef-3d90-4aef-93e9-94a261b32318
md"""
Below are examples of 2D and 3D arrays. The functions `rand`, `ones` and `zeros` all create multidimensional arrays populated with certain values. We'll look more closely at these near the end of this notebook.
"""

# ╔═╡ d9d47e30-3af7-4efb-ba76-e1d99ae4fe0e
rand(4, 3)

# ╔═╡ 46689800-66f8-44d7-a934-9f4055efabad
ones(2, 4, 3)

# ╔═╡ 4aa6ea48-d002-46ce-9955-79cb33f0f536
md"""
#### Quick Quiz

Can you find the function to **sort** the vector in `random` below?
"""

# ╔═╡ 1c09ee99-1062-4128-b76d-7cebfe57df4c
@bind go Button("Generate random vector")

# ╔═╡ e7ccec39-2a0e-4264-9764-bf368dc9e97c
random = begin
    go      
    rand(1:100, 10)
end

# ╔═╡ a03727d1-c807-4af5-bead-21d4b51ec62f


# ╔═╡ 606af175-6429-4d1f-88fe-e7419eea430e
let
	sum_text = md"""The list in `random` is **$(issorted(random) ? "" : "not")** sorted:"""
	if issorted(random)
		md"""
		$(Markdown.MD(Markdown.Admonition("correct", "Well done!!", [sum_text, random])))"""
	else
		md"""
		$(Markdown.MD(Markdown.Admonition("danger", "Keep Trying!", [sum_text, random])))"""
	end
end

# ╔═╡ c83fdf90-98ef-4a46-b534-a7078f1c3e58
md"""
### Mutability

Be careful when you want to copy arrays!
"""

# ╔═╡ a65ec926-f255-41ee-a72b-4529bbb52522
fibonacci

# ╔═╡ c417bb33-3feb-438c-b087-38fa44449dc5


# ╔═╡ 73a732a1-907e-41e7-8b8f-cd26364b2c55


# ╔═╡ 004f455d-b11b-421e-bc83-4148e798ad03


# ╔═╡ a0b04992-7e2c-4ca0-975a-c70528a26cb8
md"""
Editing `fib` caused `fibonacci` to get updated as well!

In the above example, we didn't actually make a copy of `fibonacci`. We just created a new way to access the entries in the array bound to `fibonacci`.

If we'd like to make a copy of the array bound to `fibonacci`, we can use the `copy` function.

First, let's restore `fibonacci`, then create and edit the copy.
"""

# ╔═╡ 768909de-9516-4b9a-ba15-f3310c6c1f39
fibonacci[1] = 1

# ╔═╡ c860617c-ea49-40b1-8e8d-32a478bcd987


# ╔═╡ bbfa6fcb-149f-43d4-b3f4-e126e955b909


# ╔═╡ 7ff74fc3-1512-41c8-aa60-4f61b81b77a9


# ╔═╡ 3e765e39-18f9-4f4f-a4b8-eaa1c59bb45b
md"""
In this last example, fibonacci was not updated. We see that the arrays bound to `fib2` and `fibonacci` are distinct.
"""

# ╔═╡ d50d835e-6b5a-40ca-bd05-cd2b2e197216
md"""
### Slicing

Let's get more creative with our indexing and see ways we can access multiple elements in one operation.
"""

# ╔═╡ 7bf9d6cd-ee3c-4c85-bd20-41566d0baa46
squares = [1, 4, 9, 16, 25, 36, 49, 64]

# ╔═╡ d1e43367-96ae-4754-99fb-cd9258bd8b4d


# ╔═╡ ba10f1ba-956a-45bc-a06e-8b8f9ede1acd


# ╔═╡ a43e75a4-8c24-4623-8716-a47e7c2525a9


# ╔═╡ c117cd08-dd9c-46d2-974b-335ea38c6784
md"""
### Concatenation
If, instead of commas, we use spaces, then the values are concatenated horizontally along a different dimension.
"""

# ╔═╡ 849bea4f-33ac-454b-a852-ee9fc4b572c3
cubes = [1, 8, 27, 64, 125, 216, 343, 512]

# ╔═╡ 7d551676-60ed-4db3-b06f-4918ec10cd89


# ╔═╡ 8a0b257f-c5ae-4ca1-bbc7-649458799a13


# ╔═╡ 2b369cc4-9a9e-4e47-8efb-2c83a79c7c35


# ╔═╡ c022607b-67bd-47f0-96bd-419cbf5a5d32
md"""
Spaces can concatenate same-length vectors to form matrices.
"""

# ╔═╡ eb924bd7-4747-42c6-a923-12581fa80871


# ╔═╡ 5bcfe701-f64e-4d5e-a993-f9e4ed8bcf27
md"""
Matrices and multidimensional arrays are indexed in a single operation, with dimensions separated by commas.
"""

# ╔═╡ 92b86675-421a-435c-be62-479e7d58208e


# ╔═╡ a557b211-5607-4e77-92eb-ceb78eeff6c3


# ╔═╡ e5f5ff4f-ffe0-4824-9b03-c2718babf159


# ╔═╡ 80bf7b5e-08f9-47c5-b293-a5c00dbe5cac
md"""
Semicolons perform vertical concatenation:
"""

# ╔═╡ 24e925e4-3ec9-43cb-92a0-00912eedc858


# ╔═╡ 7b5e51e5-130a-41a6-ae61-2621da554a08
md"""
Compared with commas, which would just create an array of arrays:
"""

# ╔═╡ 1dc8a02e-9599-418a-8bf6-4548e904523c


# ╔═╡ c02284a6-82cd-41e1-9000-ba971b8c7891
md"""
Horizontal and vertical concatenation can be used together to as a simple syntax for matrix literals.
"""

# ╔═╡ 74c116ca-a1dd-4053-865b-32d983946e38
[1 2 3 ; 4 5 6 ; 7 8 9]

# ╔═╡ 8251e778-696a-491e-a8e7-f67904b91522
md"""
## Higher order functions

### map

`map` is a "higher-order" function in Julia that *takes a function* as one of its input arguments. 
`map` then applies that function to every element of the data structure you pass it. For example, executing

```julia
map(f, [1, 2, 3])
```
will give you an output array where the function `f` has been applied to all elements of `[1, 2, 3]`
```julia
[f(1), f(2), f(3)]
```
"""

# ╔═╡ df492ecd-89be-4f68-a312-367393cbe1b1
square_it(x) = x ^ 2

# ╔═╡ 05c7af21-6c87-424d-af89-56b9d99987dc


# ╔═╡ 4540f7c6-288e-4f44-9add-11f88de8a802
md"""
Here we've squared all the elements of the vector `[1, 2, 3]`, rather than squaring the vector `[1, 2, 3]`.

We could have instead passed an anonymous function to `map`, and this is a fairly common use case for such functions.
"""

# ╔═╡ 34bbd4d9-d07e-4f4f-9533-e00966ec7135


# ╔═╡ cbcde109-b060-410e-be39-05d678e4f469
md"""
### broadcast

`broadcast` is another higher-order function like `map`. `broadcast` is a generalization of `map`, so it can do every thing `map` can do and more. The syntax for calling `broadcast` is the same as for calling `map`.
"""

# ╔═╡ 7a2af27f-c1fe-49fd-a69a-7552108081f8
broadcast(square_it, [1, 2, 3])

# ╔═╡ 0f1ab62a-4e8e-42e5-b17b-d86b1d71b256
md"""
and again, we've applied `f` (squared) to all the elements of `[1, 2, 3]` - this time by "broadcasting" `f`!

Some syntactic sugar for calling `broadcast` is to place a `.` between the name of the function you want to `broadcast` and its input arguments. For example,

```julia
broadcast(f, [1, 2, 3])
```
is the same as
```julia
f.([1, 2, 3])
```
"""

# ╔═╡ 6339ff76-19c6-461b-bb45-06aac117bd91


# ╔═╡ cdcf5329-cbcd-4690-b94d-ed91ffae6919
md"""
Notice again how different this is from calling 
```julia
square_it([1, 2, 3])
```
We can square every element of a vector, but we can't square a vector!

To drive home the point, let's look at the difference between

```julia
f(A)
```
and
```julia
f.(A)
```
for a matrix `A`:
"""

# ╔═╡ 36f36819-d6e2-4b6c-8ffe-5f20fad92363
A = [i + 3*j for j in 0:2, i in 1:3]

# ╔═╡ 24b49af6-fa80-42a2-a7ce-60ec390911ab


# ╔═╡ 805f2c03-6eac-489a-96c6-274076aeb749
md"""
We see that for a matrix, `A`,
```
square_it(A) = A ^ 2 = A * A
``` 

On the other hand,
"""

# ╔═╡ ef5c4890-2a63-47d1-a23e-f672a695fa18


# ╔═╡ 5343b9a6-8d22-4ee9-bbc8-1c5fc4a3191e
md"""
contains the squares of all the entries of `A`.

This dot syntax for broadcasting allows us to write relatively complex compound elementwise expressions in a way that looks natural/closer to mathematical notation. For example, we can write
"""

# ╔═╡ e78cf67b-0199-4fbd-a0b3-8471f70c0935
A .+ 2 .* square_it.(A) ./ A

# ╔═╡ 667b7172-38a0-43bf-8a21-6f83089e70ef
md"""
instead of...
"""

# ╔═╡ 2903d387-4a2b-4f4a-ab35-cfe51c101464
broadcast(x -> x + 2 * square_it(x) / x, A)

# ╔═╡ ae91f504-a8ad-4122-9367-954a5e5fd5bf
md"""
### Exercise Break

1. Use `map` or `broadcast` to increment every element of matrix `A` by `2` and assign the new matrix to a variable `A1`.
"""

# ╔═╡ f5e3f509-28c6-4ce4-893c-98d9d5a29f24
A1 = [] # TODO use a higher order function

# ╔═╡ ff1eecad-a82e-434a-a1f5-4d6e2c3bcf2e
if A1 == [3 4 5; 6 7 8; 9 10 11]
	md"""
	$(Markdown.MD(Markdown.Admonition("correct", "Well done!!", [])))"""
end

# ╔═╡ d12a4878-879a-446f-ac1c-21881ccb41ab
md"""
2. Use the broadcast dot syntax to add one, then multiply by three for each element of matrix `A1`; store the new matrix in variable `A2`
"""

# ╔═╡ 0396b6a4-5eb6-4720-98a6-3fad66f64bad
A2 = [] # TODO use dot broadcast

# ╔═╡ 2f6d22e7-ec13-4062-8c65-ba42655df4ae
if A2 == [12 15 18; 21 24 27; 30 33 36]
	md"""
	$(Markdown.MD(Markdown.Admonition("correct", "Well done!!", [])))"""
end

# ╔═╡ 91a5c1eb-999d-4182-9ee0-36c2dab50549
md"""
# Appendix
"""

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
PlutoUI = "7f904dfe-b85e-4ff6-b463-dae2292396a8"

[compat]
PlutoUI = "~0.7.59"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.10.1"
manifest_format = "2.0"
project_hash = "6e7bcec4be6e95d1f85627422d78f10c0391f199"

[[deps.AbstractPlutoDingetjes]]
deps = ["Pkg"]
git-tree-sha1 = "6e1d2a35f2f90a4bc7c2ed98079b2ba09c35b83a"
uuid = "6e696c72-6542-2067-7265-42206c756150"
version = "1.3.2"

[[deps.ArgTools]]
uuid = "0dad84c5-d112-42e6-8d28-ef12dabb789f"
version = "1.1.1"

[[deps.Artifacts]]
uuid = "56f22d72-fd6d-98f1-02f0-08ddc0907c33"

[[deps.Base64]]
uuid = "2a0f44e3-6c83-55bd-87e4-b1978d98bd5f"

[[deps.ColorTypes]]
deps = ["FixedPointNumbers", "Random"]
git-tree-sha1 = "b10d0b65641d57b8b4d5e234446582de5047050d"
uuid = "3da002f7-5984-5a60-b8a6-cbb66c0b333f"
version = "0.11.5"

[[deps.CompilerSupportLibraries_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "e66e0078-7015-5450-92f7-15fbd957f2ae"
version = "1.1.0+0"

[[deps.Dates]]
deps = ["Printf"]
uuid = "ade2ca70-3891-5945-98fb-dc099432e06a"

[[deps.Downloads]]
deps = ["ArgTools", "FileWatching", "LibCURL", "NetworkOptions"]
uuid = "f43a241f-c20a-4ad4-852c-f6b1247861c6"
version = "1.6.0"

[[deps.FileWatching]]
uuid = "7b1f6079-737a-58dc-b8bc-7a2ca5c1b5ee"

[[deps.FixedPointNumbers]]
deps = ["Statistics"]
git-tree-sha1 = "05882d6995ae5c12bb5f36dd2ed3f61c98cbb172"
uuid = "53c48c17-4a7d-5ca2-90c5-79b7896eea93"
version = "0.8.5"

[[deps.Hyperscript]]
deps = ["Test"]
git-tree-sha1 = "179267cfa5e712760cd43dcae385d7ea90cc25a4"
uuid = "47d2ed2b-36de-50cf-bf87-49c2cf4b8b91"
version = "0.0.5"

[[deps.HypertextLiteral]]
deps = ["Tricks"]
git-tree-sha1 = "7134810b1afce04bbc1045ca1985fbe81ce17653"
uuid = "ac1192a8-f4b3-4bfe-ba22-af5b92cd3ab2"
version = "0.9.5"

[[deps.IOCapture]]
deps = ["Logging", "Random"]
git-tree-sha1 = "8b72179abc660bfab5e28472e019392b97d0985c"
uuid = "b5f81e59-6552-4d32-b1f0-c071b021bf89"
version = "0.2.4"

[[deps.InteractiveUtils]]
deps = ["Markdown"]
uuid = "b77e0a4c-d291-57a0-90e8-8db25a27a240"

[[deps.JSON]]
deps = ["Dates", "Mmap", "Parsers", "Unicode"]
git-tree-sha1 = "31e996f0a15c7b280ba9f76636b3ff9e2ae58c9a"
uuid = "682c06a0-de6a-54ab-a142-c8b1cf79cde6"
version = "0.21.4"

[[deps.LibCURL]]
deps = ["LibCURL_jll", "MozillaCACerts_jll"]
uuid = "b27032c2-a3e7-50c8-80cd-2d36dbcbfd21"
version = "0.6.4"

[[deps.LibCURL_jll]]
deps = ["Artifacts", "LibSSH2_jll", "Libdl", "MbedTLS_jll", "Zlib_jll", "nghttp2_jll"]
uuid = "deac9b47-8bc7-5906-a0fe-35ac56dc84c0"
version = "8.4.0+0"

[[deps.LibGit2]]
deps = ["Base64", "LibGit2_jll", "NetworkOptions", "Printf", "SHA"]
uuid = "76f85450-5226-5b5a-8eaa-529ad045b433"

[[deps.LibGit2_jll]]
deps = ["Artifacts", "LibSSH2_jll", "Libdl", "MbedTLS_jll"]
uuid = "e37daf67-58a4-590a-8e99-b0245dd2ffc5"
version = "1.6.4+0"

[[deps.LibSSH2_jll]]
deps = ["Artifacts", "Libdl", "MbedTLS_jll"]
uuid = "29816b5a-b9ab-546f-933c-edad1886dfa8"
version = "1.11.0+1"

[[deps.Libdl]]
uuid = "8f399da3-3557-5675-b5ff-fb832c97cbdb"

[[deps.LinearAlgebra]]
deps = ["Libdl", "OpenBLAS_jll", "libblastrampoline_jll"]
uuid = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"

[[deps.Logging]]
uuid = "56ddb016-857b-54e1-b83d-db4d58db5568"

[[deps.MIMEs]]
git-tree-sha1 = "65f28ad4b594aebe22157d6fac869786a255b7eb"
uuid = "6c6e2e6c-3030-632d-7369-2d6c69616d65"
version = "0.1.4"

[[deps.Markdown]]
deps = ["Base64"]
uuid = "d6f4376e-aef5-505a-96c1-9c027394607a"

[[deps.MbedTLS_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "c8ffd9c3-330d-5841-b78e-0817d7145fa1"
version = "2.28.2+1"

[[deps.Mmap]]
uuid = "a63ad114-7e13-5084-954f-fe012c677804"

[[deps.MozillaCACerts_jll]]
uuid = "14a3606d-f60d-562e-9121-12d972cd8159"
version = "2023.1.10"

[[deps.NetworkOptions]]
uuid = "ca575930-c2e3-43a9-ace4-1e988b2c1908"
version = "1.2.0"

[[deps.OpenBLAS_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "Libdl"]
uuid = "4536629a-c528-5b80-bd46-f80d51c5b363"
version = "0.3.23+4"

[[deps.Parsers]]
deps = ["Dates", "PrecompileTools", "UUIDs"]
git-tree-sha1 = "8489905bcdbcfac64d1daa51ca07c0d8f0283821"
uuid = "69de0a69-1ddd-5017-9359-2bf0b02dc9f0"
version = "2.8.1"

[[deps.Pkg]]
deps = ["Artifacts", "Dates", "Downloads", "FileWatching", "LibGit2", "Libdl", "Logging", "Markdown", "Printf", "REPL", "Random", "SHA", "Serialization", "TOML", "Tar", "UUIDs", "p7zip_jll"]
uuid = "44cfe95a-1eb2-52ea-b672-e2afdf69b78f"
version = "1.10.0"

[[deps.PlutoUI]]
deps = ["AbstractPlutoDingetjes", "Base64", "ColorTypes", "Dates", "FixedPointNumbers", "Hyperscript", "HypertextLiteral", "IOCapture", "InteractiveUtils", "JSON", "Logging", "MIMEs", "Markdown", "Random", "Reexport", "URIs", "UUIDs"]
git-tree-sha1 = "ab55ee1510ad2af0ff674dbcced5e94921f867a9"
uuid = "7f904dfe-b85e-4ff6-b463-dae2292396a8"
version = "0.7.59"

[[deps.PrecompileTools]]
deps = ["Preferences"]
git-tree-sha1 = "5aa36f7049a63a1528fe8f7c3f2113413ffd4e1f"
uuid = "aea7be01-6a6a-4083-8856-8a6e6704d82a"
version = "1.2.1"

[[deps.Preferences]]
deps = ["TOML"]
git-tree-sha1 = "9306f6085165d270f7e3db02af26a400d580f5c6"
uuid = "21216c6a-2e73-6563-6e65-726566657250"
version = "1.4.3"

[[deps.Printf]]
deps = ["Unicode"]
uuid = "de0858da-6303-5e67-8744-51eddeeeb8d7"

[[deps.REPL]]
deps = ["InteractiveUtils", "Markdown", "Sockets", "Unicode"]
uuid = "3fa0cd96-eef1-5676-8a61-b3b8758bbffb"

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

[[deps.Sockets]]
uuid = "6462fe0b-24de-5631-8697-dd941f90decc"

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

[[deps.TOML]]
deps = ["Dates"]
uuid = "fa267f1f-6049-4f14-aa54-33bafae1ed76"
version = "1.0.3"

[[deps.Tar]]
deps = ["ArgTools", "SHA"]
uuid = "a4e569a6-e804-4fa4-b0f3-eef7a1d5b13e"
version = "1.10.0"

[[deps.Test]]
deps = ["InteractiveUtils", "Logging", "Random", "Serialization"]
uuid = "8dfed614-e22c-5e08-85e1-65c5234f0b40"

[[deps.Tricks]]
git-tree-sha1 = "eae1bb484cd63b36999ee58be2de6c178105112f"
uuid = "410a4b4d-49e4-4fbc-ab6d-cb71b17b3775"
version = "0.1.8"

[[deps.URIs]]
git-tree-sha1 = "67db6cc7b3821e19ebe75791a9dd19c9b1188f2b"
uuid = "5c2747f8-b7ea-4ff2-ba2e-563bfd36b1d4"
version = "1.5.1"

[[deps.UUIDs]]
deps = ["Random", "SHA"]
uuid = "cf7118a7-6976-5b1a-9a39-7adc72f591a4"

[[deps.Unicode]]
uuid = "4ec0a83e-493e-50e2-b9ac-8f72acf5a8f5"

[[deps.Zlib_jll]]
deps = ["Libdl"]
uuid = "83775a58-1f1d-513f-b197-d71354ab007a"
version = "1.2.13+1"

[[deps.libblastrampoline_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "8e850b90-86db-534c-a0d3-1478176c7d93"
version = "5.8.0+1"

[[deps.nghttp2_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "8e850ede-7688-5339-a07c-302acd2aaf8d"
version = "1.52.0+1"

[[deps.p7zip_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "3f19e933-33d8-53b3-aaab-bd5110c3b7a0"
version = "17.4.0+2"
"""

# ╔═╡ Cell order:
# ╟─02950a3c-bc01-49f5-86f3-873a024e00d9
# ╟─1b124ebf-29da-432e-a023-b8194097cb95
# ╠═f2411031-e042-495c-b2fd-e6b3499e1464
# ╠═9df3caa6-fe69-43f5-8b4f-28aea7cce305
# ╟─562980df-0eb4-463f-b3e0-7a2df2002560
# ╠═8cfed49d-c553-4b63-b1a6-530feee76c32
# ╟─1c0cf3b2-4968-4456-9c70-ea6b041b627e
# ╠═544c53c1-f14c-40ca-bba5-34fc7dcde3d3
# ╠═650bac1d-afeb-445e-a99c-74531ced9509
# ╟─f915a8a7-4b34-449d-9eac-bdfb30d752ab
# ╟─bda03a81-d34b-4725-9cdc-4ae2a375da7f
# ╠═f09d5c83-8481-4f28-9563-10f8b7c6448b
# ╟─0461a502-bc97-4e79-9614-a1549ef3dd98
# ╠═89005bd8-4fd4-49f9-94fa-14f6f5a639ec
# ╟─fdb43c68-6b07-42c2-a2e1-7bd0ec3f5801
# ╠═7508e09d-ca7a-4f77-94c3-f2f627106771
# ╟─4a0f73d5-458b-4764-a12e-35becb935732
# ╠═15654f58-7dd2-45f9-b6c4-d2efe82c81aa
# ╟─f80fca09-4254-4994-aa12-557aeb75b723
# ╠═2ca467e7-89ce-48bb-a92b-ebea1bde9be8
# ╟─bf69d093-d29e-4cfd-a860-df186f09c919
# ╠═ec9cd9be-94da-405e-82f7-f4ab90e47b7e
# ╟─0f848cd7-59c1-42df-9983-c021660a6d81
# ╟─b87db87b-288c-42c0-8492-be1d865f9fc7
# ╟─b8caf068-370a-4258-9d20-e21b713b2674
# ╠═c2e61322-57f1-42c3-a793-6d350bef11b2
# ╟─edae592b-273a-4c2d-94e0-473384ec8a23
# ╟─f75c7c4d-2441-40a8-b906-54b7375c70f5
# ╟─cd4c9856-b585-44d7-8763-5bfb6e43e038
# ╠═576eadb2-4dd2-4875-bc86-182768305222
# ╟─74f7b1ec-1116-43d6-8f55-3c3535d11700
# ╟─0c6e94a8-b271-4c08-9bef-a3f82389fb9e
# ╠═188b63d5-7e37-450f-883c-a694a9ff7803
# ╟─085e3084-639a-417f-ac9a-b79fe7e310b8
# ╠═3a22833c-3a27-4977-8dca-37d79c0cda01
# ╠═61056783-ade1-4b71-bee1-956e7e3173f8
# ╠═5a3eeb35-046a-4097-a4af-c76417972896
# ╟─2bd8adf0-ccb3-40e5-bbe6-e3671232f62a
# ╠═54242790-e509-47a4-827d-51b92782a348
# ╠═dafe9fb9-ee8a-4457-ad59-2b448bb2dab3
# ╟─77cb3556-1260-4d22-b0b4-cfa5ed77182a
# ╠═dba354d9-fa4f-4877-ac57-a656d9941cc6
# ╠═caaa6917-99e9-4071-8e23-70ab98da8b3d
# ╟─c03b83ad-4329-4236-a42a-8abd09d5cf84
# ╠═b8c7dacd-eed2-42ce-955b-e939841ecb72
# ╠═705716bb-4081-46a5-a8f6-5f17c8fe2174
# ╠═78ad482c-9d1e-4a55-ab20-4567f0e13542
# ╟─0b07b4e6-cc0c-4883-b225-368e8a6d010a
# ╠═a7b04b21-b1c7-4d98-a82c-6f01c9dea713
# ╠═f83f093e-8874-470f-a0bb-d9155bbf095c
# ╠═a8bf1c9c-2b60-4e7f-bcf6-1ddf421da49f
# ╟─bb5e28e4-f2c8-4523-ab8d-dde2ea17663d
# ╠═2e4d7abe-42d8-4f79-996d-4a1cecfdaa39
# ╠═2a717b83-1b83-4574-9518-549b2a963687
# ╟─c4230a92-144d-438d-82a6-82a55cfbd077
# ╠═4b93ee2e-804b-433c-a1f3-0fa1974cc1b6
# ╟─af90beef-3d90-4aef-93e9-94a261b32318
# ╠═d9d47e30-3af7-4efb-ba76-e1d99ae4fe0e
# ╠═46689800-66f8-44d7-a934-9f4055efabad
# ╟─4aa6ea48-d002-46ce-9955-79cb33f0f536
# ╟─1c09ee99-1062-4128-b76d-7cebfe57df4c
# ╟─e7ccec39-2a0e-4264-9764-bf368dc9e97c
# ╠═a03727d1-c807-4af5-bead-21d4b51ec62f
# ╟─606af175-6429-4d1f-88fe-e7419eea430e
# ╟─c83fdf90-98ef-4a46-b534-a7078f1c3e58
# ╠═a65ec926-f255-41ee-a72b-4529bbb52522
# ╠═c417bb33-3feb-438c-b087-38fa44449dc5
# ╠═73a732a1-907e-41e7-8b8f-cd26364b2c55
# ╠═004f455d-b11b-421e-bc83-4148e798ad03
# ╟─a0b04992-7e2c-4ca0-975a-c70528a26cb8
# ╠═768909de-9516-4b9a-ba15-f3310c6c1f39
# ╠═c860617c-ea49-40b1-8e8d-32a478bcd987
# ╠═bbfa6fcb-149f-43d4-b3f4-e126e955b909
# ╠═7ff74fc3-1512-41c8-aa60-4f61b81b77a9
# ╟─3e765e39-18f9-4f4f-a4b8-eaa1c59bb45b
# ╟─d50d835e-6b5a-40ca-bd05-cd2b2e197216
# ╠═7bf9d6cd-ee3c-4c85-bd20-41566d0baa46
# ╠═d1e43367-96ae-4754-99fb-cd9258bd8b4d
# ╠═ba10f1ba-956a-45bc-a06e-8b8f9ede1acd
# ╠═a43e75a4-8c24-4623-8716-a47e7c2525a9
# ╟─c117cd08-dd9c-46d2-974b-335ea38c6784
# ╠═849bea4f-33ac-454b-a852-ee9fc4b572c3
# ╠═7d551676-60ed-4db3-b06f-4918ec10cd89
# ╠═8a0b257f-c5ae-4ca1-bbc7-649458799a13
# ╠═2b369cc4-9a9e-4e47-8efb-2c83a79c7c35
# ╟─c022607b-67bd-47f0-96bd-419cbf5a5d32
# ╠═eb924bd7-4747-42c6-a923-12581fa80871
# ╟─5bcfe701-f64e-4d5e-a993-f9e4ed8bcf27
# ╠═92b86675-421a-435c-be62-479e7d58208e
# ╠═a557b211-5607-4e77-92eb-ceb78eeff6c3
# ╠═e5f5ff4f-ffe0-4824-9b03-c2718babf159
# ╟─80bf7b5e-08f9-47c5-b293-a5c00dbe5cac
# ╠═24e925e4-3ec9-43cb-92a0-00912eedc858
# ╟─7b5e51e5-130a-41a6-ae61-2621da554a08
# ╠═1dc8a02e-9599-418a-8bf6-4548e904523c
# ╟─c02284a6-82cd-41e1-9000-ba971b8c7891
# ╠═74c116ca-a1dd-4053-865b-32d983946e38
# ╟─8251e778-696a-491e-a8e7-f67904b91522
# ╠═df492ecd-89be-4f68-a312-367393cbe1b1
# ╠═05c7af21-6c87-424d-af89-56b9d99987dc
# ╟─4540f7c6-288e-4f44-9add-11f88de8a802
# ╠═34bbd4d9-d07e-4f4f-9533-e00966ec7135
# ╟─cbcde109-b060-410e-be39-05d678e4f469
# ╠═7a2af27f-c1fe-49fd-a69a-7552108081f8
# ╟─0f1ab62a-4e8e-42e5-b17b-d86b1d71b256
# ╠═6339ff76-19c6-461b-bb45-06aac117bd91
# ╟─cdcf5329-cbcd-4690-b94d-ed91ffae6919
# ╟─36f36819-d6e2-4b6c-8ffe-5f20fad92363
# ╠═24b49af6-fa80-42a2-a7ce-60ec390911ab
# ╟─805f2c03-6eac-489a-96c6-274076aeb749
# ╠═ef5c4890-2a63-47d1-a23e-f672a695fa18
# ╟─5343b9a6-8d22-4ee9-bbc8-1c5fc4a3191e
# ╠═e78cf67b-0199-4fbd-a0b3-8471f70c0935
# ╟─667b7172-38a0-43bf-8a21-6f83089e70ef
# ╠═2903d387-4a2b-4f4a-ab35-cfe51c101464
# ╟─ae91f504-a8ad-4122-9367-954a5e5fd5bf
# ╠═f5e3f509-28c6-4ce4-893c-98d9d5a29f24
# ╟─ff1eecad-a82e-434a-a1f5-4d6e2c3bcf2e
# ╟─d12a4878-879a-446f-ac1c-21881ccb41ab
# ╠═0396b6a4-5eb6-4720-98a6-3fad66f64bad
# ╟─2f6d22e7-ec13-4062-8c65-ba42655df4ae
# ╟─91a5c1eb-999d-4182-9ee0-36c2dab50549
# ╟─9ea71f1c-9ce3-41a8-ad3d-35b57a800438
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
