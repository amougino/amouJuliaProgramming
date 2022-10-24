using Gtk
using Graphics
using Random

winSize = 4
winWidth = winSize*200
winHeight = winSize*250
margin = 10
gen = 0

global col = 0
global row = 0

buttonList = ["Red","Orange","Yellow","Green","Blue","Purple","Brown","Pink","Delete","Enter"]
colors = 

function generateCode()
    
end

function onButtonClicked(button)
    println("$(get_gtk_property(button,:label,String)) has been clicked")
    c.draw = drawC
    draw(c)
    global col
    global row
    col += 1
    if col > 3
        col = 0
        row += 1
    end
end

function drawC(widget)
    ctx = getgc(widget)
    rectangle(ctx, ( ( winWidth / 3.5 ) + ( ( winWidth / 6 ) * col ) ), ( ( winHeight / 15 ) + ( ( winHeight / 14 ) * row ) ), ( winWidth / 20 ), ( ( winHeight * ( 4 / 5 ) ) / 20 ) )
    set_source_rgb(ctx, 1, 0.75, 0.75)
    fill(ctx)
end

win = GtkWindow("Mastermind v1.1",winWidth,winHeight)
c = @GtkCanvas(winWidth, winHeight - ( winSize * 15 ))

bv = GtkBox(:v)
bh = GtkBox(:h)
#bt = Gtk.Button("next")

@guarded draw(c) do widget
    ctx = getgc(c)
    for line in 0:3, row in 0:11 
        rectangle(ctx, ((winWidth/3.5) + ((winWidth/6)*line)), ((winHeight/15) + ((winHeight/14)*row)), (winWidth/20), ((winHeight*(4/5))/20))
    end
    set_source_rgb(ctx, 0.75, 0.75, 0.75)
    fill(ctx)
end

for i in buttonList
    b = GtkButton(i)
    signal_connect(onButtonClicked,b,"clicked")
    push!(bh,b)
end

set_gtk_property!(bh, :spacing, margin)
set_gtk_property!(bh, :margin_top, margin)
set_gtk_property!(bh, :margin_bottom, margin)
set_gtk_property!(bh, :margin_left, margin)
set_gtk_property!(bh, :margin_right, margin)

push!(bv,c)
#push!(bh, bt)
push!(bv,bh)
push!(win,bv)



#signal_connect(onButtonClicked, bt, "clicked")
Gtk.showall(win)