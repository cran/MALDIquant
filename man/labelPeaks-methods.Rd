\name{labelPeaks-methods}
\docType{methods}
\alias{labelPeaks}
\alias{labelPeaks,SinglePeakList-method}
\title{Draws peak labels to plot.}
\description{
\code{\link[MALDIquant]{labelPeaks}} draws the corresponding mass values on top of the
peaks stored in a \code{\linkS4class{SinglePeakList}} object to a plot.
}
\usage{
\S4method{labelPeaks}{SinglePeakList}(x,
    number=10, decreasing=TRUE, xlim=c(min(x@mass),
    max(x@mass)), underline=TRUE, upsideDown=FALSE,
    verticalOffset=ceiling(max(x@intensity)/20), col="black", cex=0.7,
    adj=c(0.5, 0),
    \dots)
}
\arguments{
    \item{x}{\code{\linkS4class{SinglePeakList}} object}
    \item{number}{number of peaks to label}
    \item{decreasing}{control sorting; if \code{decreasing == TRUE}
        (\code{decreasing == FALSE}) label the \bold{number} most (less) 
        accumulated intensity}
    \item{xlim}{only label intensity between \code{xlim[1]} and \code{xlim[2]}}
    \item{underline}{underline peak values?}
    \item{upsideDown}{if \code{upsideDown == TRUE} invert peak values}
    \item{verticalOffset}{move label vertically}
    \item{col}{text colour, see \code{\link[graphics]{par}}}
    \item{cex}{font size, see \code{\link[graphics]{par}}}
    \item{adj}{adjust text to the left, center, right and top, center, bottom;
        see \code{\link[graphics]{text}}}
    \item{...}{arguments to be passed to \code{\link[graphics]{text}}}
}
\author{Sebastian Gibb}
\seealso{
    \code{\linkS4class{SinglePeakList}},
    \code{\link[MALDIquant]{plot,AbstractSpectrumData,missing-method}}
}
\examples{
## load library
library("MALDIquant");

## create a SinglePeakList object from scratch
spl <- new("SinglePeakList", mass=1:5, intensity=sample(x=100:10000, size=5),
metaData=list(name="unrealistic example"));

## plot peaks
plot(spl);

## label peaks
labelPeaks(spl);
}
\keyword{methods}
\keyword{Graphics|hplot}
