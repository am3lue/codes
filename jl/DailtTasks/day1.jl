#=

### Julia "Question of the Day" – Intermediate Level  
**Date:** December 7, 2025

#### Problem: "Fast Unique Rows"

You are given a large matrix `A` of size `m × n` where `m` can be in the millions and `n` is small (typically ≤ 15). The rows contain integer data (e.g., `Int64` or `UInt64`). You need to find all unique rows and return them in the order of their first appearance in `A`.

Write a fast, allocation-efficient function:

```julia
unique_rows_first(A::Matrix{T}) where {T<:Integer} -> Matrix{T}
```

Requirements & hints:
- The naive `unique(A, dims=1)` works but is too slow and allocates a lot for huge `m`.
- You are allowed to use a `Dict` or `Set`, but think carefully about what you use as the key.
- Using the whole row tuple as a key (e.g., `Dict{Tuple{Vararg{T}}, Int}`) creates many allocations.
- There is a zero-allocation way for small `n` using hashing tricks or bit-packing.
- Bonus: make it generic for any `T<:Integer` and any small `n`.

Example:
```julia
A = [1 2 3
     4 5 6
     1 2 3
     7 8 9
     4 5 6]

unique_rows_first(A)
# Expected output:
# 4×3 Matrix{Int64}:
#  1  2  3
#  4  5  6
#  7  8  9
```

#### Difficulty notes
- Intermediate → you should know views, hashing, `size(A,2)`, `eachrow`, and `Dict`.
- Advanced bonus → zero-alloc solution using `ntuple` + `Tuple` hashing or manual row hashing with `hash` + `SeenSet` pattern.

#### Time goal (on a 2024+ machine)
- `m = 5_000_000`, `n = 10` random `Int32` rows with ~10% duplicates → under 600 ms and < 500 MiB allocation.

Post your solution below when you're ready, and I'll give feedback and show the fastest known versions! Happy Juliang! 🚀

=#

function unique_rows_first(A::Matrix{T})
    a::Vector{T} = join(eachrow(A))
    unique(a)
    values::Vector{T} = []

    for i in a
        value = parse(Int, split(i, " ")[1])
        push!(values, value)
    end

   return values
end
