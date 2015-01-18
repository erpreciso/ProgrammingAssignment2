# Coursera - R Programming - assignment project 2 - erpreciso

# cachematrix.R

## INTRO

These functions below provide a time-saving tool to get inverse of matrix when this need to be supplied multiple times.

Computations is performed only once, and result is stored in cache.

**Usage**: apply the function makeCacheMatrix to your matrix. When the inverse is needed, call cacheSolve on that object. See function docs below.

## EXAMPLE

mymatrix <- matrix(4:7, nrow=2, ncol=2)

a <- makeCacheMatrix(mymatrix)

class(a)
> [1] "list"

a$get()

> [,1] [,2]

> [1,]    4    6

> [2,]    5    7

a$getinverse()

> NULL

cacheSolve(a)

> [,1] [,2]

> [1,] -3.5    3

> [2,]  2.5   -2

a$getinverse()

> [,1] [,2]

> [1,] -3.5    3

> [2,]  2.5   -2

cacheSolve(a)

> *getting cached data*

> [,1] [,2]

> [1,] -3.5    3

> [2,]  2.5   -2