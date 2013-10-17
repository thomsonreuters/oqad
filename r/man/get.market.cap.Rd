\name{get.market.cap}
\alias{get.market.cap}
\title{Get Market Cap}
\author{Ian MacGillivray, Sameena Shah}
\description{
Returns Market Capitalization for a given set of seccodes on a given set of dates.
}
\usage{
get.market.cap(dates,seccodes)
}
\arguments{
\item{dates}{A vector of dates, aligned with seccodes.}
\item{seccodes}{A vector of seccodes, aligned with dates.}
}
\note{
Market Cap values are returned in millions (1 = 1000000), and will only be returned on valid trading dates.
}
\examples{
	\dontrun{
		seccodes <- c(33942,6245,55065,55138)
		dates <- seq(as.Date("2011-07-09"), by="1 day", length.out=20)
		get.market.cap(dates,seccodes)
	}
}