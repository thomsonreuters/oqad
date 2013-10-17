\name{get.reported.return.on.assets}
\alias{get.reported.return.on.assets}
\title{Get Reported Return On Assets)}
\author{Ian MacGillivray}
\description{
Returns the reported return on assets for a vector of seccodes.
}
\usage{
get.reported.return.on.assets(dates,seccodes,quarterly=TRUE,most.recent=TRUE)
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
		get.reported.return.on.assets(dates,seccodes)
	}
}
