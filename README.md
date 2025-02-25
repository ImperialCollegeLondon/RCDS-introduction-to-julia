# Introduction to Julia

Introduction to Julia course at Imperial College Early Career Researcher Institute (ECRI)

3 × 2 hour classes

* **Part 1:** Getting started, Functions, Conditionals
* **Part 2:** Data Structures, Packages, Plotting
* **Part 3:** Types, Multiple Dispatch, Error handling

## Tutors : 
* Jay DesLauriers

### Past Tutors :
* Yiannis Simillides
* Evripides Georgiades

## Acknowledgements :

The course materials come from [Julia Academy](https://juliaacademy.com/) lessons,
and are being adapted for teaching in ECRI.

## On completion of this workshop you will be able to:
* **Use** notebooks to execute Julia scripts and install packages.
* **Apply** fundamental components of the Julia language including variables, loops, conditionals and functions. 
* **Create** programs designed to solve simple problems.
* **Interpret** common errors and use these to help debug a program.
* **Understand** advanced concepts, such as Multiple Dispatch and custom data types.

## We will also share materials exploring domain specific packages used for:
* Data Frames
* Basic Linear Algebra
* Factorisations and SVD
* Ordinary differential equations

## Prerequisites

* No programming experience is required
* Feel free to install Julia using the instructions below

## Useful (Julia) Links
* https://docs.julialang.org/en/v1/
* https://julialang.slack.com/
* https://discourse.julialang.org/c/usage/first-steps/8

## Feedback
This is the fifth time this course is running, with a slightly new format, so please feel free to let us know if anything
needs changing / any feedback / difficulties or if there is anything that you particularly enjoyed!

# Preparing Your Environment

In this course we'll be using the latest and greatest Julia v1.x via a Pluto Notebook.
This section will help you get set up with Julia.

## Codespaces

The fastest way to get started with the course material is with a GitHub Codespace. You will need to login with a GitHub account to do so. We recommend signing up for [GitHub Student Benefits](https://education.github.com/discount_requests/application), if you have not already.

Click the green **<> Code** button above the file listing on this page, select the **Codespaces** tab and click **Create codespace on main**. This will start a virtual environment where we can work on notebooks together. 

The Codespace takes about 5 minutes to fully start. When ready, it will inform you that there is a service running on port `1234`, and offer to take you there. Click that pop-up and you'll be taken to the notebook environment.


## Julia Elsewhere

If you are keen on using Julia more regularly, we have outlined various options below.


### Julia Locally

If you prefer to use Julia locally, see the [official installation instructions](https://julialang.org/downloads/), which use an installation manage called **Juliaup**.

Once installed, enter the Julia REPL by typing `julia` on the command line.
Then use the following commands to install Pluto Notebooks:

```julia
import Pkg; Pkg.add("Pluto")
```

```julia
import Pluto;
Pluto.run()
```

You'll be prompted with a link to the Pluto environment.

## Jupyter

If you would like to return to the comfort of Jupyter in the future, you'll need to install `IJulia` so you can access Julia via Jupyter. With that you should be ready to go!

```julia
using Pkg; Pkg.add("IJulia")
```

### Imperial College RCS

The Research Computing Service runs JupyterHub. If you have access to RCS, this can be a great way
to run Julia easily, with some power behind it. Navigate to [jupyter.rcs.imperial.ac.uk](https://jupyter.rcs.imperial.ac.uk)
and select a resource to get started. **For this course, the smallest resource is sufficient (1 core / 8GB RAM).

An old version of Julia is provided, so it is best to install the latest version.
RCS provides instructions [here](https://imperialcollegelondon.github.io/research-computing-tips/compute/2020/07/08/running-julia.html)
(be sure to change the version numbers to 1.x).
