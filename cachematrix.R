## Put comments here that give an overall description of what your
## functions do

## create a matrix with cached
makeCacheMatrix <- function(x = matrix()) {
    m <- NULL
    set <- function(y) {
        x <<- y
        m <<- NULL
    }
    get <- function() x
    setinv <- function(inv) m <- inv
    getinv <- function() m
    list(set = set, get = get, setinv = setinv, getinv = getinv)
}

## Return a matrix that is the inverse of 'x'
cacheSolve <- function(x, ...) {
    inv <- x$getinv()
    if (!is.null(inv)) {
        message("getting cached data")
        return(inv)
    }
    m <- x$get()
    inv <- solve(m)
    x$setinv(inv)
    inv
}
