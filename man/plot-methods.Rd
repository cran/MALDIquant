\name{plot-methods}
\docType{methods}
\alias{plot,AbstractSpectrumData,missing-method}
\alias{plot,SingleSpectrum,missing-method}
\title{Plots a \code{\linkS4class{SingleSpectrum}} object.}
\description{
This is an overloaded method to allow plotting of a
\code{\linkS4class{SingleSpectrum}} object.
}
\usage{
\S4method{plot}{AbstractSpectrumData,missing}(x, col="black", 
     xlab="mass", ylab="intensity", 
     type="l", xlim=c(min(x@mass), max(x@mass)), 
     ylim=c(0, max(x@intensity)), main=x@metaData$name, 
     sub=x@metaData$file, cex.sub=0.75, col.sub="#808080", 
     abline.col="#808080", \dots)
}
\arguments{
    \item{x}{\code{\linkS4class{SingleSpectrum}} object}
    \item{col}{line colour, see \code{\link[graphics]{par}}}
    \item{xlab}{title for the x-axis, see \code{\link[graphics]{title}}}
    \item{ylab}{title for the y-axis, see \code{\link[graphics]{title}}}
    \item{type}{type of plot: see \code{\link[graphics]{plot}}}
    \item{xlim}{the x limits (x1, x2) of the plot, see
        \code{\link[graphics]{plot.default}}}
    \item{ylim}{the y limits (y1, y2) of the plot, see
        \code{\link[graphics]{plot.default}}}
    \item{main}{title for the plot, see \code{\link[graphics]{title}}}
    \item{sub}{sub title for the plot, see \code{\link[graphics]{title}}}
    \item{cex.sub}{sub title font size, see \code{\link[graphics]{par}}}
    \item{col.sub}{sub title color, see \code{\link[graphics]{par}}}
    \item{abline.col}{colour for horizontal line at y=0}
    \item{\dots}{arguments to be passed to \code{\link[graphics]{plot}}}
}
\references{
See website: \url{http://www.sebastiangibb.de/maldiquant}
}
\author{
Sebastian Gibb
}
\seealso{
\code{\link{importSingleSpectrum}}
}
\examples{
## create a SingleSpectrum object by default constructor
s <- createSingleSpectrum(mass=1:100, intensity=rnorm(100)^2,
metaData=list(name="unrealistic example"));

## show some details
s;

## plot spectrum
plot(s);
}
\keyword{methods}
\keyword{Graphics|hplot}
