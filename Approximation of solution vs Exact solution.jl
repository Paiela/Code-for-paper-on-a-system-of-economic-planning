using Plots
using LinearAlgebra

function plan(A,G,C0,B,D0,r,n,iterations)
    Cn = ((I+G)^n)C0 #Capacity at t_n
    Dn = (1+r)^n D0
    Inv_l = BGCn
    R = (1+r)^n - 1 
    Inv_s = BRD0
    X = inv(I-A)(D0+Inv_s+Inv_l)
    global X_approx = D0+Inv_s+Inv_l
    for i in 1:iterations
        X_approx = X_approx + A^i (D0+Inv_s+Inv_l)
    end
    return X, X_approx
end

#The computation time and memory allocated are recorded based on the algorithm above.

Exact_Sol = zeros(10,50)
Approximate_n50 = zeros(10,50)

d = 10
    A = rand(0:0.01:1,(d,d)) #A matrix
    B = rand(0:0.01:1,(d,d)) #B matrix
    for b in 1:d
        A[b,:] .= A[b,:] ./ (sum(A[b,:]))
        A[b,:] .= A[b,:].0.9
        B[b,:] .= B[b,:] ./ (sum(B[b,:]))
        B[b,:] .= B[b,:].0.9
    end

r = 0.05 #maximum change rate of demand (absolute)

for t in 1:50
    if t == 1
        global D = rand(0:0.01:100,d) #Initial demand
    end
    D = D.+Drand(-r:0.001:r) # Current Demand
    C_current = D + rand(0.1:0.01:10,d)
    C_estimate_future = D(1+r) + rand(0.1:0.01:10,d)
    g = C_estimate_future./C_current .- 1 #G vector form
    G = diagm(g) #G diag matrix form
    X, X_approx = plan(A,G,C_current,B,D,r,1,50)
    Exact_Sol[:,t] = X
    Approximate_n50[:,t] = X_approx
end

#Deviation Computation
A = (abs.(Approximate_n50[:,:].-Exact_Sol[:,:]))./Exact_Sol
Δ = []
for i in 1:50
    push!(Δ,100*maximum(A[:,i]))
end
plot(Δ)
