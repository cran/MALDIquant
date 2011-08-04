\name{isMassObjectList}
\alias{isMassObjectList}
\alias{isMassSpectrumList}
\alias{isMassPeaksList}
\title{
Tests a list of AbstractMassObject objects.
}
\description{
These functions test a \code{\link{list}} whether containing
\code{\linkS4class{AbstractMassObject}} objects.
}
\usage{
isMassObjectList(l)

isMassSpectrumList(l)

isMassPeaksList(l)
}
\arguments{
    \item{l}{
        \code{list}, object to be tested. 
    }
}
\value{
Returns \code{\link{TRUE}} of \code{\link{FALSE}} depending on whether its
argument is a \code{\link{list}} of \code{\linkS4class{AbstractMassObject}} objects.
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
\code{\linkS4class{AbstractMassObject}}
}
\examples{
## load library
library("MALDIquant");

## create list
peakList <- list();

## test list
isMassPeaksList(peakList); ## returns FALSE

## create two MassPeaks objects and add them to the list
peakList[[1]] <- createMassPeaks(mass=1:100, intensity=rnorm(100)^2,
metaData=list(name="unrealistic example 1"));
peakList[[2]] <- createMassPeaks(mass=1:100, intensity=rnorm(100)^2,
metaData=list(name="unrealistic example 2"));

## test list
isMassPeaksList(peakList); ## returns TRUE 
}
\keyword{methods}
