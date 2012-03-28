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

isMassObjectList <- function(x) {
    if (!is.list(x)) {
        return(FALSE);
    } 

    areMassObjects <- length(x) > 0 &&
                      all( unlist(sapply(x, function(e) {
                           return(isMassObject(e))})) );

    return(areMassObjects);
}

isMassSpectrumList <- function(x) {
    if (!is.list(x)) {
        return(FALSE);
    } 

    areMassSpectrumObjects <- length(x) > 0 &&
                              all( unlist(sapply(x, function(e) {
                                   return(isMassSpectrum(e))})) );
    return(areMassSpectrumObjects);
}

isMassPeaksList <- function(x) {
    if (!is.list(x)) {
        return(FALSE);
    } 

    areMassPeaksObjects <- length(x) > 0 &&
                           all( unlist(sapply(x, function(e) {
                                return(isMassPeaks(e))})) );

    return(areMassPeaksObjects);
}
