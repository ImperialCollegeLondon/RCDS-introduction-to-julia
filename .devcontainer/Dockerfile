FROM julia:1.12-bookworm

ENV JULIA_DEPOT_PATH=/usr/local/julia-depot
ENV JULIA_PKG_PRECOMPILE_AUTO=0

RUN apt-get update \
    && apt-get install -y --no-install-recommends git \
    && rm -rf /var/lib/apt/lists/*

RUN useradd --create-home --shell /bin/bash --uid 1000 vscode

WORKDIR /tmp/julia-project

COPY Project.toml Manifest.toml ./

RUN mkdir -p "${JULIA_DEPOT_PATH}" \
    && julia --project=. -e 'using Pkg; Pkg.instantiate(); Pkg.precompile(); using Pluto' \
    && chmod -R a+rwX "${JULIA_DEPOT_PATH}" \
    && rm -rf /tmp/julia-project
