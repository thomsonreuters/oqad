\name{get.seccodes.for.rics}
\alias{get.seccodes.for.rics}
\title{Get seccodes for RICs}
\author{Sameena Shah, Ian MacGillivray}
\description{
For a given set of RICs, returns a lookup table between those RICs and seccodes (QAD's internal identifiers)
}
\usage{
get.seccodes.for.rics(rics)
}
\arguments{
\item{rics}{A vector of RICs.}
}
\examples{
	\dontrun{
		rics <- c("MS.N","BAC.N","GS.N","GE.N","AAPL.OQ","TRI.N")
		get.seccodes.for.rics(rics)
	}
}