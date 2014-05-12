#' #This source code is provided under the BSD license and is provided AS IS with no warranty or guarantee of fit for purpose.  See the project's LICENSE.txt for details.
#' #Copyright Thomson Reuters 2013. All rights reserved.
#' Get the list of tables permissioned 
#' @author Sameena Shah 
#' @param dbName database name string 
#' @return tables  permissioned  
#' @export

get.licensed.tables <- function(dbName="QAI"){
	query <- sprintf("SELECT CASE O.UID WHEN 1 THEN 'DBO' WHEN 5 THEN 'PRC' ELSE '' END AS SCHEMA_OWNER, O.NAME AS TABLE_NAME, I.ROWS AS TABLE_ROWCOUNT FROM %s..SYSOBJECTS O JOIN %s..SYSINDEXES I ON O.ID = I.ID WHERE O.XTYPE = 'U' AND I.INDID < 2 AND O.NAME NOT LIKE '%%_CHANGES' AND I.ROWS > 0 ORDER BY O.NAME", dbName, dbName)
						
	conn <- get.qad.connection()
    data  <-  sqlQuery(conn,query)
	
	tables <- as.character(data[,"TABLE_NAME"])
	
    return(tables)
}
