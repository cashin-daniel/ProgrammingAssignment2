##create a function which starts with a null matrix argument
makeCacheMatrix <- function(x = numeric()) {
## initialize the value of the matrix inverse to NULL
    m <- NULL
## delcare another function set where the value will be cached in 1. Matrix is created
## for the first time. 2. changes made to cached matrix
  set <- function(y) {
    x <<- y
## change the value of inverse of the matrix in case the matrix was changed.
    m <<- NULL
  }
## gets the value of the inverse
  get <- function() x
#calculates the inverse of non-singular matrix via the solve function
  setsolve <- function(solve) m <<- solve
# gets the inverse     
  getsolve <- function() m
## passes the value of the function makeCacheMatrix 
  list(set = set, get = get,
       setsolve = setsolve,
       getsolve = getsolve)
}
# used to get the cache of the matrix
cacheSolve <- function(x, ...) {
  m <- x$getsolve()
#if the inverse exists, it gets it.
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  #if the inverse if not there, first it is calculated and then retrieved.
  data <- x$get()
  m <- solve(data, ...)    ## %*% m
  x$setsolve(m)
  m
}  
