#!/usr/bin/env sh

set -eu

[ -f Manifest.toml ] || cp /usr/local/julia-manifest.toml Manifest.toml
julia --project=. -e 'using Pluto; Pluto.run(require_secret_for_open_links=false, require_secret_for_access=false)'
