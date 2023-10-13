#########
# DAY 5 #
#########

rm(list = ls())

Data <- read.csv("C:/Users/kacpe/Desktop/Adv_Code_2015/Day 5/Data_5.txt", header = FALSE)

##########
# PART 1 #
##########

false_check <- function(text){
  
  forb <- c("ab", "cd", "pq", "xy")
  
  for(k in 1:4){
    
    if(grepl(forb[k], text)){
      
      return(TRUE)
      break
    }
    
  }
  return(FALSE)
}

dup_check <- function(text){
 
  word_spl <- strsplit(text, "")
  
  vec_letters <- c(1:length(unique(word_spl[[1]])))

  vec_letters_uni <- unique(word_spl[[1]])
  
  for(i in 1:length(vec_letters_uni)){
    
    vec_letters[i] <- paste(vec_letters_uni[i], vec_letters_uni[i], sep = "")
    
  }
  
  for(k in 1:length(vec_letters)){
    
    if(grepl(vec_letters[k], text)){
      
      return(TRUE)
      break    
    }
    
  }
  
  FALSE
}

vow_check <- function(text){
  
  vow <- c("a", "e", "i", "o", "u")
  
  word_spl <- strsplit(text, split = "")
  
  x <- 0
  
  for(i in 1:length(word_spl[[1]])){
    
    if(word_spl[[1]][i] %in% vow){
      
      x <- x + 1
      
    }
    
  }

  if(x >= 3){
    
    return(TRUE)
  
  }else{
    
    return(FALSE)
  
  }
}

z <- 0

for(j in 1:length(Data[[1]])){
  
  dup <- dup_check(Data[[1]][j])
  
  vow <- vow_check(Data[[1]][j])
  
  faux <- false_check(Data[[1]][j])

  if(dup & vow & !faux){
    z <- z + 1
  }
}

##########
# PART 2 #
##########

gap_check <- function(text){
  
  word_split <- strsplit(text, split = "")
  
  for(k in 1:(length(word_split[[1]])-2)){
    
     if(word_split[[1]][k] == word_split[[1]][k+2]){
       
       return(TRUE)
       break
     }
    
  }
  FALSE
}


a <- gap_check(Data[[1]][4])


pair_check <- function(text){
  
  word_spl <- strsplit(text, split = "")
  
  v <- c()
  
  for(i in 1:(length(word_spl[[1]])-1)){
    
    v[i] <- paste(word_spl[[1]][i], word_spl[[1]][i+1], sep = "")
    
  }
  
  for(k in 1:(length(v)-2)){
    
    for(l in (k+2):length(v)){
      
      if(v[k] == v[l]){
        
        return(TRUE)
        break
      }
      
    }
    
  }
  FALSE
}

x <- 0

for(p in 1:length(Data[[1]])){
  
  gap <- gap_check(Data[[1]][p])
  
  pair <- pair_check(Data[[1]][p])
  
  if(gap & pair){
    
    x <- x + 1
    
  }
}

