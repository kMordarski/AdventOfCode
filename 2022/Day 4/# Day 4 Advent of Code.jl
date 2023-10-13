# Day 4 Advent of Code 
######################## PART I ############################

a = open("Day4_data.txt")

b = readlines(a)

c = []

for n in 1:length(b)
    C = split(b[n], ",")
    push!(c, C)
end
d = []
for n in 1:length(c)
    C1 = split(c[n][1], "-")
    C2 = split(c[n][2], "-")
    D = [[parse(Int, C1[1]) : parse(Int, C1[2])], [parse(Int, C2[1]) : parse(Int, C2[2])]]
    push!(d, D)
end

answ = 0

for k in 1:length(d)

    x = length(d[k][1][1])
    y = length(d[k][2][1])
    z = length(union(d[k][1][1], d[k][2][1]))

    if z == x || z == y
        answ = answ + 1
    end
end

################################## PART II ##########################

answ_2 = 0

for l in 1:length(d)
    u = length(intersect(d[l][1][1], d[l][2][1]))
    if u != 0
        answ_2 = answ_2 +1
    end
end

answ_2