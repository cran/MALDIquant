## $Id: removeBaseline-methods.R 471 2011-03-18 16:11:11Z sgibb $
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

## SingleSpectrum 
setMethod(f="removeBaseline",
    signature=signature(object="SingleSpectrum"),
    definition=function(object, baseline=NULL,
                        ...) {

    ## empty spectrum?
    if (isEmpty(object))
        stop("Spectrum is empty!");

    ## no baseline argument given => compute baseline
    if (is.null(baseline))
        baseline <- estimateBaseline(object=object, ...);

    ## wrong baseline argument given?
    isBaselineMatrix <- is.matrix(baseline) &&
                        nrow(baseline) == length(object) &&
                        ncol(baseline) == 2;

    if (!isBaselineMatrix) {
        warning("The baseline argument is not a valid baseline of given ",
                "SingleSpectrum object. A new baseline would be estimated.");
        baseline <- estimateBaseline(object=object, ...);
    }

    ## substract baseline
    object@intensity <- object@intensity - baseline[,2];
    
    return(object);
});

