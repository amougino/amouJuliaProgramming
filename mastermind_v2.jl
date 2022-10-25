using Gtk
using Graphics
using Random

winSize = 4
winWidth = winSize*200
winHeight = winSize*250
margin = 10
gen = 0

col = 0
row = 0

buttonList = ["Red", "Orange", "Yellow", "Green", "Blue", "Purple", "Brown", "Pink", "Delete", "Enter"]
colors = ["Red", "Orange", "Yellow", "Green", "Blue", "Purple", "Brown", "Pink"]

default = [0.75,0.75,0.75]

red = [1,0,0]
orange = [1,0.5,0]
yellow = [1,1,0.1]
green = [0,1,0]
blue = [0,0,1]
purple = [0.6,0.12,0.94]
brown = [0.6,0.3,0]
pink = [1,0.75,0.8]

currentCode = []

function generateCode()
    code = []
    while size(code)[1] <= 3
        obj = Random.rand(colors, 1)
        push!(code, obj)
    end
    return(code)
end

function onButtonClicked(button)
    println("$( get_gtk_property(button, :label, String) ) has been clicked")
    global col
    global row
    global colors
    global currentCode

    buttonName = get_gtk_property(button, :label, String)
    if buttonName in colors
        if col < 4
            c.draw = eval(Meta.parse("drawC$buttonName"))
            draw(c)
            col += 1
            push!(currentCode, buttonName)
        end
    elseif buttonName == "Delete"
        if col >= 1
            col -= 1
            c.draw = deleteC
            draw(c)
            deleteat!(currentCode, size(currentCode)[1])
        end
    elseif buttonName == "Enter"
        println(col)
        if col == 4

        end
        println(currentCode)
    end
end

function  drawCColor(widget, array)
    ctx = getgc(widget)
    rectangle(ctx, ( ( ( winWidth / 3.5 ) + ( ( winWidth / 6 ) * col ) ) + 2 ), ( ( ( winHeight / 15 ) + ( ( winHeight / 14 ) * row ) ) + 2 ), ( ( winWidth / 20 ) - 4 ), ( ( ( winHeight * ( 4 / 5 ) ) / 20 )  - 4 ) )
    set_source_rgb(ctx, array[1], array[2], array[3])
    fill(ctx)
end

function drawCRed(widget)
    drawCColor(widget, red)
end

function drawCOrange(widget)
    drawCColor(widget, orange)
end

function drawCYellow(widget)
    drawCColor(widget, yellow)
end

function drawCGreen(widget)
    drawCColor(widget, green)
end

function drawCBlue(widget)
    drawCColor(widget, blue)
end

function drawCPurple(widget)
    drawCColor(widget, purple)
end

function drawCBrown(widget)
    drawCColor(widget, brown)
end

function drawCPink(widget)
    drawCColor(widget, pink)
end

function deleteC(widget)
    ctx = getgc(widget)
    rectangle(ctx, ( ( winWidth / 3.5 ) + ( ( winWidth / 6 ) * col ) ), ( ( winHeight / 15 ) + ( ( winHeight / 14 ) * row ) ), ( winWidth / 20 ), ( ( winHeight * ( 4 / 5 ) ) / 20 ) )
    set_source_rgb(ctx, default[1], default[2], default[3])
    fill(ctx)
end

function checkCode(code,answer)
    wrongPlacement = 0
    rightPlacement = 0
    for i in 1:4
        if answer[i] == code[i]
            answer[i] = 0
            code[i] = 0
            rightPlacement += 1
        end
        
    end
    for i in 1:4, j in 1:4
        if answer[i] != 0
            if answer[i] == code[j]
                answer[i] = 0
                code[j] = 0
                wrongPlacement += 1
            end
        end
    end
    return([wrongPlacement,rightPlacement])
end

win = GtkWindow("Mastermind v1.1", winWidth, winHeight)
c = @GtkCanvas(winWidth, winHeight - ( winSize * 15 ))

bv = GtkBox(:v)
bh = GtkBox(:h)
#bt = Gtk.Button("next")

@guarded draw(c) do widget
    ctx = getgc(c)
    for line in 0:3, row in 0:11 
        rectangle(ctx, ( ( winWidth / 3.5 ) + ( ( winWidth / 6 ) * line ) ), ( ( winHeight / 15 ) + ( ( winHeight / 14 ) * row ) ), ( winWidth / 20 ), ( ( winHeight * ( 4 / 5 ) ) / 20 ) )
    end
    set_source_rgb(ctx, default[1], default[2], default[3])
    fill(ctx)
end

for i in buttonList
    b = GtkButton(i)
    signal_connect(onButtonClicked, b, "clicked")
    push!(bh, b)
end

set_gtk_property!(bh, :spacing, margin)
set_gtk_property!(bh, :margin_top, margin)
set_gtk_property!(bh, :margin_bottom, margin)
set_gtk_property!(bh, :margin_left, margin)
set_gtk_property!(bh, :margin_right, margin)

push!(bv, c)
push!(bv, bh)
push!(win, bv)

Gtk.showall(win)
global gameCode = generateCode()