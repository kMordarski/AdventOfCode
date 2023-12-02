#########
# DAY 2 #
#########

file = open("data.txt")

data = file.readlines()

# 12 red, 13 green, 14 blue

#We define a function that checks the given condition:

def check(num, col):

    if col == "g" and int(num) > 13:

        return False
    
    elif col == "r" and int(num) > 12:
        
        return False
    
    elif col == "b" and int(num) > 14:
        
        return False
    
    else:
        
        return True

sum_f = 0

for j in range(len(data)):
    
    string = data[j]

    string_arr = string.split(";")

    string_arr[0] = string_arr[0].split(":")[1]

    str_arr_frag = []

    for n in range(len(string_arr)):
        str_arr_frag.append(string_arr[n].split(","))
    
    cond = True

    print(cond)

    for item in str_arr_frag:
    
        if cond == False:
            break
    
        for p in range(len(item)):

            cond = check(num = item[p].split(" ")[1], col = item[p].split(" ")[2][0])
        
            if cond == False:
                break
    
    print(cond)
    
    if cond == True:
        sum_f += (j + 1)

sum_f

###########
# PART II # 
###########

sum_f = 0

for j in range(len(data)):
    
    dict_col = {"r" : [],
                "g" : [],
                "b" : []}
        
    string = data[j]

    string_arr = string.split(";")

    string_arr[0] = string_arr[0].split(":")[1]

    str_arr_frag = []

    for n in range(len(string_arr)):
        str_arr_frag.append(string_arr[n].split(","))

    for item in str_arr_frag:
    
        for p in range(len(item)):

            dict_col[item[p].split(" ")[2][0]].append(int(item[p].split(" ")[1]))        
    
    sum_f += max(dict_col["r"]) * max(dict_col["g"]) * max(dict_col["b"])
    
sum_f
