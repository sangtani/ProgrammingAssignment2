## The functions below demonstrate the ability to cache results
## of functions and reuse cached results on demand without
## executing the function again

## makeCacheMatrix does the following:
## 1. set() sets a matrix as the intial invertible square matrix
## 2. get() gets a matrix that has been used as an invertible square matrix
## 3. setinverse() sets the inverse of the square matrix
## 4. getinverse() gets the inverse of the square matrix

makeCacheMatrix <- function(x = matrix()) { ## Input is a square matrix

## Set the placeholder to NULL
    m <- NULL 

## Assign the input matrix to the cached matrix
    set <- function (y = matrix()) {
           x <<- y
           m <<- NULL
    }

## Get the matrix after it's been set
    get <- function() x

## Set the inverse of the input matrix
    setinverse <- function (solve) m <<- solve

## Get the inverse of the input matrix
    getinverse <- function () m
    list (set = set, get = get, 
          setinverse = setinverse, getinverse = getinverse)    
}


## cacheSolve inverts the square matrix provided. If there is an inverse 
## already cached, it returns the cached inverse

cacheSolve <- function(x, ...) {
## set placeholder
        m <- x$getinverse()

## if placeholder is not null (cache already exists) then return cached data
        if (!is.null(m)) {
                message ("getting cached data")
                return (m)
        }

## if placeholder is null then set placeholder to inverse
        data <- x$get()
        m <- solve(data, ...)
        x$setinverse (m)

## return the placeholder
        m
}