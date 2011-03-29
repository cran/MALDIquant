\name{estimateBaseline-methods}
\docType{methods}
\alias{estimateBaseline}
\alias{estimateBaseline,SingleSpectrum-method}
\title{Estimates the baseline of a SingleSpectrum object.}
\description{
This methods estimates the baseline of mass spectrometry data
(represented by a \code{\linkS4class{SingleSpectrum}} object).\cr
}
\usage{
\S4method{estimateBaseline}{SingleSpectrum}(object, 
    method=c("SNIP", "ConvexHull", "MovingEstimator"),
    \dots)
}
\arguments{
    \item{object}{\code{\linkS4class{SingleSpectrum}} object}
    \item{method}{a baseline estimation function; see
        \code{\link[MALDIquant]{.estimateBaselineSnip}},
        \code{\link[MALDIquant]{.estimateBaselineConvexHull}},
        \code{\link[MALDIquant]{.estimateBaselineMovingEstimator}}
    }
    \item{\dots}{arguments to be passed to \code{method}}
}
\value{
    Returns a two column matrix (first column: mass, second column: intensity)
    of the estimated baseline.
}
\author{
Sebastian Gibb
}
\seealso{
\code{\linkS4class{SingleSpectrum}},
\code{\link[MALDIquant]{.estimateBaselineSnip}},
\code{\link[MALDIquant]{.estimateBaselineConvexHull}},
\code{\link[MALDIquant]{.estimateBaselineMovingEstimator}},
\code{\link[MALDIquant]{removeBaseline,SingleSpectrum-method}}
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
b <- estimateBaseline(s);

## draw baseline on the plot
lines(b, col="red");
}
\keyword{methods}
