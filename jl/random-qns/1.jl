function simpleInterest(amount::Float32, rate::Float32, time::Float32)
    return amount * time * rate
end

function totalAmount(amount, rate, time)
    return simpleInterest(amount,rate,time) + amount
end

function main()
    print("Enter the Principal amount: ")
    amount = parse(Float32, readline())

    print("Enter The Rate Of Interest(Annualy): ")
    rate = parse(Float32, readline()) / 100

    print("Enter The Time(in Years): ")
    time = parse(Float32, readline())

    SI = simpleInterest(amount, rate, time)
    TA = totalAmount(amount, rate, time)

    print("""
            \n\n---------------------- THE GENERAL REPORT ---------------------
            Expected Simple interest is: $SI Tsh,
            Expected Total Amount is: $TA
    """)

end

main()