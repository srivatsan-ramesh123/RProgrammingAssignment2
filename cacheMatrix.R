## The function constructs an object that represents a matrix and operations on it.
makeCacheMatrix <- function(x = matrix()) {
  i <- NULL
  set <- function(y){
    if(x!=y){
      x <<- y
      i <<- NULL
    }
  }
  get <- function() x
  setinverse <- function(inverse) i <<- inverse
  getinverse <- function() i
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}
## This function returns the inverse for matrices/objects created by the first functions from cache or caches the inverse if not cached before.
cacheSolve <- function(x, ...) {
  i <- x$getinverse()
  if(!is.null(i)) {
    message("getting cached data")
    return(i)
  }
  data <- x$get()
  i <- solve(data, ...)
  x$setinverse(i)
  i
}