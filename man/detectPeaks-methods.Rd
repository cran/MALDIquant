\name{detectPeaks-methods}
\docType{methods}
\alias{detectPeaks}
\alias{detectPeaks,MassSpectrum-method}
\title{Detects peaks in a MassSpectrum object.}
\description{
This method looks for peaks in mass spectrometry data
(represented by a \code{\linkS4class{MassSpectrum}} object).\cr
A peak is a local maximum above a user defined noise threshold.
}
\usage{
\S4method{detectPeaks}{MassSpectrum}(object,
    localMaxima, noise, SNR=2,
    \dots)
}
\arguments{
    \item{object}{\code{\linkS4class{MassSpectrum}} object}
    \item{localMaxima}{a two column matrix with intensities (y-values) as second
        column. If no \code{localMaxima} argument is given the local maxima
        would be searched automatically by calling
        \code{\link[MALDIquant]{findLocalMaxima,MassSpectrum-method}}.}
    \item{noise}{single numeric value or vector of same size as \code{object}.
        If no \code{noise} argument is given the noise
        would be estimated automatically by calling
        \code{\link[MALDIquant]{estimateNoise,MassSpectrum-method}}.}
    \item{SNR}{single numeric value. \code{SNR} is an abbreviation for
        \emph{s}ignal-to-\emph{n}oise-\emph{r}atio. A local maximum has to 
        be higher than \code{SNR*noise} to be recognize as peak.}
    \item{\dots}{arguments to be passed to
        \code{\link[MALDIquant]{findLocalMaxima,MassSpectrum-method}} or
        \code{\link[MALDIquant]{estimateNoise,MassSpectrum-method}}}
}
\value{
    Returns a \code{\linkS4class{MassPeaks}} object.
}
\references{
See website: \url{http://strimmerlab.org/software/maldiquant/}
}
\author{
Sebastian Gibb
}
\seealso{
\code{\linkS4class{MassPeaks}},
\code{\linkS4class{MassSpectrum}},
\code{\link[MALDIquant]{estimateNoise,MassSpectrum-method}}
\code{\link[MALDIquant]{findLocalMaxima,MassSpectrum-method}},
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

## call peak detection
p <- detectPeaks(s);

## draw peaks on the plot
points(p);

## label 10 highest peaks
top10 <- intensity(p) \%in\% sort(intensity(p), decreasing=TRUE)[1:10];
labelPeaks(p, index=top10);
}
\keyword{methods}

