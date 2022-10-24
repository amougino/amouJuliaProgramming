using Gtk
using Graphics

global winWidth = 800
global winHeight = 1000
global drawInt = 0
global red = 0

function draw_c(widget)
    ctx = Gtk.getgc(widget)

    global drawInt
    drawInt += 1
    global red
    red += 0.1

    ctx = getgc(c)
    for col in 0:3, row in 0:11 
        global winWidth
        global height
        rectangle(ctx, ( ( winWidth / 3.5 ) + ( ( winWidth / 6 ) * col ) ), ( ( winHeight / 15 ) + ( ( winHeight / 14 ) * row ) ), ( winWidth / 20 ), ( ( winHeight * ( 4 / 5 ) ) / 20 ) )
    end
    set_source_rgb(ctx, red, 0.75, 0.75)
    fill(ctx) 
   
end

win = Gtk.Window("Mastermind v1.3") |> (bv = Gtk.Box(:v))
bh = Gtk.Box(:h)

c = Gtk.Canvas(winWidth, winHeight)
push!(bv, c)
bt = Gtk.Button("ok")
push!(bh, bt)
push!(bv, bh)

function on_button_clicked(w)
   println("The button has been clicked and replot")
   ctx = Gtk.getgc(c)
   draw(c)
   println(drawInt)

end

signal_connect(on_button_clicked, bt, "clicked")
c.draw = draw_c
Gtk.showall(win)

sleep(3)
println("$(drawInt)")