\name{example.connection}
\alias{example.connection}
\title{An example QAD Connection}
\author{Sameena Shah}
\description{
	Provides a template for a SQL Server connection to your QAD database, to be used in \code{\link{set.qad.connection}}.
}
\usage{
	example.connection(server, uid, pwd, other)
}
\arguments{
	\item{server}{A SQL Server hostname.}
	\item{uid}{A username.}
	\item{pwd}{A password.}
	\item{other}{Other arguments to the connection string, such as a database name.}
}
\seealso{
	\code{\link{set.qad.connection}}
}
\examples{
	\dontrun{ 
		set.qad.connection(rqad:::example.connection, "127.0.0.1", "ian", "password1", "database=qai")
	}
}