## Put comments here that give an overall description of what your
## functions do
#
## Write a short comment describing this function
# makeCacheMatrix is a function that returns a list of functions
# Its puspose is to store a martix and a cached value of the inverse of the 
# matrix. Contains the following functions:
# * setMatrix      set the value of a matrix
# * getMatrix      get the value of a matrix
# * cacheInverse   get the cahced value (inverse of the matrix)
# * getInverse     get the cahced value (inverse of the matrix)
makeCacheMatrix <- function(x = matrix()) {
        # holds the cached value or NULL if nothing is cached
        # initially nothing is cached so set it to NULL
        cache <- NULL
        setMatrix <- function(newValue) {
                x <<- newValue
                #flush the cache after assignment of a new value
                cache <<- NULL
        }
        #return stored matrix
        getMatrix <- function() {
                x
        }
        
        #cache the given argument
        cacheInverse <- function(solve) {
                cache <<- solve
        }
        
        #get the cached value
        getInverse <- function() {
                cache
        }
        
        #return list , each element is a function
        list(setMatrix = setMatrix, getMatrix = getMatrix, cacheInverse = cacheInverse, getInverse = getInverse)
}


## Write a short comment describing this function
# The following function calculates the inverse of a matrix created with makeCacheMatrix
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        #get the cached value
        inverse <- y$getInverse()
        #if the cached value exists return it
        if(!is.null(inverse)) {
                message("getting cached data")
                return(inverse)
        }
        #else get the matrix, calculate its inverse, and store it in the cache
        data <- y$getMatrix()
        inverse <- solve(data)
        y$cacheInverse(inverse)
        #return the inverse
        inverse
}
