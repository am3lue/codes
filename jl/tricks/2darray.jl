function main()


    arr = [
        [1,2,3],
        [4,5,6],
        [7,8,9]
    ]

    for i in eachrow(arr)
        for j in i
            print(j)
        end
        println()
    end
end

main()