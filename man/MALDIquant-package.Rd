\name{MALDIquant-package}
\alias{MALDIquant-package}
\alias{MALDIquant}
\docType{package}
\title{
Quantitative analysis of MALDI-TOF MS data
}
\description{
This package is intended to provide an easy-to-use framework for quantitative
analysis of MALDI-TOF mass spectrometry data.

MALDIquant is currently under active development. Features available in future
versions include peak alignment, quantitative calibration and 
classification so that MALDIquant is useful for clinical diagnostics.
}
\details{
\tabular{ll}{
Package: \tab MALDIquant\cr
Version: \tab 0.4\cr
Date: \tab 2011-08-04\cr
License: \tab GPL (>= 3)\cr
URL: \tab http://strimmerlab.org/software/maldiquant/\cr
}

Main classes:

\code{\linkS4class{MassPeaks}}: Represents a peak list of a single
spectrum.\cr
\code{\linkS4class{MassSpectrum}}: Represents a single spectrum.\cr
}

\author{
Sebastian Gibb

Maintainer: Sebastian Gibb <mail@sebastiangibb.de>
}
\references{
See website: \url{http://strimmerlab.org/software/maldiquant/}
}
\examples{
## load library
library("MALDIquant");

## load example data
data("sA1", package="MALDIquant");

## show some information
sA1

## running typical workflow

## transform intensities
t <- lapply(sA1, transformIntensity, fun=sqrt);

## smoothing function
movingAvg <- function(y) {
    ma <- rep(1, 5)/5;
    return(filter(y, ma, sides=2));
}

## smooth spectra
s <- lapply(t, transformIntensity, fun=movingAvg);

## baseline correction
b <- lapply(s, removeBaseline);

## detect peaks
p <- lapply(b, detectPeaks);

## plot results
par(mfcol=c(3, length(sA1)));
for (i in seq(along=sA1)) {
    plot(sA1[[i]], main="raw spectrum");
    plot(s[[i]], main="transformed (sqrt) and smoothed (ma5)");
    plot(b[[i]], main="baseline removed and peaks detected");
    points(p[[i]], pch=4, col=2);
}
par(mfrow=c(1, 1));
}
\keyword{package}
\seealso{
\code{\linkS4class{MassPeaks}},
\code{\linkS4class{MassSpectrum}}
}
