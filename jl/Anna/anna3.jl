# simple addition calculator 

    println("Please Enter number 1: ")
    num1 = parse(Int32, readline()) # well hii in read users value alafu ina iconvert to numbers
    println("Please Enter number 2: ")
    num2 = parse(Int32, readline())

    print("Please Enter the sign(+ - x /): ")
    sy = readline()

    if sy == "+"
        print("Ans is: ", (num1+num2))
    elseif sy == "-"
        print("Ans is: ", num1-num2)
    end