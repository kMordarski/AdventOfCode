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

def find_numbers_1(string):
    
    list_numb = ['one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine']
             
    numbers = ['1', '2', '3', '4', '5', '6', '7', '8', '9']

    dict_temp = zip(list_numb, numbers)

    dict_numb = dict(dict_temp)

    check_numb = list_numb + numbers

    numbers_ocurr = []

    s = 0

    first_dig = 0
    
    last_dig = 0

    start = False

    end = False

    for n in range(len(string)):
        
        for item in check_numb:
        
            if first_dig == 0 and item in string[0:(n+1)]:
                
                first_dig = item
                
                start = True
            
            if last_dig == 0 and item in string[(len(string) - (n+1)):len(string)]:
                
                last_dig = item
                
                end = True
        
        if start and end:
            break        
    
    numbers_ocurr.append(first_dig)
    numbers_ocurr.append(last_dig)
    
    for p in range(len(numbers_ocurr)):

        if numbers_ocurr[p] in dict_numb.keys():
            numbers_ocurr[p] = dict_numb[numbers_ocurr[p]]    
    
    if len(numbers_ocurr) == 0:
        
        print("There is no number in this line!")
        return 0
    
    else:
        number_to_ret = int(numbers_ocurr[0] + numbers_ocurr[1])
    
        return number_to_ret
    
find_numbers_1(data[0])
find_numbers("oneight")

sum_fin = 0

for x in range(len(data)):
    print(x)
    sum_fin += find_numbers_1(data[x])

sum_fin