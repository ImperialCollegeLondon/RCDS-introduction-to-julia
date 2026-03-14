FROM julia:1.12-bookworm

ENV JULIA_DEPOT_PATH=/usr/local/julia-depot
ENV JULIA_PKG_PRECOMPILE_AUTO=0

WORKDIR /tmp/julia-project

COPY Project.toml ./

RUN mkdir -p "${JULIA_DEPOT_PATH}" \
    && julia --project=. -e 'using Pkg; Pkg.instantiate(); Pkg.precompile()' \
    && chmod -R a+rwX "${JULIA_DEPOT_PATH}" \
    && rm -rf /tmp/julia-project
