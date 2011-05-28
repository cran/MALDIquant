\name{labelPeaks-methods}
\docType{methods}
\alias{labelPeaks}
\alias{labelPeaks,MassPeaks-method}
\title{Draws peak labels to plot.}
\description{
\code{\link[MALDIquant]{labelPeaks}} draws the corresponding mass values on top of the
peaks stored in a \code{\linkS4class{MassPeaks}} object to a plot.
}
\usage{
\S4method{labelPeaks}{MassPeaks}(object, index,
    digits=3, underline=TRUE, 
    verticalOffset=ceiling(max(object@intensity)/200), 
    adj=c(0.5, 0), cex=0.7, family="sans", 
    \dots)
}
\arguments{
    \item{object}{\code{\linkS4class{MassPeaks}} object}
    \item{index}{vector, index of peaks to label}
    \item{digits}{integer, number of decimal places}
    \item{underline}{logical, underline peak values?}
    \item{verticalOffset}{numeric, move label vertically}
    \item{adj}{numeric, adjust text to the left, center, right and top, center, bottom;
        see \code{\link[graphics]{text}}}
    \item{cex}{numeric, font size, see \code{\link[graphics]{par}}}
    \item{family}{name of font family, see \code{\link[graphics]{par}}}
    \item{...}{arguments to be passed to \code{\link[graphics]{text}}}
}
\author{Sebastian Gibb}
\seealso{
    \code{\linkS4class{MassPeaks}},
    \code{\link[MALDIquant]{plot,AbstractMassSpectrumData,missing-method}}
}
\examples{
## load library
library("MALDIquant");

## create a MassPeaks object from scratch
p <- new("MassPeaks", mass=1:20, intensity=sample(x=100:10000, size=20), 
         metaData=list(name="unrealistic example"));

## plot peaks
plot(p);

## label the first 5 peaks
labelPeaks(p, index=1:5);

## label all peaks in mass range 15 to 20 
## (index=15:20 would be easier but sometimes you don't know the correct values)
labelPeaks(p, index=which(mass(p) >= 15 & mass(p) <= 20), underline=FALSE);

## label highest peaks (top 5)
top5 <- intensity(p) \%in\% sort(intensity(p), decreasing=TRUE)[1:5];
labelPeaks(p, index=top5, col="red");
}
\keyword{methods}
\keyword{Graphics|hplot}
