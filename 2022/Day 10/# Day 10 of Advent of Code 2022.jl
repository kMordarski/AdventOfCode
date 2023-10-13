# Day 10 of Advent of Code 2022 

################################## PART I ############################

a = open("Day10_data.txt")

b = readlines(a)

b1 = []

for ln in b
    bc = split(ln, " ")
    push!(b1, bc)
end

cycle_c = 0

reg_c = 1

strength_c = 0

function cycle()
    global cycle_c = cycle_c + 1
    if mod((cycle_c + 20), 40) == 0 & cycle_c <= 220
       global strength_c = strength_c + (cycle_c * reg_c) 
    end
end

function reg(I)
    global reg_c = reg_c + I
end

function action(input)
    if input[1][1] == 'n'
        cycle()
    else
        cycle()
        cycle()
        reg(parse(Int, input[2]))
    end
end

for ln in b1
    action(ln)
end

strength_c

################################## PART II ############################

cycle_c = 1

reg_c = 2

Vec = Matrix{String}(undef, 6,40)

fill!(Vec, ".")

function draw(V, P) #V is a place to draw (in this instance matrix)
    V[P[1], P[2]] = "#"
end

function Position_cyc()
    y = Int(floor(cycle_c / 40) + 1)
    x = Int(cycle_c - (y-1) * 40)
    pos = [[x, y]]
    return pos
end

function Position_reg()
    y = Int(floor(reg_c / 40) + 1)
    x = Int(reg_c - (y-1) * 40)
    if x == 1
        pos = [[x,y], [x+1, y]]
    elseif x == 40
        pos = [[x-1, y], [x, y]]
    else
        pos = [[x-1, y], [x, y], [x+1, y]]
    end
    return pos
end

function cycle()
    if Position_cyc() in Position_reg()
        draw(Vec, Position_cyc())
    end

    global cycle_c = cycle_c + 1
end

for ln in b1
    action(ln)
end
Position_cyc()[1] in Position_reg()[1]
[1,1] in [[1,1]]
unique(Vec)

reshape(Vec, 6, 40)

print(Vec)

draw(Vec, [1,1])