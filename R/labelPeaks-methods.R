## $Id: labelPeaks-methods.R 583 2011-05-28 18:00:49Z sgibb $
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

setMethod(f="labelPeaks",
    signature=signature(object="MassPeaks"),
    definition=function(object, index=1:length(object), 
        digits=3,
        underline=TRUE, 
        ## verticalOffset ca. 0.5% max
        verticalOffset=ceiling(max(object@intensity)/200),
        adj=c(0.5, 0), cex=0.7, family="sans",
        ...) {

    x <- object@mass[index];

    y <- object@intensity[index]+verticalOffset;

    peakLabels <- round(x=x, digits=digits);

    if (underline) {
        peakLabels <- as.expression(sapply(peakLabels,
                function(x)substitute(underline(a), list(a=x))));
    }

    text(x=x, y=y, labels=peakLabels, cex=cex, adj=adj, ...);
});

