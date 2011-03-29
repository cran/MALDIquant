\name{removeBaseline-methods}
\docType{methods}
\alias{removeBaseline}
\alias{removeBaseline,SingleSpectrum-method}
\title{Removes the baseline of a SingleSpectrum object.}
\description{
This method removes the baseline of mass spectrometry data
(represented by a \code{\linkS4class{SingleSpectrum}} object).\cr
The intensity of the mass spectrometry data would be reduced by 
\code{baseline}.
}
\usage{
\S4method{removeBaseline}{SingleSpectrum}(object,
    baseline=NULL,
    \dots)
}
\arguments{
    \item{object}{\code{\linkS4class{SingleSpectrum}} object}
    \item{baseline}{a two column matrix with intensities (y-values) as second
        column. If no baseline argument is given the baseline would be estimate
        automatically by calling
        \code{\link[MALDIquant]{estimateBaseline,SingleSpectrum-method}}.}
    \item{\dots}{arguments to be passed to
        \code{\link[MALDIquant]{estimateBaseline,SingleSpectrum-method}}}
}
\value{
    Returns a modified \code{\linkS4class{SingleSpectrum}} object with reduced
    intensities.
}
\references{
See website: \url{http://www.sebastiangibb.de/maldiquant}
}
\author{
Sebastian Gibb
}
\seealso{
\code{\linkS4class{SingleSpectrum}},
\code{\link[MALDIquant]{estimateBaseline,SingleSpectrum-method}},
\code{\link{loess}}
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

## subtract baseline 
ms <- removeBaseline(s);

## draw modified spectrum on the plot
lines(ms, col="blue");
}
\keyword{methods}
