add2 <- function(x,y) {
    x+y
}

above10 <- function(x) {
    vector <- x[x>10]
}

above <- function(x,up=10) {
    x[x>up]
}

columnMean <- function(x,removeNA=TRUE) {
    results <- rep(0,ncol(x))
    for (i in 1:ncol(x)) {
        results[i]=mean(x[,i],na.rm=removeNA)  
    }
    results
}

#this function returns a function pow.
makePower <- function(n) {
    pow <- function(x) {
        x^n
    }
}

f <- function(x) {
    g <- function(y) {
        y+z
    } 
    z <- 4 
    x+g(x)
}
