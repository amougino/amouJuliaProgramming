#= This is how you write a comment that can stretch several lines 

This is my personalized guide into Julia =#

# To execute a file in Julia, go to the Julia REPL (Read–eval–print loop) and type include("path")

# Importing

using Random

# Making variables

a = true
b = "num1"
c = 3
d = 2.4

for i in 0:48:400
    println("$i, $a, $b, $c, $d")
end

println(b)
b = "num2"
println(b)