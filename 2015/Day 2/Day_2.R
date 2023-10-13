#########
# DAY 2 #
#########

rm(list = ls())

Data <- read.csv("C:/Users/kacpe/Desktop/Adv_Code_2015/Day 2/Data_2.txt", header = FALSE)

##########
# PART 1 #
##########

count_area <- function(text){

  text_cut <- strsplit(text, split = "x")
    
  v <- as.numeric(text_cut[[1]])
  
  area_walls <- c(v[1] * v[2], v[1] * v[3], v[2] * v[3])

  area_total <- (sum(area_walls) * 2) + min(area_walls)
  
  return(area_total)
}

x <- 0

for(i in 1:length(Data[[1]])){

  x <- x + count_area(Data[[1]][i])
    
}

print(x)

##########
# PART 2 #
##########

ribb_amount <- function(text){
  
  text_cut <- strsplit(text, split = "x")
  
  v <- as.numeric(text_cut[[1]])
  
  v <- sort(v)
  
  amount <- 2*(v[1] + v[2]) + v[1] * v[2] * v[3]
  
  return(amount)
}

y <- 0

for(i in 1:length(Data[[1]])){
  
  y <- y + ribb_amount(Data[[1]][i])
  
}

print(y)

