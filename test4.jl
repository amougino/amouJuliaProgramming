using Gtk
using Graphics

winSize = 4
global winWidth = winSize * 200
global winHeight = winSize * 250
margin = 10

generated = false

global red = 0
global green = 0.75
global blue = 0.75

global rectangleX = 0
global rectangleY = 0
global rectangleXSize = winWidth / 20
global rectangleYSize = ( winHeight * ( 4 / 5 ) ) / 20

buttonList = ["Red","Orange","Yellow","Green","Blue","Purple","Brown","Pink","Delete","Enter"]

function draw_c(widget)

    ctx = getgc(widget)
    for line in 0:3, row in 0:11 
        rectangle(ctx, ((winWidth/3.5) + ((winWidth/6)*line)), ((winHeight/15) + ((winHeight/14)*row)), (winWidth/20), ((winHeight*(4/5))/20))
    end
    global red
    red += 0.1
    set_source_rgb(ctx, red, 0.75, 0.75)
    fill(ctx)
end

win = GtkWindow("Mastermind v1.2", winWidth, winHeight)
c = @GtkCanvas(winWidth, winHeight)
bv = GtkBox(:v)
bh = GtkBox(:h)
bt = Gtk.Button("ok")

push!(bv, c)
push!(bh, bt)
push!(bv, bh)
push!(win, bv)

set_gtk_property!(bh, :spacing, margin)
set_gtk_property!(bh, :margin_top, margin)
set_gtk_property!(bh, :margin_bottom, margin)
set_gtk_property!(bh, :margin_left, margin)
set_gtk_property!(bh, :margin_right, margin)

function onButtonClicked(w)
    println("The button has been clicked and replot")
    draw(c)
    c.draw = draw_c
    draw(c)
end

#=for i in buttonList
    b = GtkButton(i)
    signal_connect(onButtonClicked, b, "clicked")
    push!(bh, b)
end=#

signal_connect(onButtonClicked, bt, "clicked")
c.draw = draw_c
Gtk.showall(win)