## $Id: detectPeaks-methods.R 834 2012-01-18 08:11:24Z sgibb $
##
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

## MassSpectrum 
setMethod(f="detectPeaks",
    signature=signature(object="MassSpectrum"),
    definition=function(object, 
                        localMaxima, noise, SNR=2,
                        ...) {

    ## empty spectrum?
    if (.isEmptyWarning(object)) {
        return(createMassPeaks(mass=object@mass,
                                intensity=object@intensity,
                                metaData=object@metaData));
    }

    ## save optional arguments
    optArgs <- list(...);

    ## no localMaxima argument given => findLocalMaxima 
    if (missing(localMaxima)) {
        if ("halfWindowSize" %in% names(optArgs)) {
            localMaxima <- findLocalMaxima(object=object,
                halfWindowSize=optArgs$halfWindowSize);

            removedArgs <- na.omit(match(names(optArgs), "halfWindowSize"));
            optArgs <- optArgs[seq(along=optArgs)[-removedArgs]];
        } else {
            localMaxima <- findLocalMaxima(object=object);
        }
    }

    ## no noise argument given => estimate noise 
    if (missing(noise)) {
        arguments <- list();
        arguments$object <- object;
        arguments <- append(arguments, optArgs);

        noise <- do.call(estimateNoise, arguments);
    }

    ## wrong localMaxima argument given?
    isLocalMaximaMatrix <- is.matrix(localMaxima) && ncol(localMaxima) == 2;

    if (!isLocalMaximaMatrix) {
        stop("The localMaxima argument is not valid.");
    }

    ## wrong noise argument given?
    isCorrectNoise <- (is.matrix(noise) || is.numeric(noise)) &&
                      ((nrow(noise) == length(object) && ncol(noise) == 2) ||
                      (length(noise) == 1));

    if (!isCorrectNoise) {
        stop("The noise argument is not valid.");
    }

    ## include only local maxima which are above the noise
    peakIndex <- localMaxima[, 2] > (SNR * noise);
    
    return(createMassPeaks(mass=localMaxima[peakIndex, 1],
                                intensity=localMaxima[peakIndex, 2],
                                metaData=object@metaData));
});

