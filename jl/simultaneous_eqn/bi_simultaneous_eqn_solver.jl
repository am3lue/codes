function simultaneous_solver(a,b,c,x,y,z)
    det = (a * y) - (b * x)

    # for determinant x values
     det_x = (c * y) - (z * x)

    #for determinant value of y
     det_y = (a * c) - (b * z)

    # for the x value
    p = det_x / det 

    #for the y value
    q = det_y / det 

    # The return value
    return p , q

end

printstyled("Hey there WElcome to the simultaneous_solver\n", color = :green)
println("Please Enter the First eqn like x + y = z \n")

x = parse(Int64, readline())
y = parse(Int64, readline())
z = parse(Int64, readline())

println("\n\n\nPlease Enter the values of the second eqn")

a = parse(Int64, readline())
b = parse(Int64, readline())
c = parse(Int64, readline())

printstyled("Please wait while we are calculating ....\n", color = :green)

x,y = simultaneous_solver(x,y,z,a,b,c) # this line takes the values of x and y from the solver function

println("well  Of y = $x and y = $y\n\n")
