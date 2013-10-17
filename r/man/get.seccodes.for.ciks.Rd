\name{get.seccodes.for.ciks}
\alias{get.seccodes.for.ciks}
\title{Get seccodes for CIKs}
\author{Sameena Shah, Ian MacGillivray}
\description{
For a given set of CIKs, returns a lookup table between those CIKs and seccodes (QAD's internal identifiers)
}
\usage{
get.seccodes.for.ciks(ciks)
}
\arguments{
\item{ciks}{A vector of CIKs.}
}
\examples{
	\dontrun{
		ciks <- c(921183,320017,815910,945446)	
		get.seccodes.for.ciks(ciks)
	}
}