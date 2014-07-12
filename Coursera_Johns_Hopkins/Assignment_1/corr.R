corr <- function(directory, threshold = 0) {
    
    data <- c()
    
    completeCases <- complete(directory)
    
    for (i in 1:dim(completeCases)[1]) {
        if (completeCases[i,2]>threshold) {
            nameFile <- paste(directory,"/",formatC(completeCases[i,1], width = 3, format = "d", flag = "0"),".csv",sep="") 
            temp <- read.csv(nameFile)[,2:3]
            #             tempNAFree <- temp[(!is.na(temp[,1]))*(!is.na(temp[,2]))==1,]
            #             data <- c(data,cor(tempNAFree[,1],tempNAFree[,2]))
            data <- c(data,round(cor(temp[,1],temp[,2],use="na.or.complete"),4))
        }
    }
    
    return(data)
    
    ## 'threshold' is a numeric vector of length 1 indicating the
    ## number of completely observed observations (on all
    ## variables) required to compute the correlation between
    ## nitrate and sulfate; the default is 0
    
    ## Return a numeric vector of correlations
}