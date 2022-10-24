using Gtk
using Cairo

global drawInt = 0
global red = 0

function draw_c(widget)
   ctx = Gtk.getgc(widget)

   global drawInt
   drawInt += 1
   
   rectangle(ctx, drawInt*50, 0, 20, 20)
   global red
   red += 0.1
   set_source_rgb(ctx, red, 0, 0)
   fill(ctx)   
   
end

win = Gtk.Window("Gtk") |> (bx = Gtk.Box(:v))
canvas = Gtk.Canvas(600, 450)
push!(bx, canvas)
bt = Gtk.Button("ok")
push!(bx, bt)

function on_button_clicked(w)
   println("The button has been clicked and replot")
   ctx = Gtk.getgc(canvas)
   draw(canvas)
   println(drawInt)

end

signal_connect(on_button_clicked, bt, "clicked")
canvas.draw = draw_c
Gtk.showall(win)

sleep(3)
println("$(drawInt)")