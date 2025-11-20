usng Gtk

#well ts time to set some proprties on the gtk
win = GtkWindow("The time for properties of the window", 200, 200)

set_gtk_property!(win, :title, "Well Trial")

# to get the propertis just 
###   get_gtk_properties(win, :title, String)

# well checking the visibility by the user of the window
 ### vsible(win, true) or false =)
 