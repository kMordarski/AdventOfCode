
import numpy as np

data = np.loadtxt("C:/Users/kacpe/Desktop/Sorbonka/Python/Ćwiczonka/dane_2016_1.txt", delimiter=",", dtype=str)

print(data)

def orientation(curr, rot):
    if curr == "North":
        if rot == "L":
            curr = "West"
        elif rot == "R":
            curr = "East"
    elif curr == "East":
        if rot == "L":
            curr = "North"
        elif rot == "R":
            curr = "South"
    elif curr == "West":
        if rot == "L":
            curr = "South"
        elif rot == "R":
            curr = "North"
    elif curr == "South":
        if rot == "L":
            curr = "East"
        elif rot == "R":
            curr = "West"

    return curr

def moveorient(step, now, ori):
    if ori=="North":
        now[0] = now[0] + step
    elif ori=="South":
        now[0] = now[0] - step
    elif ori=="West":
        now[1]= now[1] - step
    elif ori=="East":
        now[1]=now[1] + step

    return now


def twowords(word):
    W=[0,0]

    if word[0] == " ":
        W[0]=word[1]
        W[1]=word[2:len(word)]
    else:
        W[0]=word[0]
        W[1]=word[1:len(word)]

    return W

start = "North"

pos = [0,0]

for item in data:
    a = twowords(item)
    start = orientation(curr = start, rot = a[0])
    pos =  moveorient(step = int(a[1]), now = pos, ori = start)

print(pos)

############### PART II ################

def moveorient(step, now, ori, store):

    for i in range(step):
        
        if ori=="North":
            now[0] = now[0] + 1
        elif ori=="South":
            now[0] = now[0] - 1
        elif ori=="West":
            now[1]= now[1] - 1
        elif ori=="East":
            now[1]=now[1] + 1
        
        if now in store:
            print(now)
            global cond
            cond = True
            return
    
        store.append(now.copy())

    

    return now

list_pos = [[0,0]]

start = "North"

pos = [0,0]

cond = False

for item in data:
    a = twowords(item)
    start = orientation(curr = start, rot = a[0])
    pos =  moveorient(step = int(a[1]), now = pos, ori = start, store = list_pos)
    if cond == True:
        break
