# setwd("C:/Users/corpus/Desktop/Learning-R/Coursera_Johns_Hopkins/Getting and cleaning data/Week1")
# download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv",
# destfile="./communities.csv",method="auto" )
# communities <- read.csv("communities.csv")
# excludeNA <- communities[!is.na(communities[,"VAL"]),"VAL"]
# VAL24 <- excludeNA[excludeNA==24]
# question1 <- length(VAL24)
# 
# FES <- communities[,"FES"]

 
## I'm having trouble download directly
# download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx",destfile="./test.xlsx",method="curl" )
# Sys.setenv(JAVA_HOME='')
# library(xlsx)
# rowIndex <- 18:23
# colIndex <- 7:15 
# dat <- read.xlsx("naturalGas.xlsx",sheetIndex=1,
#                         header=TRUE,colIndex=colIndex,rowIndex=rowIndex)
# s <- sum(dat$Zip*dat$Ext,na.rm=T)
 
# library(XML)
# doc <- xmlTreeParse("http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml",useInternal=TRUE)
# rootNode <- xmlRoot(doc)
# zipcode <-  xpathSApply(rootNode,"//zipcode",xmlValue)
# question4 <- length(zipcode[zipcode==21231])
# 
# library(data.table)
# DT <- fread("communities.csv")
# op1 <- system.time(sapply(split(DT$pwgtp15,DT$SEX),mean))





