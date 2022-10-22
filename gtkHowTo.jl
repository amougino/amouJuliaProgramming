using Gtk

win = GtkWindow("window !", 400, 200)

b = GtkButton("close window!!")
push!(win,b)

function on_button_clicked(w)
    println("The button has been clicked")
    Gtk.destroy(win)
end

signal_connect(on_button_clicked, b, "clicked")

showall(win)