## $Id: intensityMatrix-functions.R 699 2011-08-04 15:11:28Z sgibb $
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
    mass <- sort(unlist(lapply(l, function(x)x@mass)));
    uMass <- unique(mass);
    nUMass <- length(uMass);
  
    ## fetch indices
    idx <- lapply(l, function(x) {
                  lxm <- length(x@mass);
                  d <- duplicated(c(x@mass, uMass));
                  return(d[(lxm+1):(lxm+nUMass)]);
                });
  
    m <- matrix(ncol=nUMass, nrow=length(l),
                dimnames=list(c(), c(uMass)));
  
    for (i in seq(along=idx)) {
        m[i, idx[[i]]] <- l[[i]]@intensity;
    }
  
    if (!is.null(replaceNaBy)) {
        m[is.na(m)] <- replaceNaBy;
    }

    return(m);
}

