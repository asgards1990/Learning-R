library(datasets)
data(iris)
?iris

## mean of the column Sepal.Length when Species is Virginica.
mean(iris[iris["Species"]=="virginica","Sepal.Length"],na.rm=TRUE)

## means of the first 4 columns
apply(iris[, 1:4], 2, mean)


library(datasets)
data(mtcars)

## means of mpg per number of cylinders.
## tapply(mtcars$mpg, mtcars$cyl, mean) will also work

with(mtcars, tapply(mpg, cyl, mean))

hpcyl <- with(mtcars, tapply(hp, cyl, mean))
abs(hpcyl["8"]-hpcyl["4"])