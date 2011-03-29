\name{.estimateBaselineConvexHull}
\alias{.estimateBaselineConvexHull}
\title{Estimates the baseline by a Convex Hull.}
\description{
This function estimates the baseline of mass spectrometry data.\cr
The baseline estimation is based on creating a Convex Hull below the
spectrum.\cr
It is hidden by \code{NAMESPACE} because it is a private function and 
\code{\link[MALDIquant]{estimateBaseline,SingleSpectrum-method}} should be used
instead.
}
\usage{
.estimateBaselineConvexHull(x, y)
}
\arguments{
    \item{x}{vector of x values}
    \item{y}{vector of y values}
}
\value{
    Returns a two column matrix (first column: mass, second column: intensity)
    of the estimated baseline.
}
\details{
    See \code{\link[fdrtool]{gcmlcm}} for details.
}
\author{
Sebastian Gibb
}
\seealso{
\code{\linkS4class{SingleSpectrum}},
\code{\link[MALDIquant]{estimateBaseline,SingleSpectrum-method}},
\code{\link[MALDIquant]{removeBaseline,SingleSpectrum-method}},
\code{\link[fdrtool]{gcmlcm}}
}
\examples{
## load library
library("MALDIquant");

## load readBrukerFlexData library for fid file import 
## (is also done automatically by importSingleSpectrum)
library("readBrukerFlexData");

## get examples directory
exampleDirectory <- system.file("Examples", package="readBrukerFlexData");

## read example spectrum
s <- importSingleSpectrum(file.path(exampleDirectory,
    "2010_05_19_Gibb_C8_A1/0_A1/1/1SLin/fid"));

## plot spectrum
plot(s);

## estimate baseline
b <- estimateBaseline(s, method="ConvexHull");

## draw baseline on the plot
lines(b, col="red");
}
