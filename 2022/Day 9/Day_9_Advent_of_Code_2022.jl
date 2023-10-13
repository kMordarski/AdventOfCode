# Day 9 Advent of Code 2022

##################### PART I ######################

a = open("Day9_data.txt")

b = readlines(a)

split(b[1], " ")[2]

D = []
A = []

for i in 1:length(b)
    push!(D, split(b[i], " ")[1])
    push!(A, parse(Int64, split(b[i], " ")[2]))
end


H_pos_t = [[0,0]]
T_pos_t = [[0,0]]

function Distance(A, B) # A and B are vectors indicating the position of H and T
    d = maximum(broadcast(abs, A - B))
    if d > 1
        return true
    else
        return false
    end
end

function Move_T(h_pos_t, t_pos_t) # move = DS[1]

    #Horizontal move
    if (h_pos_t[2] - t_pos_t[2]) > 0
        h = 1
    elseif (h_pos_t[2] - t_pos_t[2]) == 0
        h = 0
    else
        h = -1
    end
    #Vertical move
    if (h_pos_t[1] - t_pos_t[1]) > 0
        v = 1
    elseif (h_pos_t[1] - t_pos_t[1]) == 0
        v = 0
    else
        v = -1
    end
    move = [v, h]
    return move
end

function Move_H(dir)
    if dir == "D" 
        move_h = [0, -1]
    elseif dir == "U"
        move_h = [0, 1]
    elseif dir == "L"
        move_h = [-1, 0]
    else 
        move_h = [1, 0]
    end
    return move_h
end

for i in 1:length(D)
    for j in 1:A[i]
        
        new_pos_h = H_pos_t[end] + Move_H(D[i])
        push!(H_pos_t, new_pos_h)
        
        if Distance(H_pos_t[end], T_pos_t[end])
            new_pos_t = T_pos_t[end] + Move_T(H_pos_t[end], T_pos_t[end])
            push!(T_pos_t, new_pos_t)
        end
    end


end

unique(T_pos_t)

##################### PART II ######################

H_pos_H = [[0,0]]
H_pos_1 = [[0,0]]
H_pos_2 = [[0,0]]
H_pos_3 = [[0,0]]
H_pos_4 = [[0,0]]
H_pos_5 = [[0,0]]
H_pos_6 = [[0,0]]
H_pos_7 = [[0,0]]
H_pos_8 = [[0,0]]
H_pos_9 = [[0,0]]


Distance(H_pos_H[end], H_pos_1[end])

for i in 1:length(D)
    for j in 1:A[i]

        new_pos_h = H_pos_H[end] + Move_H(D[i])
        push!(H_pos_H, new_pos_h)

        if Distance(H_pos_H[end], H_pos_1[end])
            new_pos_t = H_pos_1[end] + Move_T(H_pos_H[end], H_pos_1[end])
            push!(H_pos_1, new_pos_t)
        end

        if Distance(H_pos_1[end], H_pos_2[end])
            new_pos_t = H_pos_2[end] + Move_T(H_pos_1[end], H_pos_2[end])
            push!(H_pos_2, new_pos_t)
        end

        if Distance(H_pos_2[end], H_pos_3[end])
            new_pos_t = H_pos_3[end] + Move_T(H_pos_2[end], H_pos_3[end])
            push!(H_pos_3, new_pos_t)
        end


        if Distance(H_pos_3[end], H_pos_4[end])
            new_pos_t = H_pos_4[end] + Move_T(H_pos_3[end], H_pos_4[end])
            push!(H_pos_4, new_pos_t)
        end

        if Distance(H_pos_4[end], H_pos_5[end])
            new_pos_t = H_pos_5[end] + Move_T(H_pos_4[end], H_pos_5[end])
            push!(H_pos_5, new_pos_t)
        end

        if Distance(H_pos_5[end], H_pos_6[end])
            new_pos_t = H_pos_6[end] + Move_T(H_pos_5[end], H_pos_6[end])
            push!(H_pos_6, new_pos_t)
        end

        if Distance(H_pos_6[end], H_pos_7[end])
            new_pos_t = H_pos_7[end] + Move_T(H_pos_6[end], H_pos_7[end])
            push!(H_pos_7, new_pos_t)
        end

        if Distance(H_pos_7[end], H_pos_8[end])
            new_pos_t = H_pos_8[end] + Move_T(H_pos_7[end], H_pos_8[end])
            push!(H_pos_8, new_pos_t)
        end

        if Distance(H_pos_8[end], H_pos_9[end])
            new_pos_t = H_pos_9[end] + Move_T(H_pos_8[end], H_pos_9[end])
            push!(H_pos_9, new_pos_t)
        end


    end


end

unique(H_pos_9)