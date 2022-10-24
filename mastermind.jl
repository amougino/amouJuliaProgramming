using Gtk
using Graphics

winSize = 4 #Changeable
winWidth = winSize * 200
height = winSize * 250
sideSpacing = 10

buttonList = ["Red", "Orange", "Yellow", "Green", "Blue", "Purple", "Brown", "Pink", "Delete", "Enter"]
buttonList = [" Red  ", "Orange", "Yellow", "Green ", " Blue ", "Purple", "Brown ", " Pink ", "Delete", "Enter "]

#=function onButtonClicked(button)

    println("$( get_gtk_property(button, :label, String) ) has been clicked")

    if get_gtk_property(button, :label, String) == "Red"

        @guarded draw(c) do widget
            ctx = getgc(c)
            rectangle(ctx, ( ( width / 3.5 ) + ( ( width / 6 ) * col ) ), ( ( height / 15 ) + ( ( height / 14 ) * row ) ), ( width / 20 ), ( ( height * ( 4 / 5 ) ) / 20 ) )
            set_source_rgb(ctx, 1, 0, 0)
            fill(ctx)
        end

    end
end=#

win = GtkWindow("Mastermind v1.2", winWidth, height)
c = @GtkCanvas()
bv = GtkBox(:v)
bh = GtkBox(:h)

@guarded draw(c) do widget
    ctx = getgc(c)
    for col in 0:3, row in 0:11 
        rectangle(ctx, ( ( width / 3.5 ) + ( ( width / 6 ) * col ) ), ( ( height / 15 ) + ( ( height / 14 ) * row ) ), ( width / 20 ), ( ( height * ( 4 / 5 ) ) / 20 ) )
    end
    set_source_rgb(ctx, 0.75, 0.75, 0.75)
    fill(ctx)
end

#=for i in buttonList
    b = GtkButton(i)
    signal_connect(onButtonClicked, b, "clicked")
    push!(bh, b)
end=#

set_gtk_property!(bh, :spacing, sideSpacing)
set_gtk_property!(bh, :margin_top, sideSpacing)
set_gtk_property!(bh, :margin_bottom, sideSpacing)
set_gtk_property!(bh, :margin_left, sideSpacing)
set_gtk_property!(bh, :margin_right, sideSpacing)

#push!(bv, c)
#push!(bv, bh)
#push!(win, bv)
#println(win)
draw(c)
push!(bv, c)
push!(win, bv)
showall(win)
