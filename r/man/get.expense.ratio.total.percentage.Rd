\name{get.expense.ratio.total.percentage}
\alias{get.expense.ratio.total.percentage}
\title{Get Expense Ratio Total Percentage)}
\author{Ian MacGillivray}
\description{
Returns the expense ratio total percentage for a vector of seccodes.
}
\usage{
get.expense.ratio.total.percentage(dates,seccodes,quarterly=TRUE,most.recent=TRUE)
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
		get.expense.ratio.total.percentage(dates,seccodes)
	}
}
