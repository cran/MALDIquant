## $Id: isMassObjectList-functions.R 659 2011-07-20 12:11:47Z sgibb $
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

isMassObjectList <- function(l) {
    isList <- is.list(l);
    areMassObjects <- length(l) > 0 && all( unlist(sapply(l, function(x) {
                           return(inherits(x=x,
                                  what="AbstractMassObject"))})) );
    return(isList && areMassObjects);
}

isMassSpectrumList <- function(l) {
    isList <- is.list(l);
    areMassSpectrumObjects <- length(l) > 0 &&
                              all( unlist(sapply(l, function(x) {
                                   return (is(object=x,
                                              class2="MassSpectrum"));})) );

    return(isList && areMassSpectrumObjects);
}

isMassPeaksList <- function(l) {
    isList <- is.list(l);
    areMassPeaksObjects <- length(l) > 0 &&
                           all( unlist(sapply(l, function(x) {
                                return (is(object=x,
                                           class2="MassPeaks"));})) );

    return(isList && areMassPeaksObjects);
}
