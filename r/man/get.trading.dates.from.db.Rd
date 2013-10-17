\name{get.trading.dates.from.db}
\alias{get.trading.dates.from.db}
\title{Get Trade Dates from DB}
\author{Ian MacGillivray}
\description{
Returns Market Dates as defined in QAD between a given start and end date.
}
\usage{
get.trading.dates.from.db(start.date, end.date)
}
\arguments{
\item{start.date}{The earliest trading date to get.}
\item{end.date}{The latest trading date to get.}
}
\note{
If end.date is not a valid trading date, the final item in the return vector will be the next trading day after end.date.
}
\examples{
	\dontrun{
		get.trading.dates.from.db(conn,"2010-01-01","2010-02-01")
	}
}