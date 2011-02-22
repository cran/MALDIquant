\name{importSingleSpectrum}
\alias{importSingleSpectrum}
\title{
Imports/Reads a single mass spectrum from file.
}
\description{
This function reads a single mass spectrum from file and creates a
\code{\linkS4class{SingleSpectrum}} object.
It depends on some other packages:

\tabular{ll}{
\bold{file type/extension:} \tab \bold{needed package:} \cr
Bruker Daltonics \emph{fid} file \tab \pkg{readBrukerFlexData} \cr
\emph{mzXML}: *.mzXML, *.xml \tab \pkg{readMzXmlData} \cr
}
}
\usage{
importSingleSpectrum(file, verbose = FALSE, ...)
}
\arguments{
  \item{file}{
  Path to file which should be read.
}
  \item{verbose}{
  Logical. Print verbose messages?
}
  \item{\dots}{
  Arguments to be passed to import functions. For details please see
  \code{\link[readBrukerFlexData]{readBrukerFlexFile}} and/or
  \code{\link[readMzXmlData]{readMzXmlFile}}.
}
}
\value{
Returns a \code{\linkS4class{SingleSpectrum}} object.
}
\references{
See website: \url{http://www.sebastiangibb.de/maldiquant}
}
\author{
Sebastian Gibb
}
\seealso{
\code{\link{createSingleSpectrum}},
\code{\link[MALDIquant]{plot,SingleSpectrum,missing-method}},
\code{\link[readBrukerFlexData]{readBrukerFlexFile}},
\code{\link[readMzXmlData]{readMzXmlFile}}.
}
\examples{
## load library (is also done automatically by importSingleSpectrum)
library(readBrukerFlexData);

## get examples directory
exampleDirectory <- system.file("Examples", package="readBrukerFlexData");

## read example spectrum
s <- importSingleSpectrum(file.path(exampleDirectory,
    "2010_05_19_Gibb_C8_A1/0_A1/1/1SLin/fid"));

## show some details
s;

## plot spectrum
plot(s);
}
\keyword{IO|files}
