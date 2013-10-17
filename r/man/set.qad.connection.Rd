\name{set.qad.connection}
\alias{set.qad.connection}
\title{Set QAD Connection}
\author{Ian MacGillivray}
\description{
	Sets the connection to your QAD database, used extensively throughout the library. This method must be called before any data can be retreived from QAD. See \code{\link{example.connection}} for an example function.
}
\usage{
set.qad.connection(func, ...)
}
\arguments{
	\item{func}{A function which returns a valid connection to a QAD database.}
	\item{...}{Additional arguments to func.}
}
\seealso{
	\code{\link{get.qad.connection}}
	\code{\link{example.connection}}
}
\examples{
	\dontrun{
		set.qad.connection(example.connection, "127.0.0.1", "ian", "password1", "database=qai")
	}
}