using Gtk

win = GtkWindow("A new window")
g = GtkGrid()
a = GtkEntry()  # a widget for entering text
set_gtk_property!(a, :text, "This is Gtk!")
b = GtkCheckButton("Check me!")

# Now let's place these graphical elements into the Grid:
g[1,1] = a    # Cartesian coordinates, g[x,y]
g[2,1] = b
set_gtk_property!(g, :column_homogeneous, true)
set_gtk_property!(g, :column_spacing, 20)  # introduce a 15-pixel gap between columns

set_gtk_property!(g, :margin_top, 20)
set_gtk_property!(g, :margin_bottom, 20)
set_gtk_property!(g, :margin_left, 20)
set_gtk_property!(g, :margin_right, 20)

push!(win, g)
showall(win)