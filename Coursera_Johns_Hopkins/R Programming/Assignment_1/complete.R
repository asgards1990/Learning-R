complete <- function(directory, id = 1:332) {
  

    data <- data.frame(id=id,nobs=rep(0,length(id)))
    
    for (i in seq_along(id)) {
        nameFile <- paste(directory,"/",formatC(id[i], width = 3, format = "d", flag = "0"),".csv",sep="") 
        temp <- read.csv(nameFile)[,2:3]
        
        data[i,2] <- dim(temp[(!is.na(temp[,1]))*(!is.na(temp[,2]))==1,])[1]
    }
    
    return(data)
    
}