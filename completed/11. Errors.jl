### A Pluto.jl notebook ###
# v0.20.8

using Markdown
using InteractiveUtils

# ╔═╡ 955c8ad4-4527-11f0-0b88-a7550f6c7b1a
md"""
# Error Handling in Julia

Sometimes code breaks. Julia lets you catch and raise errors, so your notebook doesn’t crash and you can give useful feedback.
"""

# ╔═╡ 130aa0d1-978f-4434-b16c-35f09b16bee1
md"""
## Catching Errors

If you think code might fail, use a `try`/`catch` block. Without one, we get this:
"""

# ╔═╡ 80cbae4f-bf25-4664-bc58-74abfa660655
10 ÷ 0

# ╔═╡ c6a5ea1e-aae9-47bd-ac5f-5722804927d2
md"""
With a `try / catch`, it looks like this:
"""

# ╔═╡ 593030f8-b32c-4582-a46a-526eecb64b48
try
    10 ÷ 0
catch err
    println("Caught an error: ", err)
end

# ╔═╡ a6b5b49e-4a76-4060-89ba-4819f068e56c
md"""
The error is caught and your message prints instead.

You can also check for a specific error type:
"""

# ╔═╡ ecc418f7-6fc6-47ec-b533-fb8642ccbed0
try
    parse(Int, "xyz")
catch err
    if err isa ArgumentError
        println("Not a valid integer.")
    else
        println("Some other error: ", err)
    end
end

# ╔═╡ ac842bd6-ded9-4caa-b590-bc099dc3db5d
md"""
## Raising Errors: `error()` vs `throw`

- `error("message")` always throws an `ErrorException` with your message.
- `throw(e)` lets you throw *any* exception, not just `ErrorException`.

Use `error()` for simple cases. Use `throw()` for custom errors.
"""

# ╔═╡ 637a2cd0-cf19-4b29-8096-b0706a4e875c
# This always throws an ErrorException
error("This will generate a generic error message.")

# ╔═╡ 7cadcd73-a8b0-4d5f-9c7e-60d8cb6fac63
md"""
## Custom Error Types

Make your own error by defining a struct with `<: Exception`, then throw it.
"""

# ╔═╡ 768e1d4e-620b-4499-b9da-a623b7957e54
struct NotEvenError <: Exception
    msg::String
end

# ╔═╡ cad41a3c-475b-439e-a1c6-0d55c86f04f1
function must_be_even(x)
    if x % 2 != 0
        throw(NotEvenError("Number $x is not even!"))
    end
    "Even: $x"
end

# ╔═╡ f1075e8e-77e0-4d57-8a22-da7daa61ebbb
try
    must_be_even(3)
catch err
    if err isa NotEvenError
        println("Custom error caught: ", err.msg)
    else
        println("Other error: ", err)
    end
end

# ╔═╡ 9deb35c0-dafd-4eee-b0d5-72f070346bee
md"""
## `@assert` for Quick Checks

Use `@assert` to make sure something is true. If not, it throws an `AssertionError`.
"""

# ╔═╡ 3ceba579-f756-4833-a266-6e0fd5d591e8
x = 7

# ╔═╡ 7309c3f8-728c-46c4-ab3c-8f3e48d417c7
@assert x > 0 "x must be positive!"

# ╔═╡ c869e424-bfb0-4796-a3cc-094ba0863b6f
md"""
## Finally

A `finally` block always runs, even if there’s an error. Good for cleanup.
"""

# ╔═╡ 291ab20f-a52e-4d97-89c1-6705082f5050
try
    println("Doing something risky...")
    1 ÷ 0
catch
    println("Error happened!")
finally
    println("Cleanup goes here.")
end

# ╔═╡ c607b5e3-2ed6-42c1-9504-8fffa20a1872
md"""
# Exercise

Write a function `safe_parse_int(str)` that:
- Tries to convert `str` to an integer.
- Returns the integer if it works.
- Returns `"Not a valid integer"` if not.

Test it with `"123"` and `"hello"`.
"""

# ╔═╡ 1467687b-f0ed-49d8-88f5-78f6f6d2076e
# CODE GOES HERE

# ╔═╡ efbbd0c5-4f3c-4a21-86cb-179da9bb9473
safe_parse_int("123")

# ╔═╡ 4ac8dc23-dde1-43ec-a17b-51179b36161b
safe_parse_int("hello")

# ╔═╡ e0eb96a9-9682-4db7-8c8d-c18d31502066
md"""
That's the basics of error handling in Julia: catching errors, throwing your own, using custom types, and quick checks with `@assert`.
"""

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.11.5"
manifest_format = "2.0"
project_hash = "da39a3ee5e6b4b0d3255bfef95601890afd80709"

[deps]
"""

# ╔═╡ Cell order:
# ╟─955c8ad4-4527-11f0-0b88-a7550f6c7b1a
# ╟─130aa0d1-978f-4434-b16c-35f09b16bee1
# ╠═80cbae4f-bf25-4664-bc58-74abfa660655
# ╟─c6a5ea1e-aae9-47bd-ac5f-5722804927d2
# ╠═593030f8-b32c-4582-a46a-526eecb64b48
# ╟─a6b5b49e-4a76-4060-89ba-4819f068e56c
# ╠═ecc418f7-6fc6-47ec-b533-fb8642ccbed0
# ╟─ac842bd6-ded9-4caa-b590-bc099dc3db5d
# ╠═637a2cd0-cf19-4b29-8096-b0706a4e875c
# ╟─7cadcd73-a8b0-4d5f-9c7e-60d8cb6fac63
# ╠═768e1d4e-620b-4499-b9da-a623b7957e54
# ╠═cad41a3c-475b-439e-a1c6-0d55c86f04f1
# ╠═f1075e8e-77e0-4d57-8a22-da7daa61ebbb
# ╟─9deb35c0-dafd-4eee-b0d5-72f070346bee
# ╠═3ceba579-f756-4833-a266-6e0fd5d591e8
# ╠═7309c3f8-728c-46c4-ab3c-8f3e48d417c7
# ╟─c869e424-bfb0-4796-a3cc-094ba0863b6f
# ╠═291ab20f-a52e-4d97-89c1-6705082f5050
# ╟─c607b5e3-2ed6-42c1-9504-8fffa20a1872
# ╠═1467687b-f0ed-49d8-88f5-78f6f6d2076e
# ╠═efbbd0c5-4f3c-4a21-86cb-179da9bb9473
# ╠═4ac8dc23-dde1-43ec-a17b-51179b36161b
# ╟─e0eb96a9-9682-4db7-8c8d-c18d31502066
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
