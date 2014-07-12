pollutantmean <- function(directory, pollutant, id = 1:332) {
    
    data <- c()
    
    for (i in seq_along(id)) {
        nameFile <- paste(directory,"/",formatC(id[i], width = 3, format = "d", flag = "0"),".csv",sep="") 
        temp <- read.csv(nameFile)[,pollutant]
        data <- c(data,temp[!is.na(temp)])
    }
    
    return(round(mean(data),digits=3))
    
}