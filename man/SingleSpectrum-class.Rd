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
\code{\link{createSingleSpectrum}}: Creates a
\code{\linkS4class{SingleSpectrum}} object.

\code{\link{importSingleSpectrum}}: Reads a single mass spectrum from file and
creates a \code{\linkS4class{SingleSpectrum}} object.
}
\section{Slots}{
  \describe{
    \item{\code{mass}:}{\code{"vector"}, mass or mass-to-charge ratio}
    \item{\code{intensity}:}{\code{"vector"}, intensities for measured
    mass-to-charge ratios}
    \item{\code{metaData}:}{\code{"list"}, some metadata to describe the
    spectrum}
  }
}
\section{Methods}{
\code{\link[MALDIquant]{plot,SingleSpectrum,missing-method}}: Plots a 
\code{\linkS4class{SingleSpectrum}} object.
}
\references{
See website: \url{http://www.sebastiangibb.de/maldiquant}
}
\author{
Sebastian Gibb
}
\seealso{
\code{\link{createSingleSpectrum}},
\code{\link{importSingleSpectrum}},
\code{\link[MALDIquant]{plot,SingleSpectrum,missing-method}}
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
\keyword{classes}
