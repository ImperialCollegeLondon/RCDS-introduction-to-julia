#!/bin/bash

set -e

echo "Installing Pluto.jl and running it on port 1234..."

export JULIA_DEPOT_PATH="/home/vscode/.julia"

# Install Pluto.jl
/home/vscode/.juliaup/bin/julia -e 'import Pkg; Pkg.add("Pluto");'

#Pkg.activate("/home/vscode/.julia/environments/v1.10"); Pkg.precompile();