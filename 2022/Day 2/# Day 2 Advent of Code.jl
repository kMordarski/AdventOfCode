# Day 2 Advent of Code

###################################### PART I ####################################
@time begin

a = open("Day2_data.txt")

b = readlines(a)

function transform(A) # Input is a string variable
    
    for i in 1:length(A)

        as = collect(A[i])
        if as[1] == 'A'
            as[1] = 'X'
        elseif as[1] == 'B'
            as[1] = 'Y'
        else
            as[1] = 'Z'
        end
        out = join(as)
        A[i] = out
    end
end

transform(b)


points = []

function game(C, B)

    for i in 1:length(C)

        x = 0

        p1 = collect(C[i])[1]
        p2 = collect(C[i])[3]

        if p2 == 'X'
            x = x + 1
            if p1 == 'X'
                x = x + 3
            elseif p1 == 'Y'
                x = x
            else 
                x = x + 6
            end
        elseif  p2 == 'Y'
            x = x + 2
            if p1 == 'X'
                x = x + 6
            elseif p1 == 'Y'
                x = x + 3
            else
                x = x
            end
        else
            x = x + 3
            if p1 == 'X'
                x = x
            elseif p1 == 'Y'
                x = x + 6
            else 
                x = x + 3
            end
        end
        push!(B, x)
    end
end

game(b, points)

sum(points)

############################################## PART II ###################################################


function transform_2(A) # Input is a string variable
    
    for i in 1:length(A)

        as = collect(A[i])
        if as[3] == 'X'
            
            if as[1] == 'X'
                as[3] = 'Z'
            elseif as[1] == 'Y'
                as[3] = 'X'
            else
                as[3] = 'Y'
            end

        elseif as[3] == 'Y'
            as[3] = as[1]
        else
           
            if as[1] == 'X'
                as[3] = 'Y'
            elseif as[1] == 'Y'
                as[3] = 'Z'
            else
                as[3] = 'X'
            end
        
        end
        out = join(as)
        A[i] = out
    end
end


transform_2(b)

points_2 = []

game(b, points_2)

sum(points_2)

end