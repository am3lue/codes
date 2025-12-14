function palindrome(i)::Bool
    state::Bool = false
    if join(reverse(split(i))) == i
        status == true
    end
    return state
end

print("Please Enter the number to check if it Palindome: ")

if palindrome(readline())
    printstyled("Its Palindome! ", color = :blue)
else
    printstyled("Its not Palindome! ", color = :red)
endq