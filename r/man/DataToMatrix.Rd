\name{DataToMatrix}
\alias{DataToMatrix}
\title{Transform query data to matrix}
\description{
  Take query data (one row/observation per line) and format it as a matrix.
}
\usage{
DataToMatrix(queryResults,dateColumn,identifierColumn,dataColumn,eliminateWeekends=FALSE)
}
\arguments{
  \item{queryResults}{Query results, e.g., result from QueryProcessor.}
  \item{dateColumn}{Column number for date (rows in output matrix).}
  \item{identifierColumn}{Column number for identifiers (columns in output matrix).}
  \item{dataColumn}{Column number for data items (values in output matrix).}
  \item{eliminateWeekends}{Boolean to check for and delete rows of NA values (weekends).}
}

\details{

The function takes the data frame produced by a database query and produces
a matrix of a single value. The same query may produce multiple matrices (for
example, if a query returns, for a given equity on a given date, values for 
price, currency, FXRate, adjustment factor, etc.). 

If the eliminateWeekends argument is used, rows of exclusively NA values are
removed from the matrix. Note that situations where the resulting matrix is
0 or 1 columns could cause some seriously wonky results, so you may want to
leave the default (FALSE) in place, and deal with weekend rows in your program
instead.

The function is compiled for greater speed. It could probably also be made 
parallel at some point, but I haven't done that yet.
}

\value{
  Returns an object of class \code{matrix} with named rows and columns.
}

\author{Jeff Kenyon \email{jeff.kenyon@thomsonreuters.com}}
\examples{
\dontrun{
CONNECTION_FILE <- "C:/Development/rqad/Connections.xml"
query1 <- QueryProcessor("QA_DIRECT",
   paste("select infocode,marketdate,Close_ from ds2primqtprc ",
     "where infocode = 65011 ",
     "and marketdate between '2013-03-11' and '2013-03-22'",sep=""))
priceMatrix <- DataToMatrix(query1, 2, 1, 3)
}
}

