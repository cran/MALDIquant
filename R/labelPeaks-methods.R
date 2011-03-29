## $Id: labelPeaks-methods.R 474 2011-03-20 07:31:56Z sgibb $
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
    signature=signature(x="SinglePeakList"),
    definition=function(x, number=10, decreasing=TRUE, 
        xlim=c(min(x@mass), max(x@mass)),
        underline=TRUE, upsideDown=FALSE, 
        ## verticalOffset ca. 5% max
        verticalOffset=ceiling(max(x@intensity)/20),
        col="black", cex=0.7, adj=c(0.5, 0), ...) {

    xlimIndicies <- which(x@mass >= xlim[1] & x@mass <= xlim[2]);

    ## label all peaks if number > selected number of peaks
    if (length(xlimIndicies) < number) {
        number <- length(xlimIndicies);
    }

    ## fetch highest "number" peaks
    indicies <- x@intensity %in% (sort(x=x@intensity[xlimIndicies], 
            decreasing=decreasing)[1:number]);

    ## no peaks selected?
    if (all(indicies==FALSE)) {
        return(NULL);
    }

    xPos <- x@mass[indicies]

    yPos <-x@intensity[indicies]+verticalOffset;

    peakLabels <- round(x=xPos, digits=3);

    if (underline) {
        peakLabels <- as.expression(sapply(peakLabels,
                function(x)substitute(underline(a), list(a=x))));
    }

    text(x=xPos, y=yPos, labels=peakLabels, col=col, cex=cex, adj=adj, ...);
});
