\name{ReplaceQueryParameters}
\alias{ReplaceQueryParameters}
\title{Replace parameter values in a query with values from a hash table}
\description{
  Take a query string and a hash of parameter values and make substitutions.
}
\usage{
ReplaceQueryParameters(query,queryParameters)
}
\arguments{
  \item{query}{Text string representing a query.}
  \item{queryParameters}{Hash (a list) containing parameters and substitution values.}
}

\details{

Utility function to wrap complexity in replacing ad hoc query parameter values with
program variables.

Query parameters are passed as a list with individual elements named. 
}

\value{
  Returns the query string with value substitutions made. Note that it does NOT
  check to ensure that all parameters are substituted.
}

\author{Jeff Kenyon \email{jeff.kenyon@thomsonreuters.com}}
\examples{
\dontrun{
PullBenchmarkIndex <- gsub("\n", " ", "
SELECT E.DsIndexMnem,E.Region,E.IndexDesc,D.*
FROM DS2EQUITYINDEX E
JOIN DS2INDEXDATA D ON E.DSINDEXCODE = D.DSINDEXCODE
WHERE E.DSIndexMnem = '\%INDEX_MNEMONIC\%'
AND VALUEDATE BETWEEN '\%START_DATE\%' AND '\%END_DATE\%'
ORDER BY VALUEDATE
")

queryParameters <- list()
queryParameters["\%START_DATE\%"] <- "2013-01-01"
queryParameters["\%END_DATE\%"] <- "2013-06-30"
queryParameters["\%INDEX_MNEMONIC\%"] <- "DJINDUS"
query <- PullBenchmarkIndex
query <- ReplaceQueryParameters(query,queryParameters)
}
}

