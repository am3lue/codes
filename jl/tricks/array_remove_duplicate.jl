function main(input)
    output = []
    k = 0
    for i in input
        if !(i in output)
            push!(output, i)
        end
    end

    return output
end


for i in main([1,2,3,1,2,3,1,4])
    print("$i ")
end

