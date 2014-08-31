#setwd("C:/Users/corpus/Desktop/Learning-R/Coursera_Johns_Hopkins/Getting and cleaning data/Week 4")

#Q1
url1 = "http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv "
download.file(url1,dest="./dataQuestion1.csv")
dataQ1 <- read.csv("./dataQuestion1.csv")
namesQ1 <- names(dataQ1)
namesSplitQ1 <- strsplit(namesQ1,"wgtp")
Q1 <- namesSplitQ1[123]

#Q2
url2= "http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
download.file(url2,dest="./dataQuestion2.csv",)
dataQ2<- read.csv("./dataQuestion2.csv",skip=3)
dataRankedQ2 <- dataQ2[2:191,"US.dollars."]
dataRankedQ2 <- as.numeric(gsub(",", "", dataRankedQ2))
mean(dataRankedQ2)

#Q3 is using data from Q2
Q3 <- length(grep("^United",dataQ2$Economy))


#Q4 is using partially data from Q2
url4 ="https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
download.file(url4,dest="./dataQuestion4.csv",)
dataQ4<- read.csv("./dataQuestion4.csv")
matchingRankedDataQ4 <-  match(dataQ2[2:191,"X"],dataQ4$CountryCode)
specialNotesMatchedDataQ4 <- dataQ4[matchingRankedDataQ4,"Special.Notes"]
valuesQ4 <- grep(".*Fiscal year end: June.*",specialNotesMatchedDataQ4,value = TRUE)
Q4 <- length(valuesQ4)

#Q5
#install.packages(quantmod)
library(quantmod)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn) 
index2012 <- format(sampleTimes,"%Y")==2012
howMany2012 <- sum(index2012)
howManyMondays2012 <- sum(weekdays(sampleTimes[index2012])=="lundi")