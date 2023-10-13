
import numpy as np

data = np.loadtxt("C:/Users/kacpe/Desktop/Sorbonka/Python/Ćwiczonka/dane_2016_2.txt", delimiter=",", dtype=str)

def move(dir, curr):
    if dir == "L":

        if curr[1] != -1:
            curr[1] -= 1 

    elif dir == "R":
        
        if curr[1] != 1:
            curr[1] += 1
    
    elif dir == "U":

        if curr[0] != 1:
            curr[0] += 1

    elif dir == "D":

        if curr[0] != -1:
            curr[0] -= 1

    return curr

def translate(word_list, numbers, pos):

    for word in word_list:
        for letter in word:
            pos = move(letter, pos)
        
        numbers.append(pos.copy())
        pos = [0,0]
    


    return numbers

code = []

pointer = [0,0]

result = translate(data, code, pointer)


############# PART II ###############


limits_up = [[-2,0], [-1,1], [0,2], [1,1], [2,0]]
limits_down = [[-2,0], [-1,-1], [0,-2], [1,-1], [2,0]]
limits_left = [[-2,0], [-1,1], [0,2], [-1,-1], [0,-2]]
limits_right = [[2,0], [1,1], [0,2], [1,-1], [0,-2]]

[-2,0] not in limits_right

def move(dir, curr):
    if dir == "L":

        if curr not in limits_left:
            curr[0] -= 1 

    elif dir == "R":
        
        if curr not in limits_right:
            curr[0] += 1
    
    elif dir == "U":

        if curr not in limits_up:
            curr[1] += 1

    elif dir == "D":

        if curr not in limits_down:
            curr[1] -= 1

    return curr

code = []

pointer = [-2,0]

result = translate(data, code, pointer)