# Day 1 Advent of Code 2022

################################################ PART I #######################################################
@time begin

function transform(V, e) # v is a vector, e is an element we want to get rid off

    for i in 1:length(V)
        if V[i] == e
            V[i] = 0
        else
            V[i] = parse(Int64, V[i])
        end
    end 

end

function summ(V, S)  # V is a vector of inputs with elements of type Int,
                    # S is an empty vector, which will store our outputs
    s = 0
    for i in 1:length(V)
        
        if V[i] != 0
            s = s + V[i]    
        else
            push!(S, s)
            s = 0 
        end    
    end
    push!(S,s)
end

counter = 0
open("Day1_data.txt") do file

    for ln in eachline(file)
        println(ln)
        global counter = counter + 1
    end

end
counter

seq = []

open("Day1_data.txt") do file

    for ln in eachline(file)
        l = ln
        push!(seq, l)
    end

end

transform(seq, "")

sum_1 = []

summ(seq, sum_1)

findmax(sum_1)[2]

#GG EZ

################################################ PART II ######################################################

function TopThree(V) # Where V is a vector of inputs obtained in the previous part
    s = 0
    for i in 1:3
        a = findmax(V)
        s = s + a[1]
        deleteat!(V, a[2])
    end
    return s
end 

TopThreeSum = TopThree(sum_1)

# GG EZ

end