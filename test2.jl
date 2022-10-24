using Gtk
using Graphics

winSize = 4 #Changeable
global width = winSize*200
global height = winSize*250
sideSpacing = 10

buttonList = ["Red","Orange","Yellow","Green","Blue","Purple","Brown","Pink","Delete","Enter"]
#buttonList = [" Red  ","Orange","Yellow","Green "," Blue ","Purple","Brown "," Pink ","Delete","Enter "]

function init(size,wid,hei,buttons,margin)
    global win = GtkWindow("Mastermind v1.1",wid,hei)
    global c = @GtkCanvas(wid,hei-(size*15))
    global bv = GtkBox(:v)
    global bh = GtkBox(:h)

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
    if get_gtk_property(button,:label,String) == "Red"
        ctx = getgc(c)
        for line in 0:3, row in 0:11 
            rectangle(ctx, ((width/3.5) + ((width/6)*line)), ((height/15) + ((height/14)*row)), (width/20), ((height*(4/5))/20))
        end
        set_source_rgb(ctx, 0.1, 0.75, 0.75)
        fill(ctx)
        #draw(c)
        #global bv = GtkBox(:v)
        #global bh = GtkBox(:h)
        #
        #push!(bv,c)
        #push!(bv,bh)
        #push!(win,bv)
        #showall(win)
    end
end

init(winSize,width,height,buttonList,sideSpacing)