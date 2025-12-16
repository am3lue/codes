function main()

    a::Int = 0
    b::Int = 0
    sum::Int = 0

    print("Enter Two numbers: ")
    a = parse(Int, readline())
    b = parse(Int, readline())

    sum = a + b

    print("The sum is: $sum")

end

main()