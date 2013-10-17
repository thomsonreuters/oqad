\name{get.current.betas}
\alias{get.current.betas}
\title{Get Current Betas}
\author{Ian MacGillivray}
\description{
Returns the current beta for a vector of seccodes.
}
\usage{
get.current.betas(seccodes)
}
\arguments{
\item{seccodes}{A vector of seccodes.}
}
\examples{
	\dontrun{
		seccodes <- c(33942,6245,55065,55138)
		get.current.betas(seccodes)
	}
}