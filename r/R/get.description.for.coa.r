# This source code is provided under the BSD license and is provided AS IS with no warranty or guarantee of fit for purpose.  See the project's LICENSE.txt for details.
# Copyright Thomson Reuters 2013. All rights reserved.

get.description.for.coa <- function(coa)
{
	query <- sprintf("SELECT Desc_ as description FROM qai.dbo.RKDFndStdItem WHERE coa = '%s'", coa)
	conn <- get.qad.connection()
	return(sqlQuery(conn,query))
}
