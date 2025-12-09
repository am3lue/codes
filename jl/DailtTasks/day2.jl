#=


### Julia "Question of the Day" – Intermediate Level  
**Date:** December 9, 2025

#### Problem: "In-Place Cumulative Maximum (Forward & Reverse)"

Write two fast in-place functions:

```julia
cumax!(v::AbstractVector{T}) where {T<:Real}        # forward cumulative max
cumax_rev!(v::AbstractVector{T}) where {T<:Real}    # reverse cumulative max
```

- `cumax!(v)` transforms `v` so that `v[i] = max(v[1], v[2], ..., v[i])`
- `cumax_rev!(v)` transforms `v` so that `v[i] = max(v[i], v[i+1], ..., v[end])`

Requirements:
- Must modify the vector **in-place** (no extra vector-sized allocations)
- Must be **O(n)** time and **O(1)** extra space
- Must be type-stable and work for any `AbstractVector{<:Real}` (including `Float64`, `Int32`, `BigFloat`, etc.)
- Should beat `cumsum`-style built-ins in speed when benchmarked

Example:
```julia
a = [3, 1, 4, 1, 5, 9, 2, 2, 6]
cumax!(a)
a  # → [3, 3, 4, 4, 5, 9, 9, 9]

b = [3, 1, 4, 1, 5, 9, 2, 6]
cumax_rev!(b)
b  # → [9, 9, 9, 9, 9, 9, 6, 6]
```

Bonus (very common in real code):
Write a single function that computes the **range maximum** for each position:
```julia
range_max!(v::AbstractVector{T}) where {T<:Real}
# after call: v[i] = maximum over all elements (global max)
```
…then combine `cumax!` and `cumax_rev!` with `min.` to get the maximum in any subrange in O(1) after O(n) prep).

Performance target:
On a `Vector{Float64}` of length 100_000_000, each function should run in **under 120 ms** with **< 50 MB** total allocation on a typical 2024–2025 machine.

Hint: One tiny loop, one variable — that’s all you need.

Go go go! Drop your cleanest, fastest version below. Best solution gets featured tomorrow!

=#

function cumax(v::AbstractVector)
    #thins is thefunction that converts the from the begining and make it in ascending oder
    target = 0
    for i in 1: 1: length(v)
        if(v[i] < target)
            v[i] = target
        else
            target = v[i]
        end
    end
    
    return v
end

function cumax_rev(v::AbstractVector)
    # the the one for the reverse thigyy

    target = 0
    for i in length(v) : -1: 1
        if (v[i] < target)
            v[i] = target
        else
            target = v[i]
        end
    end
    
    return v
end

function main()
    a = [3, 1, 4, 1, 5, 9, 2, 2, 6]

    println(cumax(a))
    println(cumax_rev(a))
end

main()