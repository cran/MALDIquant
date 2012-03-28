\name{estimateNoise-methods}
\docType{methods}
\alias{estimateNoise}
\alias{estimateNoise,MassSpectrum-method}
\title{Estimates the noise of a MassSpectrum object.}
\description{
This methods estimates the noise of mass spectrometry data
(represented by a \code{\linkS4class{MassSpectrum}} object).\cr
Default noise estimation uses the median absolute deviation.
}
\usage{
\S4method{estimateNoise}{MassSpectrum}(object, 
    fun=mad,
    \dots)
}
\arguments{
    \item{object}{\code{\linkS4class{MassSpectrum}} object}
    \item{fun}{used noise estimator (default: \code{\link{mad}}; but every
        function returning a single numeric value or a vector of equal
        size as \code{object} would be possible).
    }
    \item{\dots}{arguments to be passed to \code{fun}}
}
\value{
    Returns a single numeric value or a vector of equal size as \code{object}.
    It depends on the used noise estimator function \code{fun}.
}
\author{
Sebastian Gibb
}
\seealso{
\code{\linkS4class{MassSpectrum}},
\code{\link[MALDIquant]{detectPeaks,MassSpectrum-method}}
}
\examples{
## load library
library("MALDIquant");

## load example data
data("spectra", package="MALDIquant");

## choose only the first mass spectrum
s <- spectra[[1]];

## transform intensities
s <- transformIntensity(s, sqrt);

## remove baseline
s <- removeBaseline(s);

## plot spectrum
plot(s);

## estimate noise 
n <- estimateNoise(s);

## draw noise on the plot
abline(h=n, col="red");
}
\keyword{methods}

