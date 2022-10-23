using Gtk
using Graphics

winSize = 4 #Changeable
width = winSize*200
height = winSize*250
sideSpacing = 10

buttonList = ["Red","Orange","Yellow","Green","Blue","Purple","Brown","Pink","Delete","Enter"]
#buttonList = [" Red  ","Orange","Yellow","Green "," Blue ","Purple","Brown "," Pink ","Delete","Enter "]

function init(size,wid,hei,buttons,margin)
    win = GtkWindow("Mastermind v1.1",wid,hei)
    c = @GtkCanvas(wid,hei-(size*15))
    bv = GtkBox(:v)
    bh = GtkBox(:h)

    @guarded draw(c) do widget
        ctx = getgc(c)
        for line in 0:3, row in 0:11 
            rectangle(ctx, ((wid/3.5) + ((wid/6)*line)), ((hei/15) + ((hei/14)*row)), (wid/20), ((hei*(4/5))/20))
        end
        set_source_rgb(ctx, 0.75, 0.75, 0.75)
        fill(ctx)
    end

    for i in buttons
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
    push!(bv,bh)
    push!(win,bv)

    showall(win)
end

function onButtonClicked(button)
    println("$(get_gtk_property(button,:label,String)) has been clicked")
end

init(winSize,width,height,buttonList,sideSpacing)