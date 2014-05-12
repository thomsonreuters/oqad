#' #This source code is provided under the BSD license and is provided AS IS with no warranty or guarantee of fit for purpose.  See the project's LICENSE.txt for details.
#' #Copyright Thomson Reuters 2013. All rights reserved.
#' @return returns the COA's and their descriptions from RKD data
#' @author Sameena Shah 
#' @export
get.coas.and.descriptions <- function()
{
	query <- "SELECT DISTINCT coa, desc_ as description FROM RKDFndStdItem ORDER BY description"
	conn <- get.qad.connection()
	return(sqlQuery(conn,query))
}
