## Copyright 2012 Sebastian Gibb
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

## .doByLabels 
##  run a specific function labelwise
##
## params:
##  l: list of AbstractMassObject objects
##  labels: factor, labels for samples
##  fun: function
##
## returns:
##  list of modified AbstractMassObject objects
##
.doByLabels <- function(l, labels, FUN, ...) { 
    
    ## test parameters
    .stopIfNotMassObjectList(l);

    FUN <- match.fun(FUN);

    if (!missing(labels)) {
        if (length(labels) != length(l)) {
            stop("For each item in ", sQuote("l"), 
                 " there must be a label in ", sQuote("labels"), "!");
        }

        l <- unlist(tapply(X=l, INDEX=as.factor(labels), function(x) {
                           return(FUN(x, ...));
        }));
    } else {
        l <- FUN(l, ...);
    }

    return(l);
}

