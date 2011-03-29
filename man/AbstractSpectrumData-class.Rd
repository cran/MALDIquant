\name{AbstractSpectrumData-class}
\Rdversion{1.1}
\docType{class}
\alias{AbstractSpectrumData-class}
\alias{as.matrix,AbstractSpectrumData-method}
\alias{intensity}
\alias{intensity<-}
\alias{intensity,AbstractSpectrumData-method}
\alias{intensity<-,AbstractSpectrumData-method}
\alias{isEmpty}
\alias{isEmpty,AbstractSpectrumData-method}
\alias{length,AbstractSpectrumData-method}
\alias{lines,AbstractSpectrumData-method}
\alias{mass}
\alias{mass<-}
\alias{mass,AbstractSpectrumData-method}
\alias{mass<-,AbstractSpectrumData-method}
\alias{metaData}
\alias{metaData<-}
\alias{metaData,AbstractSpectrumData-method}
\alias{metaData<-,AbstractSpectrumData-method}

\title{Class "AbstractSpectrumData"}
\description{
\code{\linkS4class{AbstractSpectrumData}} is an abstract (means pure virtual)
class. It is the parent class of \code{\linkS4class{SingleSpectrum}}.
It shouldn't create or handle by the user because it is for internal use only.
}
\section{Derived classes}{
\code{\linkS4class{SinglePeakList}}, 
\code{\linkS4class{SingleSpectrum}}
}
\section{Slots}{
\describe{
    \item{\code{.cache}:}{\code{"environment"}, internal use only}
    \item{\code{mass}:}{\code{"vector"}, mass or mass-to-charge ratio}
    \item{\code{intensity}:}{\code{"vector"}, intensities for measured
        mass-to-charge ratios}
    \item{\code{metaData}:}{\code{"list"}, some metadata to describe the
        spectrum}
}
}
\section{Methods}{
\describe{
    \item{as.matrix}{\code{signature(x = "AbstractSpectrumData")}:
        Converts a \code{\linkS4class{AbstractSpectrumData}} object to a 
        matrix with 2 columns (\code{mass}, \code{intensity}).}
    \item{intensity}{\code{signature(object = "AbstractSpectrumData")}:
        accessor function for slot \code{intensity}.}
    \item{intensity<-}{\code{signature(object = "AbstractSpectrumData")}:
        replacement function for slot \code{intensity}.}
    \item{isEmpty}{\code{signature(object = "AbstractSpectrumData")}:
        returns \code{TRUE} if length of \code{intensity} is 0.}
    \item{length}{\code{signature(x = "AbstractSpectrumData")}:
        Returns length of slot \code{intensity}.}
    \item{lines}{\code{signature(x = "AbstractSpectrumData")}:
        extented function for adding \code{AbstractSpectrumData} object as a 
        line to a specific plot.
        See \code{\link{lines}} for details.}
    \item{mass}{\code{signature(object = "AbstractSpectrumData")}:
        accessor function for slot \code{mass}.}
    \item{mass<-}{\code{signature(object = "AbstractSpectrumData")}:
        replacement function for slot \code{mass}.}
    \item{metaData}{\code{signature(object = "AbstractSpectrumData")}:
        accessor function for slot \code{metaData}.}
    \item{metaData<-}{\code{signature(object = "AbstractSpectrumData")}:
        replacement function for slot \code{metaData}.}
    \item{plot}{\code{signature(x = "AbstractSpectrumData", y = "missing")}:
        extented function for plotting a \code{AbstractSpectrumData} object. 
        See \code{\link{plot,AbstractSpectrumData,missing-method}} for 
        details.
    }
}
}
\references{
See website: \url{http://www.sebastiangibb.de/maldiquant}
}
\author{
Sebastian Gibb
}
\seealso{
\code{\linkS4class{SinglePeakList}},
\code{\linkS4class{SingleSpectrum}},
\code{\link[MALDIquant]{plot,AbstractSpectrumData,missing-method}}
}
\keyword{classes}
