## Cache the inverse value of a matrix to avoid repeated calculating it (as it's an expensive operation)

## A wrapper around matrix which adds get, set, setinverse and getinverse methods

makeCacheMatrix <- function(x = matrix()) {

  ## inverse will store the inverse, it is set to NULL until it has been calculated
  inverse <- NULL
  
  ## Define the methods which can be called on cacheMatrix
  set <- function(y) {
    x <<- y
    inverse <<- NULL
  }
  
  get <- function() x
  setinverse <- function(solve) inverse <<- solve
  getinverse <- function() inverse
  
  ## Return a list of the methods which can be called on cacheMatrix
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}

## Get the inverse, first check the cache, if this has not been set then 
## calculate the inverse and store it in the cache.

cacheSolve <- function(x, ...) {
  
  ## look for the inverse in the cache
  inverse <- x$getinverse()
  if(!is.null(inverse)) {
    
    ## return cached value if it was set
    return(inverse)
  }
  
  ## If the cached value was not set, then caluclate the inverse
  data <- x$get()
  inverse <- solve(data, ...)
  
  ## And set it in the cache.
  x$setinverse(inverse)
  Return(inverse)
}
