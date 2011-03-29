\name{.estimateBaselineMovingEstimator}
\alias{.estimateBaselineMovingEstimator}
\title{Estimates the baseline by moving estimators.}
\description{
This function estimates the baseline of mass spectrometry data.\cr
The baseline estimation is based on different estimators which are used in a
moving window.\cr
It is hidden by \code{NAMESPACE} because it is a private function and 
\code{\link[MALDIquant]{estimateBaseline,SingleSpectrum-method}} should be used
instead.
}
\usage{
.estimateBaselineMovingEstimator(x, y, 
    windowSize=0.04, relativeWindowSize=TRUE,
    fun=median)
}
\arguments{
    \item{x}{vector of x values}
    \item{y}{vector of y values}
    \item{windowSize}{size of the moving window for the estimator function. \cr
        If \code{relativeWindowSize} is \code{TRUE} the window 
        is created \code{windowSize/2*100\%} left and right of the current 
        mass-to-charge value. E.g. on 1000 Da the window ranges from 980 Da to
        1020 Da for \code{windowSize==0.04}. After some steps of moving 4000 Da
        is reached and the window ranges from 3920 Da to 4080 Da. (should be
        \code{0 < windowSize < 1}) \cr
        If \code{relativeWindowSize} is \code{FALSE} the window size 
        is fixed and equal for all data points. E.g. \code{windowSize==201}
        creates a window from \code{mass[cur_index-100]} to
        \code{mass[cur_index+100]}. (should be odd)}
    \item{relativeWindowSize}{logical, use relative window size based on
        mass-to-charge ratio or use fixed window size.}
    \item{fun}{used estimator (default: \code{\link{median}}; 
        \code{\link{min}}, \code{\link{quantile}} or something else 
        would be possible, too)}
}
\value{
    Returns a two column matrix (first column: mass, second column: intensity)
    of the estimated baseline.
}
\author{
Sebastian Gibb
}
\seealso{
\code{\linkS4class{SingleSpectrum}},
\code{\link[MALDIquant]{estimateBaseline,SingleSpectrum-method}},
\code{\link[MALDIquant]{removeBaseline,SingleSpectrum-method}}
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

## estimate different baselines
b1 <- estimateBaseline(s, method="MovingEstimator");
b2 <- estimateBaseline(s, method="MovingEstimator", windowSize=201,
                       relativeWindowSize=FALSE, fun=min);

## draw baselines on the plot
lines(b1, col=2);
lines(b2, col=3);

## draw legend
legend(x="topright", lwd=1, legend=c("median", "min"), col=c(2, 3));
}
