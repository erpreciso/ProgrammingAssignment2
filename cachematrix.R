# Coursera - R Programming - assignment project 2 - erpreciso
#
# cachematrix.R
# =============
#
# INTRO
# =====
# These functions below provide a time-saving tool to get inverse of 
# matrix when this need to be supplied multiple times.
# Computations is performed only once, and result is stored in cache.
# Usage: apply the function makeCacheMatrix to your matrix. When the inverse
# is needed, call cacheSolve on that object.
# See function docs below.
#
# EXAMPLE
# =======
# mymatrix <- matrix(4:7, nrow=2, ncol=2)
#
# a <- makeCacheMatrix(mymatrix)
#
# class(a)
# # [1] "list"
#
# a$get()
# # [,1] [,2]
# # [1,]    4    6
# # [2,]    5    7
#
# a$getinverse()
# # NULL
#
# cacheSolve(a)
# # [,1] [,2]
# # [1,] -3.5    3
# # [2,]  2.5   -2
#
# a$getinverse()
# # [,1] [,2]
# # [1,] -3.5    3
# # [2,]  2.5   -2
#
# cacheSolve(a)
# # getting cached data
# # [,1] [,2]
# # [1,] -3.5    3
# # [2,]  2.5   -2


# makeCacheMatrix
# ===============
# argument (optional): a matrix object
# return: an object with the following methods:
#   - get: return the contained matrix
#   - set: set the matrix
#   - getinverse: get inverse of the matrix if previously computed
#   - setinverse: set inverse of the matrix
# usage: <symbol> <- makeCacheMatrix(<your matrix object here>)
#        or
#        <symbol> <- makeCacheMatrix()
#        <symbol>$set(<your matrix object here>)

makeCacheMatrix <- function(x = matrix()) {
    m <- NULL
    set <- function(y) {
        x <<- y
        m <<- NULL
    }
    get <- function() x
    setinverse <- function(inverse) m <<- inverse
    getinverse <- function() m
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)
}

# cacheSolve
# ==========
# argument: an object returned from the function makeCacheMatrix
# return: inverse of the matrix stored in the object passed.
#         If this is retrieved from cache, a message will be printed:
#           "getting cache data"
# usage: cacheSolve(<makeCacheMatrix object>)

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
    m <- x$getinverse()
    if(!is.null(m)) {
        message("getting cached data")
        return(m)
    }
    data <- x$get()
    m <- solve(data, ...)
    x$setinverse(m)
    m
}