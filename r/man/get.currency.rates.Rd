\name{get.currency.rates}
\alias{get.currency.rates}
\title{Get Currency Rates}
\author{Sameena Shah, Ian MacGillivray}
\description{
Returns historical or current currency exchange rates for specified currencies in a given time period.
}
\usage{
get.currency.rates(start.date,end.date,from.curr,to.curr,rate.type='SPOT')
}
\arguments{
\item{start.date}{The start of the date range.}
\item{end.date}{The end of the date range.}
\item{from.curr}{The from currency in this rate, or 'all' for all.}
\item{to.curr}{The to currency in this rate, or 'all' for all.}
\item{rate.type}{The rate type, default SPOT. Use e.g. 1MFD for one month forward.}
}
\examples{
	\dontrun{
		get.currency.rates('2011-01-01','2011-02-01','all','usd','SPOT')
		get.currency.rates('2011-01-01','2011-02-08','gbp','usd','1mfd')
	}
}