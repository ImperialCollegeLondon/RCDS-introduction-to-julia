# [Choice] Julia version
ARG VARIANT=1-bookworm

# Use the  official Julia image with the selected version
FROM julia:${VARIANT}

COPY LocalPreferences.toml .

ENV JULIA_PROJECT="."

# Add DifferentialEquations.jl to the image
RUN julia -e 'using Pkg; Pkg.add("OrdinaryDiffEq"); Pkg.precompile()'
