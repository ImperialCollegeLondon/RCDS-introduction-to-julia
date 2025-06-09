#!/usr/bin/env julia

using Pkg
Pkg.activate(".")

using PackageCompiler

packages = [
    "Plots",
    "Pluto", 
    "PlutoUI",
    "RDatasets",
    "Statistics"
]

for pkg in packages
    Pkg.add(pkg)
end

create_sysimage(
    packages,
    sysimage_path="intro_r_sysimage.so",
    cpu_target="generic"
)

println("System image created successfully: intro_r_sysimage.so")