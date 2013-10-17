\name{get.holidays}
\alias{get.holidays}
\title{Get Holidays}
\author{Sameena Shah}
\description{
Retreives a vector of US holidays between given dates.
}
\usage{
get.holidays(start.date, end.date)
}
\arguments{
\item{start.date}{The earliest holiday date to return.}
\item{end.date}{The latest holiday date to return.}
}
\examples{
	\dontrun{
		get.holidays("2010-01-01","2011-07-04")
	}
}