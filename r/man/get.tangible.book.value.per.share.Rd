\name{get.tangible.book.value.per.share}
\alias{get.tangible.book.value.per.share}
\title{Get Tangible Book Value Per Share)}
\author{Ian MacGillivray}
\description{
Returns the tangible book value per share for a vector of seccodes.
}
\usage{
get.tangible.book.value.per.share(dates,seccodes,quarterly=TRUE,most.recent=TRUE)
}
\arguments{
\item{dates}{A vector of dates, aligned with seccodes.}
\item{seccodes}{A vector of seccodes, aligned with dates.}
\item{quarterly}{TRUE if quarterly data are to be returned, FALSE is annualised data are to be returned.}
\item{most.recent}{TRUE if most recent (as opposed to originally filed) results are required.}
}
\examples{
	\dontrun{
		seccodes <- c(33942,6245,55065,55138)
		dates <- seq(as.Date("2011-07-09"), by="1 day", length.out=20)
		get.tangible.book.value.per.share(dates,seccodes)
	}
}
