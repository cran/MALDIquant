## $Id: movingEstimator-functions.R 491 2011-03-24 18:49:48Z sgibb $
##
## Copyright 2011 Sebastian Gibb
## <mail@sebastiangibb.de>
##
## This file is part of MALDIquant for R and related languages.
##
## MALDIquant is free software: you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
##
## MALDIquant is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with MALDIquant. If not, see <http://www.gnu.org/licenses/>

## movingEstimator
##  calculate local estimator for a moving window
##
## params:
##  x: vector of values
##  windowSize: size of local window (should be odd)
##  fun: estimator fun [default: median]
##
## returns:
##  vector of size length(x) with local estimators
##
.movingEstimator <- function(x, windowSize, fun=median) {
    n <- length(x);
    
    if (windowSize %% 2 == 0)
        windowSize <- 2*(windowSize %/% 2)+1;

    halfWindowSize <- floor(windowSize/2);
    fun <- match.fun(fun);

    ### growing window at boundary
    # lowerIndex <- rep(1, halfWindowSize);
    # lowerIndex[(halfWindowSize+1):n] <- 1:(n-halfWindowSize);
    # upperIndex <- (1+halfWindowSize):n;
    # upperIndex[(n-halfWindowSize+1):n] <- rep(n, (halfWindowSize));

    ## fixed window
    lowerIndex <- 1:(n-(2*halfWindowSize));
    upperIndex <- (2*halfWindowSize+1):n;

    ## calculate estimator
    m <- mapply(FUN=function(l, u) {
                    return(fun(x[l:u]));
                }, lowerIndex, upperIndex);

    ## only needed for fixed window size
    m <- c(rep(m[1], halfWindowSize), m, rep(m[length(m)], halfWindowSize));

    return(m);
}

.movingEstimatorRelative <- function(x, y, windowSize, fun=median) {
    if (windowSize <= 0 || windowSize > 1)
        stop("Invalid windowSize!")

    halfWindowSize <- windowSize/2;
    
    lower <- x*(1-halfWindowSize);
    upper <- x*(1+halfWindowSize);

    ## too slow
    #m <- mapply(FUN=function(l, u) {
    #            return(fun(y [ l <= x & x <= u ])); 
    #            }, lower, upper);
    
    ## the following code is a little bit ugly
    ## and harder to understand but 20x faster than
    ## mapply
    n <- length(y);
    m <- double(n);
    lastLowerIndex <- 1;
    lastUpperIndex <- 1;

    for (i in seq(along=x)) {
      while(x[lastLowerIndex] < lower[i]) {
          lastLowerIndex <- lastLowerIndex+1;
      }
      while(x[lastUpperIndex] <= upper[i] && lastUpperIndex <= n) {
          lastUpperIndex <- lastUpperIndex+1;
      }
      lastUpperIndex <- lastUpperIndex-1;

      m[i] <- fun(y[lastLowerIndex:lastUpperIndex]);
    }

    return(m);
}
