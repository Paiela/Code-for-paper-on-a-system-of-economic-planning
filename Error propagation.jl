using Plots
using LinearAlgebra

function valuesmethod1(A,l,n)
    v = l
    for i in 1:n
        v = l + A*v
    end
    return v
end


function valuesmethod2(A,l)
    return inv(I-A)*l
end


d = 2000 #matrix size
A = rand(0:0.01:1,(d,d))
    for b in 1:d
        A[b,:] .= A[b,:] ./ (sum(A[b,:]))
        A[b,:] .= A[b,:].*0.9
    end
l = rand(1:1000,d)

E = []
T1 = []
T2 = []
for n in 1:100
    push!(T1,@elapsed valuesmethod1(A,l,n))
    push!(T2,@elapsed valuesmethod2(A,l))
    push!(E,maximum((valuesmethod2(A,l).-
    valuesmethod1(A,l,n))./valuesmethod2(A,l)))
end
