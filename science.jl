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

# ╔═╡ 41a406f0-d305-11ee-2ea6-856db6ede06d
md"""
# Pluto for scientists 🧪

If you write code for academic research and you're wondering what Pluto has to offer, this notebook is for you!

We'll explore some of Pluto's strength from the perspective of _scientists_  and _research software developers_! 👩‍🔬 We'll discuss what Pluto can do, and show off some things using a small physics experiment as an example.


!!! question "Is this for me?"
	
	This notebook doesn't require _any_ knowledge of Pluto or Julia, but we assume that you have written research software outside of Pluto.

	If you're completely new to programming, you may find it more useful to come back to this notebook after you have done a few tutorials and written some code of your own. 
"""

# ╔═╡ afeb1feb-8e32-428a-a284-0f8dd5479baa
md"""
## Explain your theories

Going from intricate theories and formulas to code often takes quite a bit of translation. Notebooks are great for science because you can explain your ideas right next to the code.

It's particularly useful that you can also write LaTeX formulas!

Our example will concern the mechanics of a _pendulum_. Let's start by laying out the theory!
"""

# ╔═╡ 7a8c667a-317d-4cd0-ba51-8bc7a8cc402f
md"""
!!! info "The duration of a pendulum swing"

	📚 *This explanation is based on [Pendulum mechanics (Wikipedia)](https://en.wikipedia.org/wiki/Pendulum_(mechanics))*

	The duration of one pendulum swing (``T``) depends on the length of the pendulum (``L``), the gravity constant (``g``), and the angle at the highest point (``\theta_0``).
	
	However, if ``\theta_0`` is small (that is, if the pendulum does not have a wide swing), it will have a negligible effect on the system, so we can leave it out of our equation.
	
	This "small-angle approximation" of a pendulum uses the following formula:
	
	``
	T = 2 \pi \sqrt{\frac{L}{g}}
	``
"""

# ╔═╡ a4300d63-a024-4db9-888c-5ebf2c23953d
md"""
Here we implement this formula as a Julia function:
"""

# ╔═╡ aa0a60b1-19ea-4e6b-b98e-38cb5082d09c
function T(L::Number, g::Number)::Number
	2π * sqrt(L/g)
end

# ╔═╡ 5ffd6bde-fb87-4572-b141-5363d1268234
md"""
We'll consider this the "model" that we want to test.
"""

# ╔═╡ bc5b2c5a-6277-40fb-a4dc-18fb48c10385
md"""
## Visualise your data

One of the great things about working in notebooks is that you can instantly _visualise_ your data. 📈

Visualising while you work is incredibly useful in gaining insight, spotting abnormalities, and discovering trends. A useful aspect of notebooks is that you can view visualisations right alongside your code!
"""

# ╔═╡ d7c0798d-50f3-4d69-bf9f-3238e260cae0
md"""
Let's start with a basic visualisation of our model.
"""

# ╔═╡ 58e88145-0fc0-4ebe-b28c-26638caf52e3
md"""
Okay, we have an idea of what our model predicts! It's time to put the model to the test and collect some real data in an _experiment_ 🧪

Don't worry, I already collected the data. If you're curious, here is how! If not, you can skip ahead.
"""

# ╔═╡ 0bbf56aa-bde5-463b-b449-85d6c6c98791
md"""
!!! info "The pendulum experiment"

	Measuring the swing of a pendulum is a good experiment to do at home or in classrooms, because it doesn't require special materials.

	To collect this data, I used:
	- a cotton rope (you can use any non-elastic rope)
	- a small weight to tie at the bottom (I used a bicycle spoke wrench, because it was what was around)
	- something to hang the pendulum from (I used a ceiling lamp)
	- a stopwatch (I used my phone)
	- ideally, some tape

	I tied one end of the rope to the ceiling lamp and one end to the weight. I then measured the length of the rope.

	I used some tape to mark where I wanted to stand and where the resting position of the rope was. (If I stood at the marked point and the pendulum was hanging still, it would be exactly in front of the tape.)

	To measure the duration of the swing, I pulled the pendulum to one side and let it swing. I started the stopwatch when it passed through the middle, and let it swing back and forth five times. When it passed through the middle after the fifth swing, I stopped the stopwatch and noted the time.
	
	I did this five times and noted the time for each.
	
	I then adjusted and cut the rope to the pendulum was a bit shorter, repeated my measurements, and did that several times so I would have measurements for several lengths of rope.
"""

# ╔═╡ cb58327c-7ea9-4690-9fe5-b327e3d66bbb
md"""
We'll use the `DataFrames` package to represent our experiment data.
"""

# ╔═╡ 4ce2d75c-c1d8-40c3-8802-e55838670834
md"""
!!! tip "Importing data"

	Typing data directly into the code, like we do in this example, is usually not very convenient; don't worry, you can also import data with a library like `CSV`!
"""

# ╔═╡ 1c4b841f-cf04-42e5-a53c-8a2e06e160f9
md"""
Let's compare our model to the results from our experiment.
"""

# ╔═╡ 7ee5f978-3a68-4942-ad04-844eaf7c3c51
md"""
That looks pretty good! But what about this constant ``g`` in our model - did we use the right value? 🤔
"""

# ╔═╡ 5a95a12e-9e24-407c-b52f-ec1549253c69
md"""
## Play with your ideas
"""

# ╔═╡ e71a5d1a-0c3e-4d19-a3bf-19b1d3872fe3
md"""
Let's say we're curious about the role of ``g`` (the gravity constant) in our model, or we want to show to others what this parameter does.

Pluto's _reactivity_ makes it easy to explore your code! Let's start by setting a value for ``g`` and using it in a plot.
"""

# ╔═╡ cbfc8eb1-9615-4b80-a4ab-e9ab1b121b72
# you can change this code!
g_example = 9.0

# ╔═╡ 6b9bd3d8-6e03-4639-aca2-5781e8849016
md"""
Now, you can [edit the value of `g_example`](#g_example) and the plot will update instantly! ⚡ Try it out!

Pluto's reactivity is designed to make this kind of exploration _easy_ and _intuitive_. You can play around with values and see their effect. Neat!
"""

# ╔═╡ 21e173b3-ee0f-4304-b858-8aafe8fed34b
md"""
But we can do even better! Instead of typing in values, we can _bind_ the value of ``g`` to a _slider_! We'll use the `PlutoUI` package, which offers common UI elements.
"""

# ╔═╡ f1aaf896-08c3-485b-b9d8-69af4784bf68
md"""
You can play with the slider to see what happens! While we're at it, let's also see how that value of ``g`` compares to the experiment data:
"""

# ╔═╡ b0b31191-2f38-47b1-80c1-61ddb01f2175
md"""
On my screen, this is becoming a bit cumbersome: the slider is quite far away from the bottom graph. But we can always _rearrange cells_: just drag the cell with the slider down to the plot where you want to compare it.
"""

# ╔═╡ e0515b40-2abe-492e-b47c-b1cfe0ae31ef
md"""
By exploring the graph, we can get a good sense of what the value of ``g`` should approximately be. Now, let's use some maths to get a more precise estimate.
"""

# ╔═╡ a7a837f7-a404-4e5e-9687-d257bbd1e522
md"""
!!! info "Finding g"

	We'll try to find the optimal value for ``g``; that is, the one where our model best matches the data from our experiment.

	We'll use a fairly simple method of approximation. Based on our visualiastions, we give a _lower_ and _upper_ bound for ``g``: we know it's somewhere between those values.

	Then, we take a sample of 50 values between those ends (spread out uniformly), and return the one where we get the closest fit to our observations.

	We'll compare the predictions with the observations by taking the absolute error in each datapoint, and taking the sum of all those. So if ``p`` is the vector of all predictions, and ``o`` the vector of all observations, the error is defined as
	
	``
	\text{E} = \sum_{1 \leq i \leq n}{p_i - o_i}
	``
"""

# ╔═╡ a741ea30-1171-4f0d-9b9c-8f6e7e41afcf
md"""
So based on our experiment data, what should ``g`` be?
"""

# ╔═╡ 2125a69e-362e-4fe0-bf97-ecb678e4e19c
md"""
!!! tip "Modelling and optimisation in Julia"

	We wrote some functions of our own for this example, but if you're doing this kind of thing in your research, there are Julia libraries that make that a lot easier! Have a look at libraries like [ModelingToolkit](https://docs.sciml.ai/ModelingToolkit/stable/), [JuMP](https://jump.dev/), or [Optim](https://julianlsolvers.github.io/Optim.jl/stable/).
"""

# ╔═╡ d2066968-8e23-4834-8314-d0ee5456e742
md"""
## Run your code as a script

It often makes sense to develop a model in a notebook and visualise it on some example data, and then train the model on the real data, which may take a long time.  Perhaps this is the kind of thing where you want to run a training script on a remote server where you only have a command line to work with.

At this point, it will come in handy that _Pluto notebooks are also Julia scripts!_ If you have created a notebook `my_model.jl`, you can run it from the command line with `julia my_model.jl`. Similarly, it's no problem to import Pluto notebooks inside "regular" Julia scripts!

So if you have developed your notebook with example data on your own laptop, you can move it to a remote server and run it from there. Or you can work in a notebook to define a `train_model(data)` function, and then write a small script that imports `train_model` and runs it on the big dataset. 🚀

### Disable in File
The function **Disable in File** can be really useful for this! (Edit this notebook and press the `(...)` context menu of this cell.) This makes the cell run in your notebook, but stored as a comment in the Julia file. This lets you have cells that are useful for visualisation (like a plot), that are not executed when you `include` the notebook file somewhere else. 

**Disable in File** is also reactive: if you disable a cell, then all cells that depend on it will also get disabled automatically. This is really handy: often you can just disable the cell that loads your dataset, and then any cell that uses your data will be excluded, while your helper functions are still available!
"""

# ╔═╡ 59367e61-fe12-46de-898b-fe1047d6aed9
md"""
## Share your work

You've developed some exciting algorithms, trained a model on real data, created visualisations, and you're ready to share your work with the world. Great!

You can polish your Pluto notebooks into accessible, interesting, comprehensive explanations of your work. We've seen some of this already: adding explanations and formulas, visualisations, and spicing it up with some interactions.

When you're getting your notebook ready for the world, you can also hide the output or the code of some cells (or both), or rearrange the order of cells. For instance, you can move "utility code" to the bottom of the notebook.

But now that we have this nicely polished notebook, what can we do with it?

While some of your colleagues will be interested to run your Pluto notebooks themselves (more on that later), you also want to share your code with people who don't have Pluto installed. How can they see your process?
"""

# ╔═╡ 26f89649-5a0d-4349-b798-6ee8a74c0ca3
md"""
### Notebook file

Pluto stores your notebook as a Julia file (`.jl`). The file contains your **code**, and a copy of your **package environment** (with the exact versions of packages that you used). Extra data that Pluto needs is stored as Julia comments.

Sharing the **Notebook file** is ideal if you just want to share the code, without calculated results.
"""

# ╔═╡ 050179e8-54ca-463f-bd66-290c2087ca50
md"""
### HTML export

If you're sharing your notebooks digitally, you can create an _HTML export_.

This will create a single file, e.g. `my_model.html`, that you can e-mail to colleagues, add as an attachment to a paper, or display on a website.

You can try that right now! At the top of this page, click the "Export..." button, and select the "static HTML" option to download this notebook.

This version looks like a "read-only" version of your notebook, but **it also includes your notebook code**! People who read it can click on a button to export the original notebook. Neat!
"""

# ╔═╡ f3e106db-eb57-4325-9234-9f5dc400e9fd
md"""
### PDF export

While Pluto is no full-featured publishing software, you can create PDF exports of notebooks! (In the same export menu for HTML). This can be useful if you want to create an attachment to a paper, or print out hand-outs for a lecture.
"""

# ╔═╡ de3c565a-5b29-4455-809a-7f4e2b6ad26b
md"""
### Record *(preview)*

Pluto has a special feature: *recording mode*. It works quite similar to a screen recording: you click *record*, and you can move sliders, make code changes, and scroll around the notebook. If you enable microphone access, then you can tell a story! 

The result is a video where people can play back what you demonstrated! Watch [this recording of *unitful sliders*](https://plutojl.org/unitful%20sliders/) to see an example.

But unlike a regular screen recorder, the output file is not exactly a video (`.mp4` or `.mov`), but an HTML file (`.html`)! When people open the file, it will look exactly like a video player, but it's actually **Pluto magic**! Pluto didn't record the screen, but it recorded all *state changes*, and it can play them back in the static preview. This means that:
- While watching the video, you can **scroll around**: you are not limited to watching the frame that was recorded.
- You can watch the video with your own screen size! And it looks super sharp!
- The **file size is tiny** compared to a video! That's because we only need to store text, data and audio.

#### Future work
The **Record** feature is still in preview. We are still working on two things:
- Recording your cursor and changes as you type.
- An easy way to share HTML files. We are working on a website to share and view recording files!
"""

# ╔═╡ 58f6ac52-cdf5-4b70-9c50-491d0ac38b45
md"""
### Presentation mode

You can use Pluto notebooks to give presentations!

You can use the "export..." menu to switch Pluto to "presentation mode" (and to switch it back to normal). When you're presenting, Pluto puts some spacing between the headers and you will get some navigation buttons to jump from header to header.

This may be enough for a simple lecture, or you could add special formatting to create a really flashy presentation. For making basic presentations, Pluto isn't going to win out over dedicated presentation software in terms of usability, but being able to present from a running notebook offers new options!

If you're interested in giving presentations or lectures with _interactive_ presentations of your research, or where you can quickly type in some code when you're answering a question, Pluto's presentation mode is a great option!
"""

# ╔═╡ 50814873-f51b-4fa6-9bf2-85dfe23846a5
md"""
### Hosting an interactive website

If you're looking for a more advanced presentation format, you can create a web server where visitors can view your notebooks and _play with interactive elements_ ⚡.

This means that you can write your model and visualisations in Julia, and create an engaging, interactive website where anyone can explore your work!

👉 [Learn more about PlutoSliderServer](https://github.com/JuliaPluto/PlutoSliderServer.jl)
"""

# ╔═╡ 22f72a1f-1b38-4f87-9806-bf33bd386f84
md"""
## Reproducible code

Once you've presented and publish your work, how does your code fare?

_Reproducability_ is incredibly important in academia. It's how we can verify research, and how we can build on it. When you're putting your own research software out in the world, you want people to be able to run it!

Pluto is designed to be reproducible by default!

A big part of this is the _built-in package manager_. 📦 When you import packages in Pluto, the notebook file will write down the exact versions of the packages that you used. When someone else opens your notebook in Pluto, they will use the exact same package environment, without even thinking about it!

!!! question "What if they don't use Pluto?"
	
	If the scientists from the future don't use Pluto, they won't benefit from the built-in package manager, but they can still check your notebook file for the versions of packages that you used. Neat!


👉 [Learn more about Pluto's package manager](https://github.com/fonsp/Pluto.jl/wiki/%F0%9F%8E%81-Package-management)
"""

# ╔═╡ f2f4398a-1c43-4a70-9e56-93dfe0c2b0b6
import PlutoUI, DataFrames, CairoMakie, StatsBase, RDatasets

# ╔═╡ 31a40204-59b8-4cc7-adce-230e9d2e8a26
PlutoUI.TableOfContents(include_definitions=true)

# ╔═╡ 67b6075a-e58f-4311-aa0f-d7063ca60f8a
function plot_pendulum_model(g::Number = 9.8)
	lengths = 0.0:0.1:3.0 # sample pendulum length from 0 - 3 metres
	times = T.(lengths, g) # calculate the time using the model

	fig = CairoMakie.Figure()
	ax = CairoMakie.Axis(fig[1,1],
		title="Pendulum model",
		xlabel="pendulum length (m)",
		ylabel="period (s)")
	CairoMakie.lines!(ax, lengths, times, label="prediction (g = $g)")
	CairoMakie.ylims!(ax, 0, 4)
	CairoMakie.axislegend(ax)
	fig, ax
end

# ╔═╡ 36262f98-ef18-44c2-9c3c-da9b08161f2c
plot_pendulum_model()

# ╔═╡ cebce2b1-0462-4bfc-a24e-512b180d14a4
plot_pendulum_model(g_example)

# ╔═╡ b355534c-6038-4703-a84c-93a0c6903d97
data = let
	lengths = [ 2.21, 1.79, 1.42, 1.07, 0.74, 0.47 ]
	length_per_trial = repeat(lengths, inner=5)
	
	measured_time_per_trial = [
		14.92, 14.92, 14.93, 14.98, 14.94,
		13.56, 13.45, 13.43, 13.48, 14.18,
		12.09, 12.04, 12.15, 12.16, 12.12,
		10.33, 10.50, 10.28, 10.21, 10.43,
		8.47, 8.59, 8.51, 8.52, 8.54,
		6.61, 6.68, 6.60, 6.65, 6.67,
	]
	period_per_trial = measured_time_per_trial ./ 5

	DataFrames.DataFrame(
		:L => length_per_trial,
		:T => period_per_trial,
	)
end

# ╔═╡ 3fec943e-5534-4c4f-95b3-fd8acf18fa2f
function error(g::Number)::Number
	predictions = T.(data.L, g)
	errors = predictions .- data.T
	sum(abs.(errors))
end

# ╔═╡ 95dcdf95-663d-4d46-a9cb-5a0d27139a10
function find_optimal_g(min::Number, max::Number)
	gs = range(min, max, length=5000)
	argmin(error, gs)
end

# ╔═╡ 39b78056-a038-443c-a214-9b46ef88c583
find_optimal_g(8.0, 10.0)

# ╔═╡ 7a880a17-41a4-453d-80ea-b572d348ec2a
function plot_model_and_observations(g::Number = 9.8)
	fig, ax = plot_pendulum_model(g)
	CairoMakie.scatter!(ax, data.L, data.T, label="observations")
	ax.title = "Pendulum model vs. observations"
	CairoMakie.axislegend(ax)
	fig
end

# ╔═╡ 9a2acb29-0f5f-4c6c-9e26-f6e52b01c650
plot_model_and_observations(9.8)

# ╔═╡ 3da81ee0-89f2-4427-adb9-562fe2c8ece2
@bind g_slider PlutoUI.Slider(0.1:0.1:10.0, default=5)

# ╔═╡ 3c721a5f-c338-4a46-8fa1-774dad220cb8
md"""
``radius`` = $(round(g_slider, digits=2))
``area`` = $(π * g_slider ^ 2)
"""

# ╔═╡ e359046e-44a9-47bd-8a7f-943057b0d3a8
plot_model_and_observations(g_slider)

# ╔═╡ 40117e27-d8bc-465f-881b-1e44f80e2926
let
	fig = CairoMakie.Figure()
	ax = CairoMakie.Axis(fig[1,1])
	CairoMakie.scatter!(ax, [0.5], [0.5], markersize=(π * g_slider ^ 2))
	CairoMakie.xlims!(ax, 0, 1)
	CairoMakie.ylims!(ax, 0, 1)
	fig
end

# ╔═╡ Cell order:
# ╠═31a40204-59b8-4cc7-adce-230e9d2e8a26
# ╟─41a406f0-d305-11ee-2ea6-856db6ede06d
# ╟─afeb1feb-8e32-428a-a284-0f8dd5479baa
# ╟─7a8c667a-317d-4cd0-ba51-8bc7a8cc402f
# ╟─a4300d63-a024-4db9-888c-5ebf2c23953d
# ╠═aa0a60b1-19ea-4e6b-b98e-38cb5082d09c
# ╟─5ffd6bde-fb87-4572-b141-5363d1268234
# ╟─bc5b2c5a-6277-40fb-a4dc-18fb48c10385
# ╟─d7c0798d-50f3-4d69-bf9f-3238e260cae0
# ╠═67b6075a-e58f-4311-aa0f-d7063ca60f8a
# ╠═36262f98-ef18-44c2-9c3c-da9b08161f2c
# ╟─58e88145-0fc0-4ebe-b28c-26638caf52e3
# ╟─0bbf56aa-bde5-463b-b449-85d6c6c98791
# ╟─cb58327c-7ea9-4690-9fe5-b327e3d66bbb
# ╠═b355534c-6038-4703-a84c-93a0c6903d97
# ╟─4ce2d75c-c1d8-40c3-8802-e55838670834
# ╟─1c4b841f-cf04-42e5-a53c-8a2e06e160f9
# ╠═7a880a17-41a4-453d-80ea-b572d348ec2a
# ╠═9a2acb29-0f5f-4c6c-9e26-f6e52b01c650
# ╟─7ee5f978-3a68-4942-ad04-844eaf7c3c51
# ╟─5a95a12e-9e24-407c-b52f-ec1549253c69
# ╟─e71a5d1a-0c3e-4d19-a3bf-19b1d3872fe3
# ╠═cbfc8eb1-9615-4b80-a4ab-e9ab1b121b72
# ╠═cebce2b1-0462-4bfc-a24e-512b180d14a4
# ╟─6b9bd3d8-6e03-4639-aca2-5781e8849016
# ╟─21e173b3-ee0f-4304-b858-8aafe8fed34b
# ╠═3da81ee0-89f2-4427-adb9-562fe2c8ece2
# ╠═3c721a5f-c338-4a46-8fa1-774dad220cb8
# ╠═40117e27-d8bc-465f-881b-1e44f80e2926
# ╟─f1aaf896-08c3-485b-b9d8-69af4784bf68
# ╠═e359046e-44a9-47bd-8a7f-943057b0d3a8
# ╟─b0b31191-2f38-47b1-80c1-61ddb01f2175
# ╟─e0515b40-2abe-492e-b47c-b1cfe0ae31ef
# ╟─a7a837f7-a404-4e5e-9687-d257bbd1e522
# ╠═95dcdf95-663d-4d46-a9cb-5a0d27139a10
# ╠═3fec943e-5534-4c4f-95b3-fd8acf18fa2f
# ╟─a741ea30-1171-4f0d-9b9c-8f6e7e41afcf
# ╠═39b78056-a038-443c-a214-9b46ef88c583
# ╟─2125a69e-362e-4fe0-bf97-ecb678e4e19c
# ╟─d2066968-8e23-4834-8314-d0ee5456e742
# ╟─59367e61-fe12-46de-898b-fe1047d6aed9
# ╟─26f89649-5a0d-4349-b798-6ee8a74c0ca3
# ╟─050179e8-54ca-463f-bd66-290c2087ca50
# ╟─f3e106db-eb57-4325-9234-9f5dc400e9fd
# ╟─de3c565a-5b29-4455-809a-7f4e2b6ad26b
# ╟─58f6ac52-cdf5-4b70-9c50-491d0ac38b45
# ╟─50814873-f51b-4fa6-9bf2-85dfe23846a5
# ╟─22f72a1f-1b38-4f87-9806-bf33bd386f84
# ╠═f2f4398a-1c43-4a70-9e56-93dfe0c2b0b6
