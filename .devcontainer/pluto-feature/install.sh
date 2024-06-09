#!/bin/bash

set -e

echo "Installing Pluto.jl and running it on port $PLUTO_PORT..."

# Install Pluto.jl
/home/vscode/.juliaup/bin/julia -e 'import Pkg; Pkg.add("Pluto")'

# Run Pluto in the background and redirect output to a log file
nohup /home/vscode/.juliaup/bin/julia -e 'import Pluto; Pluto.run()' > /var/log/pluto.log 2>&1 &

echo "Pluto.jl is running in the background."
