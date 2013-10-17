\name{get.unadj.daily.close}
\alias{get.unadj.daily.close}
\title{Get Unadjusted Daily Close}
\description{
Gets the daily close prices for a given set of seccodes in a given date range.
}
\usage{
get.unadj.daily.close(dates,seccodes,per.seccode=1)
}
\arguments{
\item{dates}{A vector of dates for which prices are to be retrieved.}
\item{seccodes}{A vector of dates for which prices are to be retrieved.}
\item{per.seccode}{Whether to query the database once per seccode, rather than making a query with no WHERE clause for seccodes and trimming it in R. Setting this to 1 (true) provides optimisation for small numbers of seccodes. Default is 1 (true).}
}
\examples{
	\dontrun{
		# Dummy data
		seccodes <- c(33942,6245,55065,55138)
		dates <- seq(as.Date("2011-01-01"),length.out=31,by="1 day")

		get.unadj.daily.close(dates, seccodes, per.seccode=1)
	}
}