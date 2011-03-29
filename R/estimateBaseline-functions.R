## $Id: estimateBaseline-functions.R 493 2011-03-25 11:14:09Z sgibb $
##
## Copyright 2011 Sebastian Gibb
## <mail@sebastiangibb.de>
##
## This file is part of PACKAGE for R and related languages.
##
## PACKAGE is free software: you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
##
## PACKAGE is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with PACKAGE. If not, see <http://www.gnu.org/licenses/>

## estimateBaselineConvexHull 
##  estimate basline by creating a convex hull 
##
## params:
##  x: vector of x values
##  y: vector of y values
##
## returns:
##  a matrix of the estimate baseline (col1: mass; col2: intensity)
##
.estimateBaselineConvexHull <- function(x, y) {

    if (!require("fdrtool")) {
        stop("Could not load package ", sQuote("fdrtool"), ".");
    }

    ## greatest convex minorant
    gcm <- gcmlcm(x=x, y=y, type="gcm");

    n <- length(gcm$x.knots);

    b <- matrix(c(x, y), nrow=length(x), ncol=2);

    for (i in seq(from=1, to=(n-1))) {
        ## build linear function y=mx+c to calculate values between knots
        m <- (gcm$y.knots[i+1]-gcm$y.knots[i])/(gcm$x.knots[i+1]-gcm$x.knots[i]);
        c <- gcm$y.knots[i]-m*gcm$x.knots[i];

        w <- which(x>=gcm$x.knots[i] & x<gcm$x.knots[i+1]);

        b[w, 2] <- m*x[w]+c;
    }

    return(b);
}

## estimateBaselineMovingEstimator
##  estimate basline by a moving estimator function 
##
## params:
##  x: vector of x values
##  y: vector of y values
##  windowSize: size of local window (should be odd)
##  relativeWindowSize: logical, use movingEstimator or
##      movingEstimatorRelative [default]
##  fun: estimator function [default: median]
##
## returns:
##  a matrix of the estimate baseline (col1: mass; col2: intensity)
##
.estimateBaselineMovingEstimator <- function(x, y, 
    windowSize=0.04, relativeWindowSize=TRUE, fun=median) {

    if (relativeWindowSize) {
        m <- .movingEstimatorRelative(x=x, y=y,
                                      windowSize=windowSize,
                                      fun=fun);
    } else {
        if (windowSize<3) {
            stop(sQuote("windowSize"), "=", windowSize, " is too small!");
        }
        m <- .movingEstimator(x=y, windowSize=windowSize, fun=fun);
    }

    return(cbind(x, m));
}

## estimateBaselineSnip
##  estimate basline by SNIP algorithm 
##
##  SNIP algorithm based on:
##  C.G. Ryan, E. Clayton, W.L. Griffin, S.H. Sie, and D.R. Cousens. 
##  "Snip, a statistics-sensitive background treatment for the quantitative
##  analysis of pixe spectra in geoscience applications."
##  Nuclear Instruments and Methods in Physics Research Section B: 
##  Beam Interactions with Materials and Atoms, 34(3):396-402, 1988. 
##  ISSN 0168-583X. doi:10.1016/0168-583X(88)90063-8. 
##  URL http://www.sciencedirect.com/science/article/B6TJN-46YSYTJ-30/2/e0d015ceb8ea8a7bc0702a857a19750b
##
## params:
##  x: vector of x values (only needed for create a matrix as return value)
##  y: vector of y values
##  iterations: number of iterations 
##
## returns:
##  a matrix of the estimate baseline (col1: mass; col2: intensity)

## C version
.estimateBaselineSnip <- function(x, y, iterations=100) {
    n <- length(y);
    y <- .C("R_snip",
            as.double(y),
            as.integer(n),
            as.integer(iterations),
            output=double(n),
            DUP=FALSE,
            PACKAGE="MALDIquant")$output;
    return(cbind(x, y));
}

## R only: obsolete because too slow
.snipR <- function(x, y, iterations=100) {
    n <- length(y);

    for (i in seq(from=1, to=iterations)) {
        j <- (i+1):(n-i);
        jl <- j-i;
        ju <- j+i;
        m <- (y[jl]+y[ju])/2;
        ## too slow
        #y[j] <- ifelse(y[j] > m, m, y[j]);
        ml <- y[j]>m;
        y[j][ml] <- m[ml];
    }
    return(cbind(x, y));
}
