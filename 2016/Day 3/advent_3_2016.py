import numpy as np

data = np.loadtxt("C:/Users/kacpe/Desktop/Python_Advent_2016/dane_2016_3.txt", delimiter=",", dtype=str)

data_fin = []

for i in range(len(data)):
    a = data[i][2:5]
    b = data[i][7:10]
    c = data[i][12:15]

    for n in range(2):
        a = a.replace(' ', '')
        b = b.replace(' ', '')
        c = c.replace(' ', '')

    element = [int(a), int(b), int(c)]
    data_fin.append(element.copy())

number_triag = 0

for item in data_fin:

    if item[0] + item[1] > item[2] and item[0] + item[2] > item[1] and item[1] + item[2] > item[0] :
        number_triag += 1

print(number_triag)

############ PART II ############

number_triag = 0

for j in range(int(len(data_fin)/3)):
    for n in range(3):
        a = data_fin[j*3][n] + data_fin[j*3 + 1][n] > data_fin[j*3 + 2][n] 
        b = data_fin[j*3 + 1][n] + data_fin[j*3 + 2][n] > data_fin[j*3][n]
        c = data_fin[j*3][n] + data_fin[j*3 + 2][n] > data_fin[j*3 + 1][n]
        if  a and b and c:
            number_triag += 1

number_triag