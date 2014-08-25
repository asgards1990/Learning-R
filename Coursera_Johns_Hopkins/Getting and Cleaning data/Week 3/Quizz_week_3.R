#setwd("C:/Users/sya/Desktop/Learning-R/Coursera_Johns_Hopkins/Getting and Cleaning data/Week 3")
#setwd("C:/Users/corpus/Desktop/Learning-R/Coursera_Johns_Hopkins/Getting and cleaning data/Week 3")

#Q1
url1 = "http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(url1,dest="./dataQuestion1.csv")
dataQ1 <- read.csv("./dataQuestion1.csv")
agricultureLogical <- (dataQ1$ACR==3&dataQ1$AGS==6)
which(agricultureLogical)

#Q2
#install.packages("jpeg")
library(jpeg)
imageQ2 <- readJPEG("getdata-jeff.jpg",TRUE)
Q2 <- quantile(imageQ2,na.rm=T, probs=c(0.3,0.8))

#Q3
url3_1 = "http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
url3_2 = "http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
download.file(url3_1,dest="./dataQuestion3_1.csv",)
download.file(url3_2,dest="./dataQuestion3_2.csv")
dataQ3_1 <- read.csv("./dataQuestion3_1.csv",skip=3)
dataQ3_2 <- read.csv("./dataQuestion3_2.csv")
dataQ3_1Trimmed <- dataQ3_1[!is.na(as.numeric(as.character(
    dataQ3_1$Ranking))),]
matchingData <- match(dataQ3_2$CountryCode,dataQ3_1Trimmed$X)
Q3 <- sum(!is.na(unique(matchingData)))

#Q4
highOECD <- dataQ3_2[dataQ3_2[,"Income.Group"]=="High income: OECD",
                     "CountryCode"]
highNonOECD <- dataQ3_2[dataQ3_2[,"Income.Group"]=="High income: nonOECD",
                        "CountryCode"]
averageHighOECD <- mean(as.numeric(as.character(dataQ3_1[
    match(highOECD,dataQ3_1$X),"Ranking"])),na.rm=T)
averageHighNonOECD <- mean(as.numeric(as.character(dataQ3_1[
    match(highNonOECD,dataQ3_1$X),"Ranking"])),na.rm=T)

#Q5
lowerMiddleIncome <- dataQ3_2[dataQ3_2[,"Income.Group"]==
                                  "Lower middle income","CountryCode"]
rankingQ5 <- as.numeric(as.character(dataQ3_1[
    match(lowerMiddleIncome,dataQ3_1$X),"Ranking"]))
dataQ5 <- rankingQ5[rankingQ5<=38]
answerQ5 <- sum(!is.na(dataQ5))
quantileGroup <- quantile(ranking,na.rm=T, probs=seq(0,1,length=6))