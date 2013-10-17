\name{get.eps}
\alias{get.eps}
\title{Get Earnings per Share}
\author{Ian MacGillivray}
\description{
Returns Earnings per Share for a given set of seccodes on a given set of dates.
}
\usage{
get.eps(dates,seccodes)
}
\arguments{
\item{dates}{A vector of dates, aligned with seccodes.}
\item{seccodes}{A vector of seccodes, aligned with dates.}
}
\note{
EPS values will only be returned on dates when earnings were released.
}
\examples{
	\dontrun{
		seccodes <- c(33942,6245,55065,55138)
		dates <- seq(as.Date("2011-07-09"), by="1 day", length.out=20)
		get.eps(dates,seccodes)
	}
}