## $Id: intensityMatrix-functions.R 834 2012-01-18 08:11:24Z sgibb $
##
## Copyright 2011-2012 Sebastian Gibb
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

## intensityMatrix 
##  convert list of AbstractMassObject objects to a matrix 
##
## params:
##  l: list of AbstractMassObject objects
##  replaceNaBy: double, replace NA by replaceNaBy (NULL for not replacing any
##               NA)
##
## returns:
##  a matrix
##
intensityMatrix <- function(l, replaceNaBy=0) {

    ## test parameters
    if (!isMassObjectList(l)) {
        stop(sQuote("l"), 
             " is no list of MALDIquant::AbstractMassObject objects!");
    }
    
    ## fetch all mass
    mass <- sort(x=unlist(lapply(l, function(x)x@mass)), method="quick");
    uMass <- unique(mass);
  
    ## build matrix
    m <- do.call(rbind,
                 lapply(l, function(x)x@intensity[
                        match(x=uMass, table=x@mass, nomatch=NA)]));

    ## set column names
    dimnames(m) <- list(NULL, c(uMass));
  
    if (!is.null(replaceNaBy)) {
        m[is.na(m)] <- replaceNaBy;
    }

    return(m);
}

