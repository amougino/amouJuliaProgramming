using Gtk, Graphics

function on_red_clicked(w)
    println("The red button has been clicked")
  end

size = 4 #Changeable
width = size*200
height = size*250
sideSpacing = 10

c = @GtkCanvas(width,height-(size*15))
bv = GtkBox(:v)
bh = GtkBox(:h)

win = GtkWindow("Mastermind v1.0",width,height)

@guarded draw(c) do widget
    ctx = getgc(c)
    for line in 0:3, row in 0:11 
        rectangle(ctx, ((width/3.5) + ((width/6)*line)), ((height/15) + ((height/14)*row)), (width/20), ((height*(4/5))/20))
    end
    set_source_rgb(ctx, 0.75, 0.75, 0.75)
    fill(ctx)
end

push!(bh,GtkButton("Red"))
push!(bh,GtkButton("Orange"))
push!(bh,GtkButton("Yellow"))
push!(bh,GtkButton("Green"))
push!(bh,GtkButton("Blue"))
push!(bh,GtkButton("Purple"))
push!(bh,GtkButton("Brown"))
push!(bh,GtkButton("Pink"))
push!(bh,GtkButton("Delete"))
push!(bh,GtkButton("Enter"))

set_gtk_property!(bh, :spacing, sideSpacing)

set_gtk_property!(bh, :margin_top, sideSpacing)
set_gtk_property!(bh, :margin_bottom, sideSpacing)
set_gtk_property!(bh, :margin_left, sideSpacing)
set_gtk_property!(bh, :margin_right, sideSpacing)

push!(bv,c)

push!(bv,bh)

push!(win,bv)

#=set_gtk_property!(g, :column_homogeneous, true)
set_gtk_property!(g, :row_homogeneous, true)
set_gtk_property!(g, :column_spacing, sideSpacing)
set_gtk_property!(g, :row_spacing, sideSpacing)
set_gtk_property!(g, :margin_top, sideSpacing)
set_gtk_property!(g, :margin_bottom, sideSpacing)
set_gtk_property!(g, :margin_left, sideSpacing)
set_gtk_property!(g, :margin_right, sideSpacing)=#

#signal_connect(on_red_clicked, g[0,1], "clicked")
#push!(win,c)
showall(win)