\name{MassPeaks-class}
\Rdversion{1.1}
\docType{class}
\alias{MassPeaks}
\alias{MassPeaks-class}

\title{Class "MassPeaks"}
\description{
\code{\linkS4class{MassPeaks}} represents extracted peaks of a single
spectrum of a MALDI/TOF mass spectrometry measurement.
In future it should provide an easy framework for doing processing steps like 
peak alignment, normalization, classification and so on. 
Until now only some plotting functions available.\cr
}
\section{Objects from the Class}{
\code{\link[MALDIquant]{createMassPeaks}}: Creates a
\code{\linkS4class{MassPeaks}} object.
}
\section{Extends}{
Class \code{\linkS4class{AbstractMassSpectrumData}}, directly.
}
\section{Methods}{
\describe{
    \item{labelPeaks}{\code{signature(x = "MassPeaks")}:
        Draws peak labels to plot.
        See \code{\link{labelPeaks,MassPeaks-method}} for 
        details.}
}
}
\references{
See website: \url{http://strimmerlab.org/software/maldiquant/}
}
\author{
Sebastian Gibb
}
\seealso{
\code{\link[MALDIquant]{createMassPeaks}},
\code{\link[MALDIquant]{labelPeaks,MassPeaks-method}},
\code{\linkS4class{AbstractMassSpectrumData}}
}
%\examples{
%## load library
%library("MALDIquant");
%}
\keyword{classes}
