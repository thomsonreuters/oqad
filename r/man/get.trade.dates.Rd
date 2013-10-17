\name{get.trade.dates}
\alias{get.trade.dates}
\title{Get Trade Dates}
\author{Ian MacGillivray}
\description{
Accepts a vector of dates and returns a vector of the next valid trading dates for these.
}
\usage{
get.trade.dates(dates)
}
\arguments{
\item{dates}{A vector of dates (of any type accepted by as.Date from the zoo package).}
}
\examples{
	\dontrun{
		dates <- seq(as.Date("2011-01-01"), by="1 day", length.out=31)

		# Full output
		get.trade.dates(dates)

		# All valid trading dates in January 2011
		unique(get.trade.dates(dates))
	}
}