### A Pluto.jl notebook ###
# v0.19.38

using Markdown
using InteractiveUtils

# ╔═╡ aba7b876-280f-11ef-0c86-859ea66dd5d0
md"""
# Julia's Type System

https://docs.julialang.org/en/v1/manual/types/


Two different type systems in programming languages. Static type systems, where every program expression must have a type computable before the execution of the program, and dynamic type systems, where nothing is known about types until run time, when the actual values manipulated by the program are available.

The ability to write code that can operate on different types is called polymorphism.

Julia's type system is dynamic, but gains some of the advantages of static type systems by making it possible to indicate that certain values are of specific types. This can be of great assistance in generating efficient code, but even more significantly, it allows method dispatch on the types of function arguments to be deeply integrated with the language. Method dispatch is explored in detail in the Multiple Dispatch notebooks, but is rooted in the type system presented here.


"""

# ╔═╡ f4238f86-c102-4c3a-ad8e-064e6a022e79
md"""
## Type Declarations

The :: operator can be used to attach type annotations to expressions and variables in programs. There are two primary reasons to do this:

    1. As an assertion to help confirm that your program works the way you expect,
    2. To provide extra type information to the compiler, which can then improve performance in some cases
"""

# ╔═╡ 3564b2ef-aae2-472d-9a0a-330ecb64c4de


# ╔═╡ 3be0f096-3b68-47a2-9a03-77e85d7d055b


# ╔═╡ c132827d-c21d-46d4-9716-e9e91b096366


# ╔═╡ 07797d51-f73e-49d2-be78-9c4bb1be6f29
md"""
## Composite Types

Composite types are a special type that can store multiple independent pieces of information within them. They are introduced with the `struct` keyword followed by a block of field names, optionally annotated with types using the `::` operator

!!! note
	Fields with no type annotation default to `Any`, and can accordingly hold any type of value
"""

# ╔═╡ fc65815f-563a-4465-b442-86893b38eb28


# ╔═╡ f3f00241-1bd9-47dd-a4e2-34f9aa10fda8
md"""
We can create an instance of a composite type like so:
"""

# ╔═╡ e55abae6-c5ed-449c-9662-088397188daa


# ╔═╡ 56a115a1-93ff-4259-8472-28091b25ce1c


# ╔═╡ fcfadbb8-1add-4795-bb01-4b654b6962f8
md"""
Type annotations are enforced, so this is not allowed:
"""

# ╔═╡ 2a5789c1-f3f3-4128-abf2-ef6a7776c36e


# ╔═╡ a68b3774-b3ad-4e45-b134-90ab5781059c
md"""
You can inspect the fields of a composite type with `fieldnames`:
"""

# ╔═╡ 046e1a2e-63bd-4c9f-9064-13ea3e85cc4e


# ╔═╡ 659e3bff-7c55-4836-b74b-7f9443c69325
md"""
And can access values of a composite object using the dot notation with their field names.
"""

# ╔═╡ 59387139-f39c-48fa-9328-e9baf093952c


# ╔═╡ f1df753b-2a85-4878-b1b4-8f796a815eba
md"""
## Inspecting Types

There is lots of information in a type that we can explore. Let's use a type we're familiar with - a matrix of floating points.
"""

# ╔═╡ ef945f46-f119-4f1d-becc-3f42b202a10b
my_matrix = rand(3, 3)

# ╔═╡ 6636dfa9-2bb4-4fa6-a682-05d5d91f6ca2
typeof(my_matrix)

# ╔═╡ c78d9d45-97b1-4e28-a66c-b90649905661
md"""
We can see the type of this object is `Matrix{Float64}`. Using that, let's look into different aspects of the type.
"""

# ╔═╡ ab982842-9ac9-429e-873e-1b5cead37c4b
Matrix{Float64}.name

# ╔═╡ af0e1a5a-6891-41a2-82c4-009c908c9348
Matrix{Float64}.parameters

# ╔═╡ df954b97-f91b-4ad1-91ea-04abd2b1083a
md"""
The **parameters** of a type add to its definition. This is not just an `Array`, but a 2-D array whose elements are `Float64`. Let's look further...
"""

# ╔═╡ 7c45e324-2b6d-4582-9574-ea6c1f10ab23
Matrix{Float64}.super

# ╔═╡ 9b3dd4b0-749a-4886-acef-ae6d8a5217df
Matrix{Float64}.super.super.super

# ╔═╡ a2ef390b-66d5-482f-890f-f0b06e2c10f5
md"""
There is a hierarchy of types. Here we can see the parent type of `Matrix{Float64}`. At the top of every hierarchy is the `Any` type.
$(
	println(Float64.super);
	println(Float64.super.super);
	println(Float64.super.super.super);
	println(Float64.super.super.super.super);
	""
)

!!! note
	Note that the parameters of a type have their own hierarchy.
	```julia
	println(Float64.super)
	println(Float64.super.super)
	println(Float64.super.super.super)
	println(Float64.super.super.super.super)
	```
"""	

# ╔═╡ de480083-9cfc-484b-97e0-0bdd9c154b14
md"""
As we get further up the hierarchy, types become **abstract**, which means they only serve to group types together. We can't create an object of an abstract type, Julia will choose the most appropriate concrete type instead.
"""

# ╔═╡ 0d775386-3144-4414-919e-773d01e67299
abs_float = Real(2.0)

# ╔═╡ 4c49c6b1-41a8-4e20-a2cb-1d65b9435248
typeof(abs_float)

# ╔═╡ c6faeac7-c37a-4656-b2d0-4187f4d53c94
isabstracttype(Real)

# ╔═╡ 2a517739-245b-45a5-a315-7baa87132cbd
isabstracttype(Float64)

# ╔═╡ 85f444af-6105-45a2-86aa-6ddef60e16b6
md"""
## Checking Types

We can check types using `isa` and `<:`

To check if an object is of a given type, we use `isa`. This check will succeed for types higher in the hierarchy too!
"""

# ╔═╡ 8845f1e3-3b49-41d4-b397-cb2a93bd1876
2.0 isa Float64

# ╔═╡ 8bb749c2-a87e-4489-90b2-d9145ea54abc
2.0 isa Number

# ╔═╡ a994bf80-8ade-4052-8c69-f57f21962e55
md"""
To check if a type has a given parent type, we use the *subtype operator* `<:`

This check also succeeds up  the hierarchy.
"""

# ╔═╡ 41432c5a-cf4a-43ea-9f04-ca64ef436f25
Float64 <: AbstractFloat

# ╔═╡ 7971e53c-87a0-4a28-a879-622bea8c12f5
Float64 <: Real

# ╔═╡ 51d08a42-0974-474b-8b3c-678aaffd8dcb
md"""
## Defining types with parameters

When defining a composite type, we can specify parameters. This gives you more freedom over the types of your fields!
"""

# ╔═╡ 19b99788-9cfb-4700-b880-4a52bfc4fd67


# ╔═╡ 8ab5a279-70a0-4505-8c04-fecdb54e1816
md"""
Our point can have x and y coordinates of any `Real` type, but they must match.
"""

# ╔═╡ 851a01de-ba6e-4023-9cbd-4cf0a24d0f04


# ╔═╡ 6ded03c4-51df-444d-b776-fe3be345c332


# ╔═╡ 2ed03a08-67ff-41be-8073-b2a02533201f


# ╔═╡ 43d464f1-c442-4db6-baec-8d95baac572d


# ╔═╡ 27ee1271-4a73-4098-a0fe-0549b1951e39
md"""
## Larger type domains

For times when you are looking for one specific type or another, and not all the types in a given hierarchy, we have **Union** types.
"""

# ╔═╡ f790dd5c-f7c6-4557-bcb4-7afca19c11a0
Union{Int64, Float64}

# ╔═╡ 5f039eb4-2791-4dd1-bb5d-af3bf3ba503f
1 isa Union{Int64, Float64}

# ╔═╡ 0350e57d-9680-4ae7-8c3a-6a054c8a94ff
1.0 isa Union{Int64, Float64}

# ╔═╡ 45f0c46c-87fd-443f-bb67-5fd9d4389499
"1.0" isa Union{Int64, Float64}

# ╔═╡ 9192d79a-be41-48e2-88fc-3a8e7a5af29d
md"""
To check if a type belongs to a Union, we use the subtype operator again.
"""

# ╔═╡ 7293b54c-3369-446e-b741-dea6f0dadcfa
Int64 <: Union{Int64, Float64}

# ╔═╡ 3919d58e-bc4e-4fcf-b4a6-06fa9130c419
Union{Int64, String} <: Union{Int64, Float64, String}

# ╔═╡ 4f09292c-a05a-4f0a-95d4-d29498d13309
md"""
Storing a Union in a variable is useful for creating specific type annotations.
"""

# ╔═╡ 9b373e76-b1e5-42a3-98ae-e0b1d651d762
IntOrString = Union{Int, AbstractString}

# ╔═╡ ee39f991-5462-4566-9f01-16bcda683cae
1 :: IntOrString

# ╔═╡ d209f482-81d5-4518-8b4c-4bab60bf5944
"Hello!" :: IntOrString

# ╔═╡ 64f9679d-ee9f-47ab-a02e-886fc38ffcfd
1.0 :: IntOrString

# ╔═╡ Cell order:
# ╟─aba7b876-280f-11ef-0c86-859ea66dd5d0
# ╟─f4238f86-c102-4c3a-ad8e-064e6a022e79
# ╠═3564b2ef-aae2-472d-9a0a-330ecb64c4de
# ╠═3be0f096-3b68-47a2-9a03-77e85d7d055b
# ╠═c132827d-c21d-46d4-9716-e9e91b096366
# ╟─07797d51-f73e-49d2-be78-9c4bb1be6f29
# ╠═fc65815f-563a-4465-b442-86893b38eb28
# ╟─f3f00241-1bd9-47dd-a4e2-34f9aa10fda8
# ╠═e55abae6-c5ed-449c-9662-088397188daa
# ╠═56a115a1-93ff-4259-8472-28091b25ce1c
# ╟─fcfadbb8-1add-4795-bb01-4b654b6962f8
# ╠═2a5789c1-f3f3-4128-abf2-ef6a7776c36e
# ╟─a68b3774-b3ad-4e45-b134-90ab5781059c
# ╠═046e1a2e-63bd-4c9f-9064-13ea3e85cc4e
# ╟─659e3bff-7c55-4836-b74b-7f9443c69325
# ╠═59387139-f39c-48fa-9328-e9baf093952c
# ╟─f1df753b-2a85-4878-b1b4-8f796a815eba
# ╠═ef945f46-f119-4f1d-becc-3f42b202a10b
# ╠═6636dfa9-2bb4-4fa6-a682-05d5d91f6ca2
# ╟─c78d9d45-97b1-4e28-a66c-b90649905661
# ╠═ab982842-9ac9-429e-873e-1b5cead37c4b
# ╠═af0e1a5a-6891-41a2-82c4-009c908c9348
# ╟─df954b97-f91b-4ad1-91ea-04abd2b1083a
# ╠═7c45e324-2b6d-4582-9574-ea6c1f10ab23
# ╠═9b3dd4b0-749a-4886-acef-ae6d8a5217df
# ╟─a2ef390b-66d5-482f-890f-f0b06e2c10f5
# ╟─de480083-9cfc-484b-97e0-0bdd9c154b14
# ╠═0d775386-3144-4414-919e-773d01e67299
# ╠═4c49c6b1-41a8-4e20-a2cb-1d65b9435248
# ╠═c6faeac7-c37a-4656-b2d0-4187f4d53c94
# ╠═2a517739-245b-45a5-a315-7baa87132cbd
# ╟─85f444af-6105-45a2-86aa-6ddef60e16b6
# ╠═8845f1e3-3b49-41d4-b397-cb2a93bd1876
# ╠═8bb749c2-a87e-4489-90b2-d9145ea54abc
# ╟─a994bf80-8ade-4052-8c69-f57f21962e55
# ╠═41432c5a-cf4a-43ea-9f04-ca64ef436f25
# ╠═7971e53c-87a0-4a28-a879-622bea8c12f5
# ╟─51d08a42-0974-474b-8b3c-678aaffd8dcb
# ╠═19b99788-9cfb-4700-b880-4a52bfc4fd67
# ╟─8ab5a279-70a0-4505-8c04-fecdb54e1816
# ╠═851a01de-ba6e-4023-9cbd-4cf0a24d0f04
# ╠═6ded03c4-51df-444d-b776-fe3be345c332
# ╠═2ed03a08-67ff-41be-8073-b2a02533201f
# ╠═43d464f1-c442-4db6-baec-8d95baac572d
# ╟─27ee1271-4a73-4098-a0fe-0549b1951e39
# ╠═f790dd5c-f7c6-4557-bcb4-7afca19c11a0
# ╠═5f039eb4-2791-4dd1-bb5d-af3bf3ba503f
# ╠═0350e57d-9680-4ae7-8c3a-6a054c8a94ff
# ╠═45f0c46c-87fd-443f-bb67-5fd9d4389499
# ╟─9192d79a-be41-48e2-88fc-3a8e7a5af29d
# ╠═7293b54c-3369-446e-b741-dea6f0dadcfa
# ╠═3919d58e-bc4e-4fcf-b4a6-06fa9130c419
# ╟─4f09292c-a05a-4f0a-95d4-d29498d13309
# ╠═9b373e76-b1e5-42a3-98ae-e0b1d651d762
# ╠═ee39f991-5462-4566-9f01-16bcda683cae
# ╠═d209f482-81d5-4518-8b4c-4bab60bf5944
# ╠═64f9679d-ee9f-47ab-a02e-886fc38ffcfd
