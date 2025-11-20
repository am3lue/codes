using Gtk

win = GtkWindow("Trying to make sth here")

#well there are two knigs of layout in Gtk
## 1. Box layout (This involves keeping everything into an array so anything is been added on the array stack)
## 2. Grid Layout (This involves some mapings of the elements like where exactly do you wanna the element to appear on)

# Starting with Box

hbox = GtkButtonBox(:h) # Here there is a box and we can choose in this box how we store our things  :h is for horizontal way i guess :v is for vertical :)
push!(win, hbox)

#lets define some of the elements here
cancel = GtkButton("Cancel")
ok = GtkButton("OK")

set_gtk_property!(hbox,:expand,ok,true)
set_gtk_property!(hbox,:spacing,10)

push!(hbox, cancel) # pushing the elements
push!(hbox, ok) # pushing the elements

#showing all the user 
showall(win)