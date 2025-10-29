# wanna compare where am mostly confotable in

#well now am thaking the file path from the user

#= ==========================================

well this is the part of all the global items needed in the System

========================================== =#
println("Please Enter the path to student.txt file: ")
global path = readline()
while !ispath(path)
    print("Please Enter A coreect path: ")
    global path = readline()
end



#= ================================================

We ned this part too, Holds everything needed for the project
all the actions are saved here

================================================= =#
function st_add(st_name, st_age, st_grade)
    old_data = read(path, String)
    open(path, "w") do file
        write(file,old_data* "\n" * "$st_name :: $st_age :: $st_grade") #merges the old data wid the new
    end

    print("Well Student $st_name Is Aded To the Database")
end

function st_view()
    print("well all the students are as follows\n============================>\n")
    data = read(path, String)
    for i in data
        printstyled(i, color= :green) # this itterate from the data and finally prints out everything
    end
    println("<========================================")
end

function st_search(target)
    data = st_load()
    i = 0
    for line in eachrow(data)
        i += 1
        if (lowercase(target) in lowercase.(line))
            printstyled("\nName  :: Age :: Grade\n", color = :yellow)
            printstyled(join(line, " :: "), color = :green)
        end
    end
    println("\nWell the student is found any thing else?\n")
end

function st_save()
    print("Well the doc is well saved")
end

function st_load()
    data = readlines(path)
    return permutedims(hcat([split(strip(l), " :: ") for l in data]...))
end

function st_exit()
    print("Lets End Here For Today Folk! 👋🏻👋🏻")
    exit()
end

function check()
    print("would You like to change ur file path(Y/N): ")
    ans = readline()

    if (lowercase(ans) == "y")
        println("Please Enter Path: ")
        global path = readline()

        while !ispath(path)
            printstyled("Please Enter A coreect path: ", color = :red)
        end
    else
        printstyled("Choice saved!\n\n", color = :green)
    end

end


#= ============================================

well the hard part is gone so this is where we keep everything togethor

=#
menu = """
      1. Add new students (Add)
      2. View all students (view)
      3. Search for a student by name (search)
      4. Exit safely (exit)
"""                                         #well the above menu is displayed for the user


function main()
    print("\nWelcome in folk \n")
    println(menu)
    print("Pease Make a choice: ")
    choice = readline()

    if choice == "1" || lowercase(choice) == "add"
        printstyled("Well i need the following details of the student (Name), (Age), and (Grade)\n", color = :green)
        print("Starting with Name:") 
        st_name = readline()
        print("Then Age: ")
        st_age = readline()
        print("Lastly Grade: ")
        st_grade = readline()

        st_add(st_name, st_age, st_grade)
    end

    if choice == "2" || lowercase(choice) == "view"
        st_view()
    end

    if choice == "3" || lowercase(choice) == "Search"
        print("Whom Are You Lookin For? Huh!: ")
        target = readline()
        st_search(target)
    end

    if choice == "4" || lowercase(choice) == "exit"
        st_exit()
    end

    check() # checks if the user needs to change the dir of the file
end


while(true)
    main()
end