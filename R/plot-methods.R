## $Id: plot-methods.R 659 2011-07-20 12:11:47Z sgibb $
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

## AbstractMassObject 
setMethod(f="plot", 
    signature=signature(x="AbstractMassObject", y="missing"),
    definition=function(x, col="black", xlab="mass", ylab="intensity",
        type=ifelse(is(object=x, class2="MassPeaks"), "h", "l"),
        xlim=c(ifelse(length(x@mass)>0, min(x@mass), 0),
               ifelse(length(x@mass)>0, max(x@mass), 1)),
        ylim=c(0, ifelse(length(x@intensity>0), max(x@intensity), 1)),
        main=x@metaData$name, sub=x@metaData$file, cex.sub=0.75, 
        col.sub="#808080", 
        abline.col="#808080", ...) {

    plot(x=x@mass, y=x@intensity, col=col, type=type, xlab=xlab, ylab=ylab, 
        xlim=xlim, ylim=ylim, main=main, sub=sub, cex.sub=cex.sub, 
        col.sub=col.sub, ...);
    abline(h=0, col=abline.col);
});

