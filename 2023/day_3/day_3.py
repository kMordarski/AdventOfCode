#########
# Day 3 #
#########

import numpy as np

data = np.loadtxt("data.txt", dtype = str, comments=None)

##########
# PART I #
##########


def SplitFunc(string):
    spl = string.split(".")
    numbers = []
     
    for item in spl:
        if len(item) > 1 or item.isdigit():
            numbers.append(item) 
            
    return numbers


def AddFirst(numbers_arr):

    
    def TwoNumbers(string):
    
        for n in range(len(string)):
            if not string[n].isdigit():
                return int(string.split(string[n])[0]) + int(string.split(string[n])[1])


    sum_part = 0

    w  = numbers_arr.copy()
    
    for item in numbers_arr:
        
        if not item.isdigit():
            if item[1:].isdigit():
                sum_part += int(item[1:])
            elif item[:-1].isdigit():
                sum_part += int(item[:-1])
            else:
                sum_part += TwoNumbers(item)
            
            w.remove(item)
            
    return [sum_part, w]


def Coords(string, arr_el):

    beg = string.find(arr_el)
    end = beg + len(arr_el)
    
    if beg == 0:
        coord_beg = beg
        coord_end = end + 1
    
    elif end == (len(string) - 1):
        coord_beg = beg - 1
        coord_end = end
    else:
        coord_beg = beg - 1
        coord_end = end + 1
    
    coords_ret = [coord_beg, coord_end]
        
    return coords_ret


def FinSum(data):
    
    sum_fin = 0
    
    for n in range(len(data)):
    
        numbers = SplitFunc(data[n])

        small_arr = AddFirst(numbers)
        
        sum_fin += small_arr[0]
    
        numbers = small_arr[1]
    
        shift = 0
        
        if 0 < n < len(data) - 1:
            
           for item in numbers:
            
                ran = Coords(data[n][shift:], item)
            
                for character in data[n + 1][(ran[0] + shift):(ran[1] + shift)] + data[n - 1][(ran[0] + shift):(ran[1] + shift)]:
                    
                    if not character.isdigit() and character != ".":
                    
                        sum_fin += int(item)
                        break
                    
                shift = shift + ran[1] - 1

        elif n == 0:
        
            for item in numbers:
            
                ran = Coords(data[n][shift:], item)
            
                for character in data[n + 1][(ran[0] + shift):(ran[1] + shift)]:
                
                    if not character.isdigit() and character != ".":
                    
                        sum_fin += int(item)
                        break
                
                shift = shift + ran[1] - 1
                

        else:
        
            for item in numbers:
            
                ran = Coords(data[n][shift:], item)
            
                for character in data[n - 1][(ran[0] + shift):(ran[1] + shift)]:
                
                    if not character.isdigit() and character != ".":
                    
                        sum_fin += int(item)
                        break
                shift = shift + ran[1] - 1
        
    return sum_fin


bluh = FinSum(data)

###########
# PART II #
###########

