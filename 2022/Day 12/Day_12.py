##########
# PART I #
##########

import numpy as np
import pandas as pd 

data_1 = pd.read_csv('Data_12.txt', delimiter = ' ', header=None)

data_1 = data_1[0]

len(data_1[0])

data_m = ''

for item in data_1:
    data_m = data_m + item

data_r = [char for char in data_m]

data_matrix = np.reshape(data_r, (41, 172))

end_pos = [np.where(data_matrix =="E")[0][0],np.where(data_matrix =="E")[1][0]]

start_pos = [np.where(data_matrix =="S")[0][0],np.where(data_matrix =="S")[1][0]]

end_pos_uni = len(data_1[0]) * end_pos[0] + end_pos[1]

start_pos_uni = len(data_1[0]) * start_pos[0] + start_pos[1]

adj_matrix = np.zeros((len(data_r), len(data_r)))

##### tranforming matrix with data into adjecency matrix #####

def letter_to_number(letter):
    return ord(letter.lower()) - ord('a') + 1

def check_adjecency(mat_d, mat_a, pos_c, pos_r):


data_matrix_numbers = data_matrix.copy()

data_matrix_numbers = np.vectorize(letter_to_number)(data_matrix_numbers)

data_matrix_numbers[end_pos[0], end_pos[1]] = int(letter_to_number('z'))

data_matrix_numbers[start_pos[0], start_pos[1]] = int(letter_to_number('a'))

for k in range(len(data_1[0])):

    for j in range(len(data_1)):

