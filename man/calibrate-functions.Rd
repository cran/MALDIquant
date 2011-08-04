\name{calibrate}
\alias{calibrate}
\title{Calibrates MassObject objects.}
\description{
This function calibrates intensities of 
\code{\linkS4class{AbstractMassObject}} objects.
}
\usage{
calibrate(l, 
    method=c("TIC"),
    \dots)
}
\arguments{
    \item{l}{
        \code{list} of \code{\linkS4class{AbstractMassObject}} objects.
    }
    \item{method}{a calibration method, currently only "TIC" (= total ion
        current) is supported.}
    \item{\dots}{arguments to be passed to \code{method} (useless in the current
        development status).}
}
\value{
Returns a \code{\link{list}} of calibrated
\code{\linkS4class{AbstractMassObject}} objects.
}
\author{
Sebastian Gibb
}
\seealso{
\code{\linkS4class{AbstractMassObject}},
}
\examples{
## load library
library("MALDIquant");

## load example data
data("sA1", package="MALDIquant");

## remove baseline
b <- lapply(sA1, removeBaseline);

## calibrate using TIC
s <- calibrate(b, method="TIC");

## show intensity details
summary(intensity(b[[1]])); ## no calibration
summary(intensity(s[[1]])); ## TIC calibration
}
\keyword{methods}
