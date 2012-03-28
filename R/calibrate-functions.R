## Copyright 2011-2012 Sebastian Gibb
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

## calibrate
##  calibrate AbstractMassObject objects
##
## params:
##  l: list of AbstracMassObject objects
##  method: calibration method
##
## returns:
##  a list of calibrated AbstractMassObject objects
##
calibrate <- function(l, method=c("TIC"),
                        ...) {
        
    ## test parameters
    if (!isMassObjectList(l)) {
        stop(sQuote("l"),
             " is no list of MALDIquant::AbstractMassObject objects!");
    }
  
    method=match.arg(method, several.ok=FALSE);
  
    l <- switch(method,
                "TIC" = {
                   .calibrateSingleMassObjects(l, fun=sum);
                },
                {
                   stop("Unknown ", sQuote("method"), ".");
                }
    );
  
    return(l);
}

## .calibrateSingleMassObject
##  calibrate each single AbstractMassObject object for its own
##
## params:
##  l: list of AbstracMassObject objects
##  fun: function to determine calibration value (TIC: sum, Median: median)
##
## returns:
##  a list of calibrated AbstractMassObject objects
##
.calibrateSingleMassObjects <- function(l, fun) {
    ## test parameters
    if (!isMassObjectList(l)) {
        stop(sQuote("l"), 
             " is no list of MALDIquant::AbstractMassObject objects!");
    }
    
    fun <- match.fun(fun);
    calibrationValue <- sapply(l, function(x, f) {
                               return(f(x@intensity));
    }, f=fun);
    
    l <- mapply(FUN=function(p, c) {
                       p@intensity <- p@intensity/c;
                       return(p);
    }, p=l, c=calibrationValue);
    
    return(l);
}

