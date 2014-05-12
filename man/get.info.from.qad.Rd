\name{get.info.from.qad}
\alias{get.info.from.qad}
\title{#This source code is provided under the BSD license and is provided AS IS with no warranty or guarantee of fit for purpose.  See the project's LICENSE.txt for details.
#Copyright Thomson Reuters 2013. All rights reserved.}
\usage{
get.info.from.qad(dates, seccodes, query, result.column, date.column = "date",
  seccode.column = "seccode", per.seccode = 1)
}
\arguments{
  \item{dates}{Either dates or start.date and end.date}

  \item{seccodes}{Allow seccodes to be all, one, or a list}

  \item{query}{string}

  \item{result.column}{string}

  \item{date.column}{string}

  \item{seccode.column}{string}

  \item{per.seccode}{numeric}
}
\value{
matrix
}
\description{
#This source code is provided under the BSD license and is
provided AS IS with no warranty or guarantee of fit for
purpose.  See the project's LICENSE.txt for details.
#Copyright Thomson Reuters 2013. All rights reserved.
}
\author{
Ian MacGillivray and Sameena Shah # Check if seccodes are
null or na or contain any NA # Check if dates contain Na or
are null
}

