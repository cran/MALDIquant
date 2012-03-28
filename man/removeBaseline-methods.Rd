\name{removeBaseline-methods}
\docType{methods}
\alias{removeBaseline}
\alias{removeBaseline,MassSpectrum-method}
\title{Removes the baseline of a MassSpectrum object.}
\description{
This method removes the baseline of mass spectrometry data
(represented by a \code{\linkS4class{MassSpectrum}} object).\cr
The intensity of the mass spectrometry data would be reduced by 
\code{baseline}.
}
\usage{
\S4method{removeBaseline}{MassSpectrum}(object,
    baseline,
    \dots)
}
\arguments{
    \item{object}{\code{\linkS4class{MassSpectrum}} object}
    \item{baseline}{a two column matrix with intensities (y-values) as second
        column. If no baseline argument is given the baseline would be estimate
        automatically by calling
        \code{\link[MALDIquant]{estimateBaseline,MassSpectrum-method}}.}
    \item{\dots}{arguments to be passed to
        \code{\link[MALDIquant]{estimateBaseline,MassSpectrum-method}}}
}
\value{
    Returns a modified \code{\linkS4class{MassSpectrum}} object with reduced
    intensities.
}
\references{
See website: \url{http://strimmerlab.org/software/maldiquant/}
}
\author{
Sebastian Gibb
}
\seealso{
\code{\linkS4class{MassSpectrum}},
\code{\link[MALDIquant]{estimateBaseline,MassSpectrum-method}}
}
\examples{
## load library
library("MALDIquant");

## load example data
data("spectra", package="MALDIquant");

## choose only the first mass spectrum
s <- spectra[[1]];

## plot spectrum
plot(s);

## subtract baseline 
b <- removeBaseline(s);

## draw modified spectrum on the plot
lines(b, col="blue");
}
\keyword{methods}

