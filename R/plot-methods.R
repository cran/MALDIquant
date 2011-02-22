## $Id: plot-methods.R 414 2011-02-22 17:11:25Z sgibb $
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
setMethod(f="plot", 
    signature=signature(x="AbstractSpectrumData", y="missing"),
    definition=function(x, col="black", xlab="mass", ylab="intensity",
        type="l", xlim=c(min(x@mass), max(x@mass)), 
        ylim=c(0, max(x@intensity)), main=x@metaData$name, 
        sub=x@metaData$file, cex.sub=0.75, col.sub="#808080", 
        abline.col="#808080", ...) {

    plot(x=x@mass, y=x@intensity, col=col, type=type, xlab=xlab, ylab=ylab, 
        xlim=xlim, ylim=ylim, main=main, sub=sub, cex.sub=cex.sub,
        col.sub=col.sub, ...);
    abline(h=0, col=abline.col);
});

