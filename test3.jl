using Gtk
using Cairo

global drawInt = 0

function draw_c(widget)
    ctx = getgc(c)
    for col in 0:3, row in 0:11 
        rectangle(ctx, ( ( width / 3.5 ) + ( ( width / 6 ) * col ) ), ( ( height / 15 ) + ( ( height / 14 ) * row ) ), ( width / 20 ), ( ( height * ( 4 / 5 ) ) / 20 ) )
    end
    set_source_rgb(ctx, 0.75, 0.75, 0.75)
    fill(ctx)   
end

winSize = 4 #Changeable
width = winSize * 200
height = winSize * 250
sideSpacing = 10

win = GtkWindow("Mastermind v1.2", width, height)
global c = @GtkCanvas()
bv = GtkBox(:v)
bh = GtkBox(:h)
push!(bv, c)
push!(bv, bh)
push!(win, bv)

@guarded draw(c) do widget
    ctx = getgc(c)
    for col in 0:3, row in 0:11 
        rectangle(ctx, ( ( width / 3.5 ) + ( ( width / 6 ) * col ) ), ( ( height / 15 ) + ( ( height / 14 ) * row ) ), ( width / 20 ), ( ( height * ( 4 / 5 ) ) / 20 ) )
    end
    set_source_rgb(ctx, 0.75, 0.75, 0.75)
    fill(ctx)
end

function on_button_clicked(w)
   println("The button has been clicked and replot")
   ctx = Gtk.getgc(c)
   draw(c)
   println(drawInt)

end

#signal_connect(on_button_clicked, bt, "clicked")
c.draw = draw_c
showall(win)

sleep(3)
println("$(drawInt)")