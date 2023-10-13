#########
# DAY 1 #
#########

rm(list = ls())

### Import data from text file ###

b <- strsplit(Data$V1, split = "")

level <- 0

for(i in 1:length(b[[1]])){
  
  if(b[[1]][i] == "("){
    
    level <- level + 1
    
  }else{
    
    level <- level - 1
    
  }
  
  if(level < 0){
    
    print(i)
    
    break
    
  }
  
}

