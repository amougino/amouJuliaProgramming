using Gtk

win = GtkWindow("window !", 400, 200)

grid = GtkGrid()

function on_button_clicked(w)
    println("The button has been clicked")
    Gtk.destroy(win)
end

signal_connect(on_button_clicked, b, "clicked")

showall(win)