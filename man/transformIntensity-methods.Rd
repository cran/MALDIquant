\name{transformIntensity-methods}
\docType{methods}
\alias{transformIntensity}
\alias{transformIntensity,AbstractMassSpectrumData-method}
\alias{transformIntensity,MassSpectrum-method}
\title{Transforms Intensities of an AbstractMassSpectrumData object.}
\description{
This methods performs a transformation (e.g. sqrt-transformation) on the
intensities of an \code{\linkS4class{AbstractMassSpectrumData}} object.
}
\usage{
\S4method{transformIntensity}{AbstractMassSpectrumData}(object,
     fun, na.rm = TRUE,
     \dots)
}
\arguments{
    \item{object}{\code{\linkS4class{MassSpectrum}} object}
    \item{fun}{used transformation function (\code{\link{sqrt}}, 
        \code{\link{log10}}, \code{\link{log}} or something else 
        would be possible)}
    \item{na.rm}{logical, indicating whether \sQuote{NA} values should be
        removed}
    \item{\dots}{arguments to be passed to \code{fun}} 
}
\details{
\code{\link[MALDIquant]{transformIntensity}} is a shortcut for transforming
intensities manually. \cr
\preformatted{

    ## doing things by hand
    newMassSpectrum <- singleSpectrum1;
    intensity(newMassSpectrum) <- sqrt(intensity(singleSpectrum1));

    ## the code above could replaced by the following line
    newMassSpectrum <- transformIntensity(singleSpectrum1, fun=sqrt);
}
}
\references{
See website: \url{http://strimmerlab.org/software/maldiquant/}
}
\author{
Sebastian Gibb
}
\seealso{
\code{\linkS4class{AbstractMassSpectrumData}},
\code{\linkS4class{MassSpectrum}}
}
\examples{
## load library
library("MALDIquant");

## load example data
data("sA1", package="MALDIquant");

## choose only the first mass spectrum
s <- sA1[[1]];

## transform spectrum
t <- transformIntensity(s, fun=sqrt);

## plot spectrum
par(mfrow=c(2, 1));
plot(s, main="raw spectrum");
plot(t, main="transformed spectrum");
par(mfrow=c(1, 1));
}
\keyword{methods}
