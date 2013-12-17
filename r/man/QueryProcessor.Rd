\name{QueryProcessor}
\alias{QueryProcessor}
\title{Ad hoc query processing}
\description{
  Performs an ad hoc query against the indicated data source and returns a
  data frame containing the query results.
}
\usage{
QueryProcessor(name,query)
}
\arguments{
  \item{name}{The name of an ODBC connection defined in the connection file.}
  \item{query}{The SQL query to be sent to the ODBC connection.}
}

\details{

The function finds the named ODBC connection in the connections file, and
pulls from the connection the DSN, username, and password. 

The connection to the data source is established, the query is run, and the 
connection is closed.

The value of the query is returned as a data frame. The user is responsible for 
transforming columns to the appropriate data types (dates, numeric, etc.).

An error is thrown if the \code{CONNECTION_FILE} variable is not defined
(it must point to the XML connection file), or if named connection is not found.
If the query is syntactically incorrect, the error from the server will be 
returned in the result.
}

\value{
  Returns an object of class \code{data.frame}.
}

\author{Jeff Kenyon \email{jeff.kenyon@thomsonreuters.com}}
\examples{
\dontrun{
CONNECTION_FILE <- "C:/Development/rqad/Connections.xml"
query1 <- QueryProcessor("QA_DIRECT",
   "select Close_ from ds2primqtprc where infocode = 65011 and marketdate = '2013-03-11'")
}
}

