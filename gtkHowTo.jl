using Gtk

width = 1600
height = 800
win = GtkWindow("Don't press 11",width,height)
sideSpacing = 6
grid = GtkGrid()

#Positionnement des boutons dans la grille 5x6
nb=1
for line in 0:11, row in 0:3
    grid[row,line] = GtkLabel("$nb")
    println("($row,$line) = $nb")
    global nb += 1
end

set_gtk_property!(grid, :column_homogeneous, true)
set_gtk_property!(grid, :row_homogeneous, true)
set_gtk_property!(grid, :column_spacing, sideSpacing)
set_gtk_property!(grid, :row_spacing, sideSpacing)
set_gtk_property!(grid, :margin_top, sideSpacing)
set_gtk_property!(grid, :margin_bottom, sideSpacing)
set_gtk_property!(grid, :margin_left, sideSpacing)
set_gtk_property!(grid, :margin_right, sideSpacing)

function on_button_clicked(w)
    println("The button has been clicked")
    Gtk.destroy(win)
end
label = GtkLabel("My text")
GAccessor.markup(label,"""<b>My bold text</b>\n
                          <a href=\"http://www.gtk.org\"
                          title=\"Our website\">GTK+ website</a>""")
signal_connect(on_button_clicked, grid[2,2], "clicked")
push!(win, grid)
showall(win)