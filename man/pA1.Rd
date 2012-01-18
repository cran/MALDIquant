\name{pA1}
\docType{data}
\alias{pA1}
\title{Example Mass Spectra (extracted peaks)}
\description{
This dataset contains two example peak lists (they are technical
replicates). This peak lists are extracted out of \code{\link[MALDIquant]{sA1}}.
It is used to demonstrate the usage of \code{\link{MALDIquant-package}}.
}
\usage{pA1}
\format{A list containing two \code{\link[MALDIquant]{MassPeaks-class}}
    objects.}
\seealso{
    \code{\link[MALDIquant]{MassPeaks-class}},
    \code{\link[MALDIquant]{sA1}}
}
\examples{
## generated as follow:

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
pA1 <- lapply(b, detectPeaks);
}
\keyword{datasets}
