## $Id: findEmptyMassObjects-functions.R 659 2011-07-20 12:11:47Z sgibb t
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

## removeEmptyMassObjects 
##  find and remove empty AbstractMassObject objects in a MassObjectsList
##
## params:
##  l: list of AbstractMassObject objects
##
## returns:
##  a list without empty objects
##
removeEmptyMassObjects <- function(l) {

    if (!isMassObjectList(l)) {
        stop(sQuote("l"), 
             " is no list of MALDIquant::AbstractMassObject objects");
    }

    ## find empty MassPeaks objects
    notEmpty <- !1:length(l) %in% findEmptyMassObjects(l);

    ## exclude empty elements
    return(l[notEmpty]);
}
