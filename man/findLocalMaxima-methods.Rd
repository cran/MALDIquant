\name{findLocalMaxima-methods}
\docType{methods}
\alias{findLocalMaxima}
\alias{findLocalMaxima,MassSpectrum-method}
\title{Find local maxima in a MassSpectrum object.}
\description{
This methods looks for local maxima in mass spectrometry data
(represented by a \code{\linkS4class{MassSpectrum}} object).\cr
}
\usage{
\S4method{findLocalMaxima}{MassSpectrum}(object, 
    halfWindowSize=20);
}
\arguments{
    \item{object}{\code{\linkS4class{MassSpectrum}} object}
    \item{halfWindowSize}{half window size\cr
        The resulting window reaches from \code{mass[cur_index-halfWindowSize]}
        to \code{mass[cur_index+halfWindowSize]}.}
}
\value{
    Returns a two column matrix (first column: mass, second column: intensity)
    of the founded maxima. 
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
data("sA1", package="MALDIquant");

## choose only the first mass spectrum
s <- sA1[[1]];

## transform intensities
s <- transformIntensity(s, sqrt);

## remove baseline
s <- removeBaseline(s);

## plot spectrum
plot(s);

## find local maxima
m <- findLocalMaxima(s);

## draw maxima on the plot
points(m, col="red");
}
\keyword{methods}
