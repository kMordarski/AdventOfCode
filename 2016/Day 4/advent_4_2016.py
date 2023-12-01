import numpy as np

import string

data = np.loadtxt("dane_2016_4.txt", delimiter=",", dtype=str)

def get_vars(line):

    test = line.split("-")
    str_2_to_test = ''

    for k in range(len(test)-1):
        str_2_to_test = str_2_to_test + test[k]

    char_list = list(set(str_2_to_test))

    global dictionary

    for n in range(len(char_list)):
        if n == 0:
            dictionary = {char_list[0] : str_2_to_test.count(char_list[0])}
        else:
            dictionary[char_list[n]] = str_2_to_test.count(char_list[n])

    global split

    split = test[-1].split("[")

    split[1] = split[1].replace("]", "")

    global y

    global x

    x = []

    for term in split[1]:

        if term not in char_list:
            y = False
            return
        else:
            y = True
        x.append(dictionary[term])


def fin_check(seq, spl, dict, cond):
    
    if cond == False:
        return False

    for n in range(len(seq) - 1):

        if seq[n] < max(dict.values()):
            return False
        
        if seq[n] == seq[n+1]:
            if spl[1][n] > spl[1][n+1]:
                return False
            else:
                dictionary.pop(spl[1][n])
        
        else:
            dictionary.pop(spl[1][n])

    return True

result = 0

iteration = 0

for item in data:

    iteration += 1

    get_vars(item)

    check = fin_check(x, split, dictionary, y)

    if check:
        result += int(split[0])

print(result)

# ## PART II ## #

p = np.r_[0:26]

alph_dict = dict(zip(alpha, p))

data


def get_vars(line):

    global test

    test = line.split("-")

    global split

    split = test[-1].split("[")

    split = int(split[0])

    test = test[0:(len(test)-1)]


get_vars(data[0])

test

split

list = ['a', 'b', 'c']

''.join(list)
