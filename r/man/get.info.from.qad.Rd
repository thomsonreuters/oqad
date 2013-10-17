\name{get.info.from.qad}
\alias{get.info.from.qad}
\title{Get Info From Qad)}
\author{Ian MacGillivray}
\description{
A generic method to execute a QAD query and return the results in a standard format. Used by many of the package's information gathering methods.
}
\usage{
get.info.from.qad(dates,seccodes,query,result.column,date.column,seccode.column,per.seccode=1)
}
\arguments{
\item{dates}{A vector of dates, aligned with seccodes.}
\item{seccodes}{A vector of seccodes, aligned with dates.}
\item{query}{A QAD database query.}
\item{result.column}{The result column of the query.}
\item{date.column}{The date column of the query.}
\item{seccode.column}{The seccode column of the query.}
\item{per.seccode}{Whether to query the database once per seccode, rather than making a query with no WHERE clause for seccodes and trimming it in R. Setting this to 1 (true) provides optimisation for small numbers of seccodes. Default is 1 (true).}
}
\examples{
	\dontrun{
		dates <- seq(as.Date("2011-01-01"),length.out=31,by="1 day")
		seccodes <- c(33942,6245,55065,55138)
		# Get adj daily close
		query  <-  sprintf("SELECT cast(P.MarketDate as Date) as date,Close_,Close_*CumAdjFactor as adj,s.seccode FROM SECMSTR s JOIN SECMAP t ON s.SECCODE=t.SECCODE AND t.VENTYPE=34 AND Type_=1 join DS2PRIMQTPRC P ON t.VENCODE=p.INFOCODE JOIN DS2ADJ A ON A.INFOCODE=P.INFOCODE AND ADJTYPE=2 AND P.MARKETDATE BETWEEN ADJDATE AND ISNULL(ENDADJDATE,'06/06/2025') WHERE P.MarketDate between '\%s' and '\%s' and ExchIntCode in (12,135,145,244) and rank=1 and Close_ is not null ",dates[1],dates[length(dates)])
		get.info.from.qad(dates, seccodes, query, "adj", per.seccode=0)
	}
}