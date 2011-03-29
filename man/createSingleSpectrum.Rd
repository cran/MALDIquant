\name{createSingleSpectrum}
\alias{createSingleSpectrum}
\title{
Creates a SingleSpectrum object.
}
\description{
This function creates a \code{\linkS4class{SingleSpectrum}} object. Normally it
shouldn't called by the user. Use \code{\link[MALDIquant]{importSingleSpectrum}} instead.
}
\usage{
createSingleSpectrum(mass, intensity, metaData = list())
}
\arguments{
    \item{mass}{
        \code{"vector"}, mass or mass-to-charge ratio
    }
    \item{intensity}{
        \code{"vector"}, intensities for measured mass-to-charge ratios
    }
    \item{metaData}{
        \code{"list"}, some metadata to describe the spectrum
    }
}
\value{
Returns a \code{\linkS4class{SingleSpectrum}} object.
}
\references{
See website: \url{http://www.sebastiangibb.de/maldiquant}
}
\author{
Sebastian Gibb
}
\seealso{
\code{\link[MALDIquant]{importSingleSpectrum}}
}
\examples{
## load library
library("MALDIquant");

## create a SingleSpectrum object by default constructor
s <- createSingleSpectrum(mass=1:100, intensity=rnorm(100)^2,
metaData=list(name="unrealistic example"));

## show some details
s;
}
\keyword{methods}
