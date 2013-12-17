\name{ExecuteStandardQuery}
\alias{ExecuteStandardQuery}
\title{Execute a non-project-specific (library) query}
\description{
  Pull a query from the library's \\queries sub-directory, do the appropriate
  substitutions, and execute. This method helps drive queries into a
  declarative form, where they can more easily be maintained.
}
\usage{
ExecuteStandardQuery(queryName, VERBOSE=FALSE, ...)
}
\arguments{
  \item{queryName}{The name of the query in the library (omit the .xml extension).}
  \item{VERBOSE}{Additional output to console during execution.}
  \item{...}{Query-specific arguments, to be substituted into query text.}
}

\details{

As an alternative to creating a large number of library functions to perform
common data retrievals, this package provides a single function through which
all non-project specific queries are run. These queries are described in
XML, and provided as part of this library's distribution (in the \\queries
sub-directory).

This function is a wrapper on ExecuteQuery(), which can be used to run
queries, defined in XML, in a project directory. This method should be used
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
result <- ExecuteStandardQuery("EquityIndexSearch",VERBOSE=TRUE,SEARCH_TERM="DJSI")
}
}

