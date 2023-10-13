#########
# DAY 3 #
#########

rm(list = ls())

Data <- read.csv("C:/Users/kacpe/Desktop/Adv_Code_2015/Day 3/Data_3.txt", header = FALSE)

##########
# PART 1 #
##########

move <- function(text, coord){
  
  if(text == "<"){
    coord[1] <- coord[1] - 1 
  }else if(text == ">"){
    coord[1] <- coord[1] + 1
  }else if(text == "^"){
    coord[2] <- coord[2] + 1
  }else if(text == "v"){
    coord[2] <- coord[2] - 1
  }
  return(coord)
}

coords_list <- list()

sequence_moves <- strsplit(Data[[1]], split = "")

cord <- c(0,0)

coords_list[[1]] <- cord

for(k in 1:length(sequence_moves[[1]])){
  
  coords_list[[k+1]] <- move(text = sequence_moves[[1]][k], coord = tail(coords_list, n = 1)[[1]])
  
}


length(unique(coords_list))

##########
# PART 2 #
##########

coords_list_santa <- list()

coords_list_santa[[1]] <- cord

coords_list_robo <- list()

coords_list_robo[[1]] <- cord

for(k in 1:length(sequence_moves[[1]])){
  
  mod <- k%%2
  
  if(mod == 1){
    
    coords_list_santa[[floor(k/2) + 2]] <- move(text = sequence_moves[[1]][k], coord = tail(coords_list_santa, n = 1)[[1]])
  
  }else{
    
    coords_list_robo[[floor(k/2) + 1]] <- move(text = sequence_moves[[1]][k], coord = tail(coords_list_robo, n = 1)[[1]])
  
  }
}

final_coords <- c(coords_list_robo, coords_list_santa)

length(unique(final_coords))
