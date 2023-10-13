#########
# DAY 6 #
#########

rm(list = ls())

Data <- read.csv("C:/Users/kacpe/Desktop/Adv_Code_2015/Day 6/Data_6.txt", header = FALSE, sep = ".")

##########
# PART 1 #
##########

fun_str <- function(text){
  
  b <- rev(strsplit(text, split = " ")[[1]])
  return(b)
}

a <- fun_str(Data[[1]][1])

c <- strsplit(a[1], split = ",")[[1]]

coords_x <- function(str){
  
  x <- c(0, 0)
  
  x[1] <- as.integer(strsplit(str[1], ",")[[1]][1]) + 1
  
  x[2] <- as.integer(strsplit(str[3], ",")[[1]][1]) + 1
  
  return(x)
}

x_coord <- coords_x(a)


coords_y <- function(str){
  
  y <- c(0, 0)
  
  y[1] <- as.integer(strsplit(str[1], ",")[[1]][2]) + 1
  
  y[2] <- as.integer(strsplit(str[3], ",")[[1]][2]) + 1
  
  return(y)
  
}

y_coord <- coords_y(a)

exec_act <- function(str, lamps){
  
  a <- fun_str(str)
  
  x_coord <- coords_x(a)
  
  y_coord <- coords_y(a)
  
  
  if(a[4] == "on"){
    
   lamps[x_coord[2]:x_coord[1], y_coord[2]:y_coord[1]] <- 1
    
  }else if(a[4] == "off"){
    
   lamps[x_coord[2]:x_coord[1], y_coord[2]:y_coord[1]] <- 0    
    
  }else{
    
    for(i in x_coord[2]:x_coord[1]){
      
      for(j in y_coord[2]:y_coord[1]){
        
       lamps[i,j] <- abs(lamps[i,j] - 1)
        
      }
    }
  }
  return(lamps)
}

M <- matrix(0, nrow = 1000, ncol = 1000)

for(n in 1:length(Data[[1]])){
 
  M <- exec_act(Data[[1]][n], M)
   
}

sum(M)

##########
# PART 2 #
##########

exec_act <- function(str, lamps){
  
  a <- fun_str(str)
  
  x_coord <- coords_x(a)
  
  y_coord <- coords_y(a)
  
  
  if(a[4] == "on"){
    
    lamps[x_coord[2]:x_coord[1], y_coord[2]:y_coord[1]] <- lamps[x_coord[2]:x_coord[1], y_coord[2]:y_coord[1]] + 1
    
  }else if(a[4] == "off"){
    
    lamps[x_coord[2]:x_coord[1], y_coord[2]:y_coord[1]] <- lamps[x_coord[2]:x_coord[1], y_coord[2]:y_coord[1]] - 1    
    
    lamps[x_coord[2]:x_coord[1], y_coord[2]:y_coord[1]] <- pmax(lamps[x_coord[2]:x_coord[1], y_coord[2]:y_coord[1]], 0)
    
  }else{
    
    lamps[x_coord[2]:x_coord[1], y_coord[2]:y_coord[1]] <- lamps[x_coord[2]:x_coord[1], y_coord[2]:y_coord[1]] + 2
    
  }
  return(lamps)
}

M <- matrix(0, nrow = 1000, ncol = 1000)

for(n in 1:length(Data[[1]])){
  
  M <- exec_act(Data[[1]][n], M)
  
}

sum(M)

