\name{SinglePeakList-class}
\Rdversion{1.1}
\docType{class}
\alias{SinglePeakList-class}

\title{Class "SinglePeakList"}
\description{
\code{\linkS4class{SinglePeakList}} represents extracted peaks of a single
spectrum of a MALDI/TOF mass spectrometry measurement.
It should provide an easy framework for doing processing steps like peak
alignment, normalization, classification and so on. \cr
}
\section{Objects from the Class}{
}
\section{Extends}{
Class \code{\linkS4class{AbstractSpectrumData}}, directly.
}
\section{Methods}{
\describe{
    \item{labelPeaks}{\code{signature(x = "SinglePeakList")}:
        Draws peak labels to plot.
        See \code{\link{labelPeaks,SinglePeakList-method}} for 
        details.}
}
}
\references{
See website: \url{http://www.sebastiangibb.de/maldiquant}
}
\author{
Sebastian Gibb
}
\seealso{
\code{\link[MALDIquant]{labelPeaks,SinglePeakList-method}},
\code{\linkS4class{AbstractSpectrumData}}
}
\examples{
## load library
library("MALDIquant");
}
\keyword{classes}
