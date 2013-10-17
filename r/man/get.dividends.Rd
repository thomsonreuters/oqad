\name{get.dividends}
\alias{get.dividends}
\title{Get Dividends}
\author{Ian MacGillivray}
\description{
Returns dividends for a given set of seccodes on a given set of dates.
}
\usage{
get.dividends(dates,seccodes)
}
\arguments{
\item{dates}{A vector of dates, aligned with seccodes.}
\item{seccodes}{A vector of seccodes, aligned with dates.}
}
\examples{
	\dontrun{
		seccodes <- c(33942,6245,55065,55138)
		dates <- seq(as.Date("2011-07-09"), by="1 day", length.out=20)
		get.dividends(dates,seccodes)
	}
}