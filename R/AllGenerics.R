## $Id: AllGenerics.R 471 2011-03-18 16:11:11Z sgibb $
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

## AbstractSpectrumData
if (is.null(getGeneric("as.matrix")))
    setGeneric("as.matrix", function(x, ...) standardGeneric("as.matrix"));
if (is.null(getGeneric("length")))
    setGeneric("length", function(x, ...) standardGeneric("length"));
if (is.null(getGeneric("lines")))
    setGeneric("lines", function(x, ...) standardGeneric("lines"));
if (is.null(getGeneric("plot")))
    setGeneric("plot", function(x, y, ...) standardGeneric("plot"));

## get/set slots
if (is.null(getGeneric("mass")))
    setGeneric("mass", function(object) standardGeneric("mass"));
if (is.null(getGeneric("mass<-")))
    setGeneric("mass<-", function(object, value) standardGeneric("mass<-"));
if (is.null(getGeneric("intensity")))
    setGeneric("intensity", function(object) standardGeneric("intensity"));
if (is.null(getGeneric("intensity<-")))
    setGeneric("intensity<-", function(object, value) standardGeneric("intensity<-"));
if (is.null(getGeneric("isEmpty")))
    setGeneric("isEmpty", function(x, ...) standardGeneric("isEmpty"));
if (is.null(getGeneric("metaData")))
    setGeneric("metaData", function(object) standardGeneric("metaData"));
if (is.null(getGeneric("metaData<-")))
    setGeneric("metaData<-", function(object, value) standardGeneric("metaData<-"));
## end of AbstractSpectrumData

## SingleSpectrum
if (is.null(getGeneric("estimateBaseline")))
    setGeneric("estimateBaseline", function(object, ...) standardGeneric("estimateBaseline"));
if (is.null(getGeneric("removeBaseline")))
    setGeneric("removeBaseline", function(object, ...) standardGeneric("removeBaseline"));
## end of SingleSpectrum

## SinglePeakList
if (is.null(getGeneric("labelPeaks")))
    setGeneric("labelPeaks", function(x, ...) standardGeneric("labelPeaks"));
## end of SinglePeakList
