using Random

colors = ["Red", "Orange", "Yellow", "Green", "Blue", "Purple", "Brown", "Pink"]

function checkCode(code,answer)
    wrongPlacement = 0
    rightPlacement = 0
    for i in 1:4
        if answer[i] == code[i]
            answer[i] = "0"
            code[i] = "0"
            rightPlacement += 1
        end
        #println(answer[i],code[i],rightPlacement,wrongPlacement)
    end
    for i in 1:4, j in 1:4
        if answer[i] != "0"
            if answer[i] == code[j]
                answer[i] = "0"
                code[j] = "0"
                wrongPlacement += 1
            end
        end
        #println(answer[i],code[j],rightPlacement,wrongPlacement)
    end
    return([wrongPlacement,rightPlacement])
end

function generateCode()
    code = []
    while size(code)[1] <= 3
        obj = Random.rand(colors, 1)
        #println(obj[1])
        push!(code, string(obj[1]))
    end
    return(code)
end

a = generateCode()
println(a)
println(checkCode(["Orange","Red","Yellow","Green"],a))