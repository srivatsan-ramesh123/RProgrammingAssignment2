
R version 3.4.1 (2017-06-30) -- "Single Candle"
Copyright (C) 2017 The R Foundation for Statistical Computing
Platform: x86_64-pc-linux-gnu (64-bit)

R is free software and comes with ABSOLUTELY NO WARRANTY.
You are welcome to redistribute it under certain conditions.
Type 'license()' or 'licence()' for distribution details.

  Natural language support but running in an English locale

R is a collaborative project with many contributors.
Type 'contributors()' for more information and
'citation()' on how to cite R or R packages in publications.

Type 'demo()' for some demos, 'help()' for on-line help, or
'help.start()' for an HTML browser interface to help.
Type 'q()' to quit R.

[Workspace loaded from ~/.RData]

> library(datasets)
> data(mtcars)
> view(mtcars)
Error in view(mtcars) : could not find function "view"
> View(mtcars)
> sapply(mtcars$hp,mean)
 [1] 110 110  93 110 175 105 245  62  95 123 123 180 180 180 205 215 230  66  52  65  97 150
[23] 150 245 175  66  91 113 264 175 335 109
> sapply(mtcars$hp,mtcars$cyl,mean)
Error in match.fun(FUN) : 
  'mtcars$cyl' is not a function, character or symbol
> sapply(mtcars$cyl,mtcars$hp,mean)
Error in match.fun(FUN) : 
  'mtcars$hp' is not a function, character or symbol
> sapply(split(mtcars$hp,mtcars$cyl),mean)
        4         6         8 
 82.63636 122.28571 209.21429 
> makeCacheMatrix <- function(x = matrix()) {
+     inv <- NULL
+     set <- function(y) {
+         x <<- y
+         inv <<- NULL
+     }
+     get <- function() x
+     setInverse <- function(inverse) inv <<- inverse
+     getInverse <- function() inv
+     list(set = set,
+          get = get,
+          setInverse = setInverse,
+          getInverse = getInverse)
+ }
> cacheSolve <- function(x, ...) {
+     ## Return a matrix that is the inverse of 'x'
+     inv <- x$getInverse()
+     if (!is.null(inv)) {
+         message("getting cached data")
+         return(inv)
+     }
+     mat <- x$get()
+     inv <- solve(mat, ...)
+     x$setInverse(inv)
+     inv
+ }
> my_matrix <- makeCacheMatrix(matrix(1:4, 2, 2))
> my_matrix$get()
     [,1] [,2]
[1,]    1    3
[2,]    2    4
> my_matrix$getInverse()
NULL
> cacheSolve(my_matrix)
     [,1] [,2]
[1,]   -2  1.5
[2,]    1 -0.5
> my_matrix$getInverse()
     [,1] [,2]
[1,]   -2  1.5
[2,]    1 -0.5
> my_matrix$set(matrix(c(2, 2, 1, 4), 2, 2))
> my_matrix$get()
     [,1] [,2]
[1,]    2    1
[2,]    2    4
> 
