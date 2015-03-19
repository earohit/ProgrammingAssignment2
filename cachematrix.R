## makeCacheMatrix has setter and getter fn for matrix and inverse matrix.
## cacheSolve fn calculates the inverse of the matrix and caches the result. 

## makeCacheMatrix fn - this fn gets the matrix and returns a list of 4 fns
## which is used in caheSolve fn to cache the result.

makeCacheMatrix <- function(x = matrix()) {
        Matrix <- NULL
        setMatrix <- function(y) {
                x <<- y
                Matrix <<- NULL
        }
        getMatrix <- function() x
        setInvMatrix <- function(InvMatrix) Matrix <<- InvMatrix
        getInvMatrix <- function() Matrix 
        list(setMatrix = setMatrix , getMatrix = getMatrix ,
             setInvMatrix = setInvMatrix ,
             getInvMatrix = getInvMatrix )
}


## cacheSolve - The fn checks if the inverse matrix is already calculated. If so, 
## then the fn returns the inverse matrix. If the inverse matrix is null, then 
## the inverse matrix is calculated and cached.


cacheSolve <- function(x, ...) {
	## Return a matrix that is the inverse of 'x'
        InvMatrix <- x$getInvMatrix()
        if(!is.null(InvMatrix)) {
                message("getting cached data")
                return(InvMatrix)
        }
        Matrix <- x$getMatrix()
        InvMatrix <- solve(Matrix)
        x$setInvMatrix(InvMatrix)
        InvMatrix 
}
