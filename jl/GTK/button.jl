using Gtk

win = GtkWindow("My Trial Of The Button", 400, 200)

btn = GtkButton("Click Me") # well this shows the button to the user
push!(win,btn) # i dont know what it does but i gues it places all elements in the window

# Well you can make some functions to do things like

function onclick(w)
    println("Task Completed succesifully !")
end

signal_connect(onclick, btn, "clicked")

showall(win)
