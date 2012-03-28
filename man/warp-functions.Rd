\name{warpMassSpectra}
\alias{warpMassSpectra}
\alias{warpMassPeaks}
\title{
Run warping functions on AbstractMassObject objects.
}
\description{
These functions run warping functions on 
\code{\linkS4class{AbstractMassObject}} objects
(warping is also known as \emph{phase correction}).
}
\usage{
warpMassPeaks(l, w)

warpMassSpectra(l, w)
}
\arguments{
    \item{l}{
        single \code{\linkS4class{MassPeaks}}/\code{\linkS4class{MassSpectrum}}
        object or a list of these objects.
    }
    \item{w}{
        single warping function or a list of warping functions determined by
        \code{\link[MALDIquant]{determineWarpingFunctions}}. Has to be of the
        same length as \code{l}.
    } 
}
\details{
The warping function \code{w} is called in the following way:
\deqn{newMass = oldMass + w(oldMass)}
}
\value{
Returns a single or a \code{\link{list}} 
warped \code{\linkS4class{MassPeaks}} or 
\code{\linkS4class{MassSpectrum}} objects (depending on \code{l}).
}
\references{
See website: \url{http://strimmerlab.org/software/maldiquant/}
}
\author{
Sebastian Gibb
}
\seealso{
\code{\link[MALDIquant]{determineWarpingFunctions}},
\code{\linkS4class{MassPeaks}},
\code{\linkS4class{MassSpectrum}}
}
\examples{
## load library
library("MALDIquant");

## create a MassPeaks object
p <- createMassPeaks(mass=1:5, intensity=1:5);

## simple warping function (see determineWarpingFunctions for details)
simpleWarp <- function(x) { return(1); }

## run warping function
w <- warpMassPeaks(p, simpleWarp);

## compare results
all(mass(w) == mass(p)+1); # TRUE
}
\keyword{methods}

