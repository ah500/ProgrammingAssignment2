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


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}
