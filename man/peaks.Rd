\name{peaks}
\docType{data}
\alias{peaks}
\title{Example Mass Spectra (extracted peaks)}
\description{
This dataset contains 16 example peak lists. \cr
They are extracted out of \code{\link[MALDIquant]{spectra}}.
It is used to demonstrate the usage of \code{\link{MALDIquant-package}}.
}
\usage{peaks}
\format{A list containing 16 \code{\link[MALDIquant]{MassPeaks-class}}
    objects.}
\seealso{
    \code{\link[MALDIquant]{MassPeaks-class}},
    \code{\link[MALDIquant]{spectra}}
}
\examples{
## generated as follow:

## load library
library("MALDIquant");

## load example data
data("spectra", package="MALDIquant");

## running typical workflow

## transform intensities
t<- lapply(spectra, transformIntensity, fun=sqrt);

## smoothing function
movingAvg <- function(y) {
    return(filter(y, rep(1, 5)/5, sides=2));
}

## smooth spectra
s <- lapply(t, transformIntensity, fun=movingAvg);

## baseline correction
b <- lapply(s, removeBaseline);

## detect peaks
peaks <- lapply(b, detectPeaks);
}
\keyword{datasets}

