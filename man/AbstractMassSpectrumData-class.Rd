\name{AbstractMassSpectrumData-class}
\Rdversion{1.1}
\docType{class}
\alias{AbstractMassSpectrumData-class}
\alias{as.matrix,AbstractMassSpectrumData-method}
\alias{intensity}
\alias{intensity<-}
\alias{intensity,AbstractMassSpectrumData-method}
\alias{intensity<-,AbstractMassSpectrumData-method}
\alias{isEmpty}
\alias{isEmpty,AbstractMassSpectrumData-method}
\alias{length,AbstractMassSpectrumData-method}
\alias{lines,AbstractMassSpectrumData-method}
\alias{mass}
\alias{mass<-}
\alias{mass,AbstractMassSpectrumData-method}
\alias{mass<-,AbstractMassSpectrumData-method}
\alias{metaData}
\alias{metaData<-}
\alias{metaData,AbstractMassSpectrumData-method}
\alias{metaData<-,AbstractMassSpectrumData-method}
\alias{points,AbstractMassSpectrumData-method}

\title{Class "AbstractMassSpectrumData"}
\description{
\code{\linkS4class{AbstractMassSpectrumData}} is an abstract (means pure virtual)
class. It is the parent class of \code{\linkS4class{MassSpectrum}}.
It shouldn't create or handle by the user because it is for internal use only.
}
\section{Derived classes}{
\code{\linkS4class{MassPeaks}}, 
\code{\linkS4class{MassSpectrum}}
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
    \item{as.matrix}{\code{signature(x = "AbstractMassSpectrumData")}:
        Converts an \code{\linkS4class{AbstractMassSpectrumData}} object to a 
        matrix with 2 columns (\code{mass}, \code{intensity}).}
    \item{intensity}{\code{signature(object = "AbstractMassSpectrumData")}:
        Accessor function for slot \code{intensity}.}
    \item{intensity<-}{\code{signature(object = "AbstractMassSpectrumData")}:
        Replacement function for slot \code{intensity}.}
    \item{isEmpty}{\code{signature(object = "AbstractMassSpectrumData")}:
        Returns \code{TRUE} if length of \code{intensity} is 0.}
    \item{length}{\code{signature(x = "AbstractMassSpectrumData")}:
        Returns length of slot \code{intensity}.}
    \item{lines}{\code{signature(x = "AbstractMassSpectrumData")}:
        Extented function for adding \code{AbstractMassSpectrumData} object as a 
        line to a specific plot.
        See \code{\link{lines}} for details.}
    \item{mass}{\code{signature(object = "AbstractMassSpectrumData")}:
        Accessor function for slot \code{mass}.}
    \item{mass<-}{\code{signature(object = "AbstractMassSpectrumData")}:
        Replacement function for slot \code{mass}.}
    \item{metaData}{\code{signature(object = "AbstractMassSpectrumData")}:
        Accessor function for slot \code{metaData}.}
    \item{metaData<-}{\code{signature(object = "AbstractMassSpectrumData")}:
        Replacement function for slot \code{metaData}.}
    \item{plot}{\code{signature(x = "AbstractMassSpectrumData", y = "missing")}:
        Extented function for plotting an \code{AbstractMassSpectrumData} object. 
        See \code{\link{plot,AbstractMassSpectrumData,missing-method}} for 
        details.}
    \item{points}{\code{signature(x = "AbstractMassSpectrumData")}:
        Extented function for adding
        \code{\linkS4class{AbstractMassSpectrumData}} object as points
        to a specific plot.
        See \code{\link{points}} for details.}
    \item{transformIntensity}{\code{signature(object = "AbstractMassSpectrumData")}:
        Transforms the intensities of an \code{AbstractMassSpectrumData} object. 
        See \code{\link{transformIntensity,AbstractMassSpectrumData-method}} for 
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
\code{\linkS4class{MassPeaks}},
\code{\linkS4class{MassSpectrum}},
\code{\link[MALDIquant]{plot,AbstractMassSpectrumData,missing-method}},
\code{\link[MALDIquant]{transformIntensity,AbstractMassSpectrumData-method}}
}
\keyword{classes}
