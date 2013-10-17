\name{get.current.ratio}
\alias{get.current.ratio}
\title{Get Current Ratio)}
\author{Ian MacGillivray}
\description{
Returns the current ratio for a vector of seccodes.
}
\usage{
get.current.ratio(dates,seccodes,quarterly)
}
\arguments{
\item{dates}{A vector of dates, aligned with seccodes.}
\item{seccodes}{A vector of seccodes, aligned with dates.}
\item{quarterly}{TRUE if quarterly data are to be returned, FALSE is annualised data are to be returned.}
}
\examples{
	\dontrun{
		seccodes <- c(33942,6245,55065,55138)
		dates <- seq(as.Date("2011-07-09"), by="1 day", length.out=20)
		get.current.ratio(dates,seccodes)
	}
}
