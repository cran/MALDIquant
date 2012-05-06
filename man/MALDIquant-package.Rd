\name{MALDIquant-package}
\alias{MALDIquant-package}
\alias{MALDIquant}
\docType{package}
\title{
Quantitative Analysis of Mass Spectrometric Data
}
\description{
MALDIquant provides a complete analysis pipeline for MALDI-TOF and other 
mass spectrometric data. Distinctive features include baseline subtraction 
using the SNIP algorithm, peak alignment using warping functions, 
handling of replicated measurements as well as allowing spectra with 
different resolutions. 

For a first overview run \code{demo("MALDIquant")}.
}
\details{
\tabular{ll}{
Package: \tab MALDIquant\cr
Version: \tab 1.1\cr
Date: \tab 2012-05-06\cr
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
S. Gibb and K. Strimmer. 2012.  
\emph{MALDIquant: a versatile R package for the analysis of mass spectrometric data.}
\url{http://arxiv.org/abs/1203.5885}.

See website: \url{http://strimmerlab.org/software/maldiquant/}
}
\seealso{
\code{\linkS4class{MassPeaks}},
\code{\linkS4class{MassSpectrum}}
}
\examples{
## load library
library("MALDIquant");

## load example data
data("fiedler2009subset", package="MALDIquant");

## choose only a smaller subset
spectra <- fiedler2009subset[1:2];

## show some information
spectra

## running typical workflow

## transform intensities
t <- transformIntensity(spectra, fun=sqrt);

## smoothing function
movingAvg <- function(y) {
    ma <- rep(1, 5)/5;
    return(filter(y, ma, sides=2));
}

## smooth spectra
s <- transformIntensity(t, fun=movingAvg);

## baseline correction
b <- removeBaseline(s);

## detect peaks
p <- detectPeaks(b);

## plot results
par(mfcol=c(3, length(spectra)));
for (i in seq(along=spectra)) {
    plot(spectra[[i]], main="raw spectrum");
    plot(s[[i]], main="transformed (sqrt) and smoothed (ma5)");
    plot(b[[i]], main="baseline removed and peaks detected");
    points(p[[i]], pch=4, col=2);
}
par(mfrow=c(1, 1));

## bin peaks
bp <- binPeaks(p);

## show intensity matrix
intensityMatrix(bp);
}
\keyword{package}

