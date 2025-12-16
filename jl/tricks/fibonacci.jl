function main()
    yesterday = 1
    today = 0
    tomorrow = 0

    for i in 1: 1: 10
        print("$tomorrow ")
        today = tomorrow
        tomorrow =  today + yesterday
        yesterday = today
    end

end

main()