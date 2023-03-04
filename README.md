# Introduction to Julia

Introduction to Julia course at Imperial College

3 × 2 hour classes

* **Part 1:** Getting started, Functions, Conditionals, Data Structures
* **Part 2:** Packages, Plotting, Types, Multiple Dispatch
* **Part 3:** Benchmarking Julia, Linear Algebra, AutoDifferentiation

## Tutors : 
* Jay DesLauriers

### Past Tutors :
* Yiannis Simillides
* Evripides Georgiades

## On completion of this workshop you will be able to:
* **Use** Jupyter Notebooks to execute Julia scripts and install packages.
* **Apply** fundamental components of the Julia language including variables, loops, conditionals and functions. 
* **Create** programs designed to solve simple problems.
* **Interpret** common errors and use these to help debug a program.
* **Understand** advanced concepts, such as Multiple Dispatch and custom data types.

## There will also be an opportunity to explore domain specific packages used for:
* Data Frames
* Basic Linear Algebra
* Factorisations and SVD
* Ordinary differential equations

## Prerequisites

* No programming experience is required
* Binder runtime will be provided
* Feel free to install Julia using the instructions below

## Useful (Julia) Links
* https://docs.julialang.org/en/v1/
* https://julialang.slack.com/
* https://discourse.julialang.org/c/usage/first-steps/8

## Feedback
This is the third time this course is running, so please feel free to let us know if anything
needs changing / any feedback / difficulties or if there is anything that you particularly enjoyed!

# Preparing Your Environment

In this course we'll be using the latest and greatest Julia v1.8.5 via a Jupyter Notebook.
This section will help you get set up with Julia.

The fastest way to get started with the course material is with [Binder](https://mybinder.org/).

## Binder

Binder is a cloud based platform for reproducible programming environments. It is a free service,
so don't expect the same performance as RCS, or even your local device. However, it is a great
solution for quickly getting started with Julia! Simply click the icon below depending on the day of the course.

**Day 1:** [![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/ImperialCollegeLondon/RCDS-introduction-to-julia.git/day1)

**Day 2:** [![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/ImperialCollegeLondon/RCDS-introduction-to-julia.git/day2)

**Day 3:** [![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/ImperialCollegeLondon/RCDS-introduction-to-julia.git/day3)

*Be aware that load times may vary and timeout. Please try again in case of failure*

[All days in one binder](https://mybinder.org/v2/gh/ImperialCollegeLondon/RCDS-introduction-to-julia.git/head) (may be very slow)

## Julia Elsewhere

If you are keen on using Julia more regularly, we have outline various options below.

### Imperial College RCS

The Research Computing Service runs JupyterHub. If you have access to RCS, this can be a great way
to run Julia easily, with some power behind it. Navigate to [jupyter.rcs.imperial.ac.uk](https://jupyter.rcs.imperial.ac.uk)
and select a resource to get started. **For this course, the smallest resource is sufficient (1 core / 8GB RAM).

An old version of Julia is provided, so it is best to install the latest version.
RCS provides instructions [here](https://imperialcollegelondon.github.io/research-computing-tips/compute/2020/07/08/running-julia.html)
(be sure to change the version numbers to 1.8 / 1.8.5). We have adapted and copied the steps below for convenience.

Via the Jupyter Launcher or File menu open a Terminal.

Download, extract and run Julia

```bash
curl https://julialang-s3.julialang.org/bin/linux/x64/1.8/julia-1.8.5-linux-x86_64.tar.gz | tar xz
julia-1.8.5/bin/julia

```

Install the IJulia kernel

```julia
using Pkg
Pkg.add("IJulia")

```

Download the course materials

```bash
curl -L https://github.com/imperialcollegelondon/rcds-introduction-to-julia/tarball/day1 | tar xz
```

Next time you create a new Notebook, you should see **Julia 1.8.5** as an available Kernel. 


## Julia Locally

First, [download the appropriate installer for your system here](https://julialang.org/downloads),
and run it to install Julia (if prompted, we recommend to *Add Julia to PATH*).

Now run Julia. On Windows machines you can find Julia in the **start bar**.
On a Mac, you might need to open **Terminal** and type `julia`.

Next we'll intall `IJulia` so we can access Julia via Jupyter.
```julia
using Pkg
Pkg.add("IJulia")

```

If you already have a Jupyter environment, open it and you 
should see **Julia 1.8.5** as an available Kernel! Otherwise, read on.

## Jupyter

We recommend Anaconda for a quick and easy Jupyter interface. It is
available via the [Software Hub](https://softwarehub.imperial.ac.uk/).

Or you can download it locally from the [official website](https://www.anaconda.com/products/distribution)

Once installed and running, you can open a new Jupyter Notebook backed by Julia 1.8.5.

*Note with the Software Hub Anaconda on the Training Room computers, after*
*ignore the application that starts, and instead search and run **Jupyter Notebook (Anaconda 3)***


## Notebook Downloads

If you are working locally, download the notebooks used each day below!

**Day 1:** [![Zip](https://img.shields.io/badge/zip-download-brightgreen)](https://github.com/ImperialCollegeLondon/RCDS-introduction-to-julia/zipball/day1)

**Day 2:** [![Zip](https://img.shields.io/badge/zip-download-brightgreen)](https://github.com/ImperialCollegeLondon/RCDS-introduction-to-julia/zipball/day2)

**Day 3:** [![Zip](https://img.shields.io/badge/zip-download-brightgreen)](https://github.com/ImperialCollegeLondon/RCDS-introduction-to-julia/zipball/day3)
