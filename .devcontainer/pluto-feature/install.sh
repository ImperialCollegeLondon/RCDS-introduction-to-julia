#!/bin/bash

set -e

echo "Installing Pluto.jl and running it on port $PLUTO_PORT..."

# Install Pluto.jl
/home/vscode/.juliaup/bin/julia -e 'import Pkg; Pkg.add("Pluto")'

# Create a script to run Pluto
/home/vscode/.juliaup/bin/julia -e 'import Pluto; Pluto.run()'

echo "Pluto is running."
