# day 5 Advent of Code 2022

######################## PART I ##############################

a = open("Day5_data.txt")

b = readlines(a)

b1 = b[1:9]
b2 = b[11:length(b)]

b1[2]

P1 = []

for i in 1:9
    
    j = b1[10-i][2]
    push!(P1, j)
end

deleteat!(P1, findall(x->x== ' ', P))

P1

P2 = []

for i in 1:9
    j = b1[10-i][6]
    push!(P2, j)
end

deleteat!(P2, findall(x->x== ' ', P2))

P3 = []

for i in 1:9
    j = b1[10-i][10]
    push!(P3, j)
end

deleteat!(P3, findall(x->x== ' ', P3))

P4 = []

for i in 1:9
    j = b1[10-i][14]
    push!(P4, j)
end

deleteat!(P4, findall(x->x== ' ', P3))
