path = "data.txt"

data = readlines(path)

# for i in data
#     println(i)
# end

println("Sort the data please:
1. names
2. Age
3. grades
")


function nam(data::Vector{String})
    # Split each line and make a 2-D matrix (all String)
    matrix = permutedims(hcat([split(strip(l), " :: ") for l in data]...))

    # Print nicely
    for row in eachrow(matrix)
        println(join(row, "  |  "))
    end

    return matrix
end


# input = readline()
nam(data)