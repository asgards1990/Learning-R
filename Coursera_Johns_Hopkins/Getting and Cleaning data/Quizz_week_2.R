#Question1
library(httr)

# 1. Find OAuth settings for github:
#    http://developer.github.com/v3/oauth/
oauth_endpoints("github")

# 2. Register an application at https://github.com/settings/applications
#    Insert your values below - if secret is omitted, it will look it up in
#    the GITHUB_CONSUMER_SECRET environmental variable.
#
#    Use http://localhost:1410 as the callback url
myapp <- oauth_app("github", "client_ID","client_secret")

# 3. Get OAuth credentials need other packages cf when running
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)

# 4. Use API
gtoken <- config(token = github_token)
req <- GET("homepage", gtoken)
stop_for_status(req)
contents = content(req)

# OR:
req <- with_config(gtoken, GET("https://api.github.com/rate_limit"))
stop_for_status(req)
content(req)

# Obtain a dataframe
data = jsonlite::fromJSON(toJSON(contents))
data[data[,"name"]=="datasharing","created_at"]



#Question2
options(sqldf.driver = "SQLite") # as per FAQ #7 force SQLite
options(gsubfn.engine = "R") # as per FAQ #5 use R code rather than tcltk
library(RMySQL)
library(sqldf)
results <-sqldf("select pwgtp1 from acs where AGEP < 50")

#Question3
unique(acs$AGEP)
sqldf("select distinct AGEP from acs")


#Question4
#install.packages("XML")
library(XML)
url="http://biostat.jhsph.edu/~jleek/contact.html"
# html <- htmlTreeParse(url,useInternalNodes=T)
# linesTable <- capture.output(html) will get the lines without empty lines


con = url(url)
linesTable = readLines(con)
nchar(linesTable[10])
nchar(linesTable[20])
nchar(linesTable[30])
nchar(linesTable[100])


#Question5
x <- read.fwf(
        "getdata-wksst8110.for",
        skip=4,
        widths=c(12, 7,4, 9,4, 9,4, 9,4))
vector <- as.vector(x[,4])
sum(vector)
                           