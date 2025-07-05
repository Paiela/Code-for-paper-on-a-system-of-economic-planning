Dynamic Leontief Planning System (Julia)

This repository contains a Julia implementation of a dynamic economic planning model based on the Leontief input-output framework. It simulates investment planning and production allocation using matrix-based methods and Neumann series approximations, as described in the paper:

> *On a System for Economic Planning by the Dynamic Leontief Model*  
> Shivam Mahajan, Arjunveer Singh, Giovanni Paiela (2025)

 Overview

This code estimates economic output under dynamic demand conditions using:

- Input-output matrix `A`
- Capital coefficients matrix `B`
- Growth matrix `G` (derived from changing demand)
- Final demand vector `D`
- Neumann series for inverse approximation
- Error measurement between exact and approximate production plans

 Dependencies

- Julia v1.8 or later
- [Plots.jl](https://github.com/JuliaPlots/Plots.jl)
- [LinearAlgebra](https://docs.julialang.org/en/v1/stdlib/LinearAlgebra/)

Install required packages with:

julia
using Pkg
Pkg.add(["Plots", "LinearAlgebra"])
