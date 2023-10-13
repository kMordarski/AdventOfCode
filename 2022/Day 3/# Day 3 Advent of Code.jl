# Day 3 Advent of Code 2022

###################################### PART I ####################################
#@time begin
    
Cap = string.(Char.('A'[1]:'Z'[1]))
low = string.(Char.("a"[1]:"z"[1]))

alph = vcat(low, Cap)

function Eval(a) # a is the letter we want to know the prioritazation of
    x = findfirst(item -> item == a, alph)
    return x
end

a = open("Day3_data.txt")

b = readlines(a)
H1 = []
H2 = []

function transform(A, h1, h2)

    for i in 1:length(A)
        l = Int(length(A[i])/2)
        C1 = A[i][1:l]
        C2 = A[i][(l+1):(2*l)]
        push!(h1, C1)
        push!(h2, C2)
    end
end

transform(b, H1, H2)

function Check(h1, h2)
    ev_fin = 0 
    for i in 1:length(h1)
        ev_fin = ev_fin + Eval(String(intersect(h1[i], h2[i])))
    end
    return ev_fin
end

fin_ans = Check(H1, H2)

###################################### PART II ###################################
intersect(b[1], b[2], b[3])

function Check_II(B)
    miu = Int(length(B)/3)
    fin = 0
    for i in 1:miu
        fin = fin + Eval(String(intersect(B[3*i], B[(3*i-1)], B[(3*i-2)])))
    end
    return fin
end

fin_ans_II = Check_II(b)
#end