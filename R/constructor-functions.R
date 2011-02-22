## $Id: constructor-functions.R 414 2011-02-22 17:11:25Z sgibb $
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

## createSingleSpectrum
##  default constructor: SingleSpectrum class
##
## params:
##  mass: vector, spectrum mass
##  intensity: vector, spectrum intensities
##  metaData: list, metadata
##
## returns:
##  a SingleSpectrum object
##
createSingleSpectrum <- function(mass, intensity, metaData=list()) {
    return(new(Class="SingleSpectrum", mass=mass, intensity=intensity,
            metaData=metaData));
}

## importSingleSpectrum
##  reads a single spectrum from file
##  user function for .importSingleSpectrum
##
## params:
##  file: string, path to file
##  verbose: logical, verbose output
##  ...: arguments to be passed to import functions
##
## returns:
##  a SingleSpectrum object
##
importSingleSpectrum <- function(file, verbose=FALSE, ...) {
    if (!file.exists(file) | file.info(file)$isdir) {
        stop("Could not read mass spectrum from ", sQuote(file), ".");
    }

    bname <- tolower(basename(file));

    if ("fid" == bname) {
        ## fid file of Bruker Daltonics' *flex-series
        library(readBrukerFlexData);
        return(.importSingleSpectrum(importFunction=readBrukerFlexFile,
                fidFile=file, verbose=verbose, ...));
    } else if (grepl(pattern="\\.mzxml$|\\.xml$", x=bname)) {
        ## mzXML file
        library(readMzXmlData);
        return(.importSingleSpectrum(importFunction=readMzXmlFile,
                mzXmlFile=file, verbose=verbose, ...));
    } else {
        stop("Could not detect file format of ", sQuote(file), ".");
    }
}

## .importSingleSpectrum 
##  reads a single spectrum from file
##  (uses external libraries for file loading)
##
## params:
##  importFunction: which function should be used to import data
##  ...: arguments passed to importFunction
##
## returns:
##  a SingleSpectrum object
.importSingleSpectrum <- function(importFunction, ...) {

    importFunction <- match.fun(importFunction);
    spec <- importFunction(...);
    return(createSingleSpectrum(mass=spec$spectrum$mass,
            intensity=spec$spectrum$intensity, metaData=spec$metaData));
}
