## $Id: show-methods.R 412 2011-02-21 14:34:36Z sgibb $
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
setMethod(f="show",
    signature=signature(object="AbstractSpectrumData"),
    definition=function(object) {
    
    groups <- c("Number of m/z values", 
        "Range of m/z values",
        "Range of intensity values");

    values <- c(length(object@mass), 
        paste(round(range(object@mass), digits=3), collapse=" - "),
        paste(round(range(object@intensity), digits=3), collapse=" - "));

    if (!is.null(object@metaData$file)) {
        groups <- c("File", groups);    
        values <- c(object@metaData$file, values);
    }

    if (!is.null(object@metaData$name)) {
        groups <- c("Name", groups);    
        values <- c(object@metaData$name, values);
    }

    groups <- format(groups, justify="left");
    values <- format(values, justify="right");

    for (i in seq(along=groups)) {
        cat(groups[i], ":", values[i], "\n", sep=" ");
    }
});

