\name{ExecuteQuery}
\alias{ExecuteQuery}
\title{Execute a query, as defined in an XML file}
\description{
  Process a query defined using XML, do the appropriate
  substitutions, and execute. This method helps drive queries into a
  declarative form, where they can more easily be maintained.
}
\usage{
ExecuteQuery(queryXmlFileName, ...)
}
\arguments{
  \item{queryXmlFileName}{The full XML file name of the query.}
  \item{...}{Query-specific arguments, to be substituted into query text.}
}

\details{

This function is used to run queries, defined in XML. This method should be used
in preference to storing queries in code and doing the parameter substitution
directly.

The intent is to isolate query knowledge with declarative (XML) files that can
be more easily modified, with additional descriptive information. Presumably,
the files can be used to generate a human-readable catalog of available library/
sample queries.
 
}

\value{
  Returns a data frame containing the results of the query execution.
}

\author{Jeff Kenyon \email{jeff.kenyon@thomsonreuters.com}}
\examples{
\dontrun{
CONNECTION_FILE <- "C:/Development/rqad/Connections.xml"
result <- ExecuteQuery("C:/MyProject/queries/EquityIndexSearch.xml",VERBOSE=TRUE,SEARCH_TERM="DJSI")
}
}

