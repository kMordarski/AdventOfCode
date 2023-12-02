# ##### #
# DAY 1 #
# ##### #

import numpy as np

data = np.loadtxt("data.txt", dtype = str)

##########
# PART I #
##########

def Check_If_Number(string):
    
    temp_digits = [-1,-1]
    
    for char in string:
        if char.isdigit():
            temp_digits[0] = char
            break
            
    for char in string[::-1]:
        if char.isdigit():
            temp_digits[1] = char
            break
        
    
        
    return temp_digits

def Return_Number(string):
    
    two_dig = Check_If_Number(string)
    
    return int(two_dig[0] + two_dig[1])
    
sum_fin = 0

for line in data:
    sum_fin += Return_Number(line)
    
sum_fin

###########
# PART II #
###########

def find_numbers(string):
    
    list_numb = ['one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine']
             
    numbers = ['1', '2', '3', '4', '5', '6', '7', '8', '9']

    dict_temp = zip(list_numb, numbers)

    dict_numb = dict(dict_temp)

    check_numb = list_numb + numbers

    numbers_ocurr = []

    s = 0

    for n in range(len(string)):
        
        for item in check_numb:
        
            if item in string[s:(n+1)]:
                numbers_ocurr.append(item)
                s = n + 1
                break
            
    for p in range(len(numbers_ocurr)):

        if numbers_ocurr[p] in dict_numb.keys():
            numbers_ocurr[p] = dict_numb[numbers_ocurr[p]]    
    
    number_to_ret = int(numbers_ocurr[0] + numbers_ocurr[-1])
    
    return number_to_ret

find_numbers(data[-1])

sum_fin = 0

arr_to_sum = np.arange(len(data))

for x in range(len(data)):
    arr_to_sum[x] = find_numbers(data[x])

arr_to_sum.sum()

for x in range(len(data)):
    sum_fin = sum_fin + find_numbers(data[x])

sum_fin
