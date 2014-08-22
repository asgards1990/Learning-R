setwd("C:/Users/sya/Desktop/Learning-R/Coursera_Johns_Hopkins/Getting and Cleaning data/Week 3")

#Q1
url1 = "http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(url1,dest="./dataQuestion1.csv")
dataQ1 <- read.csv("./dataQuestion1.csv")
agricultureLogical <- (dataQ1$ACR==3&dataQ1$AGS==6)
which(agricultureLogical)

#Q2
imageQ2 <- readJPEG("getdata-jeff.jpg",TRUE)
Q2 <- quantile(imageQ2,na.rm=T, probs=c(0.3,0.8))

#Q3
url3_1 = "http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
url3_2 = "http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
download.file(url3_1,dest="./dataQuestion3_1.csv",)
download.file(url3_2,dest="./dataQuestion3_2.csv")
dataQ3_1 <- read.csv("./dataQuestion3_1.csv",skip=3)
#retrived the ranked state

dataQ3_2 <- read.csv("./dataQuestion3_2.csv")
match(dataQ3_1$X,dataQ3_2$CountryCode)
