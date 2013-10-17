\name{get.licensed.tables}
\alias{get.licensed.tables}
\title{Get Licensed Tables}
\author{Sameena Shah, Ian MacGillivray}
\description{
Returns a list of all QAD tables the current session is licensed to view.
}
\usage{
get.licensed.tables(dbName="QAI")
}
\arguments{
\item{dbName}{The database name to query for licensed tables}
}
\note{
By default, QAD provides access to all tables, but simply returns no rows for those tables for which a user is not licensed. This function checks for the presence of data in finding licensed tables.
}
\examples{
	\dontrun{
		get.licensed.tables()
	}
}