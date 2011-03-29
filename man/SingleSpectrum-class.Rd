\name{SingleSpectrum-class}
\Rdversion{1.1}
\docType{class}
\alias{SingleSpectrum-class}

\title{Class "SingleSpectrum"}
\description{
\code{\linkS4class{SingleSpectrum}} represents a single spectrum of a MALDI/TOF
mass spectrometry measurement. It should provide an easy framework for doing 
some preprocessing steps like peak detection, baseline correction and
something like that. \cr
Up to now only import and plot of a \code{\linkS4class{SingleSpectrum}} object
is supported.
}
\section{Objects from the Class}{
\code{\link[MALDIquant]{createSingleSpectrum}}: Creates a
\code{\linkS4class{SingleSpectrum}} object.

\code{\link[MALDIquant]{importSingleSpectrum}}: Reads a single mass spectrum from file and
creates a \code{\linkS4class{SingleSpectrum}} object.
}
\section{Extends}{
Class \code{\linkS4class{AbstractSpectrumData}}, directly.
}
\section{Methods}{
\describe{
    \item{removeBaseline}{\code{signature(x = "SingleSpectrum")}:
        Estimates and removes the baseline of a
        \code{\linkS4class{SingleSpectrum}} object.
        See \code{\link[MALDIquant]{removeBaseline,SingleSpectrum-method}} for 
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
\code{\link[MALDIquant]{createSingleSpectrum}},
\code{\link[MALDIquant]{importSingleSpectrum}},
\code{\link[MALDIquant]{removeBaseline,SingleSpectrum-method}},
\code{\linkS4class{AbstractSpectrumData}}
}
\examples{
## load library
library("MALDIquant");

## create a SingleSpectrum object by default constructor
s <- createSingleSpectrum(mass=1:100, intensity=rnorm(100)^2,
    metaData=list(name="unrealistic example"));

## show some details
s;

## plot spectrum
plot(s);

## modify intensity and metaData
intensity(s)[1:50] <- 0;
metaData(s) <- list(name="modified example");

## plot again
plot(s);
}
\keyword{classes}
