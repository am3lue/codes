function sum(num::Int)::Int
    total = 0
    times = check(num)
    while num > 0
        total += (num % 10) ^ times
        num = div(num,10)
    end
    return total
end

function check(num::Int)::Int
    i::Int = 0
    while num > 0
        i += 1
        num = div(num,10)
    end
    return i
end 

function Armstrong(num::Int)::Bool
    return sum(num) == num
end

println("Please Enter A number \nTocheck if Its armstrong Number")

if Armstrong(parse(Int, readline()))
    printstyled("\nIts Armstrong", color = :green)
else 
    printstyled("\nNot Armstrong!", color = :red)
end