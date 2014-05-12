#' #This source code is provided under the BSD license and is provided AS IS with no warranty or guarantee of fit for purpose.  See the project's LICENSE.txt for details.
#' #Copyright Thomson Reuters 2013. All rights reserved.
#' @author Sameena Shah 
#' @param dates dates 
#' @param seccodes seccodes 
#' @param type type 
#' @param quarterly quarterly 
#' @param most.recent most.recent 
#' @export
get.info.from.rkd <- function(dates, seccodes, type, quarterly=TRUE, most.recent=TRUE)
{
	if(quarterly)
		perTypeCode <- 2
	else
		perTypeCode <- 1  #Annual

	query <- sprintf("SELECT cast(fin.PerEndDt as date) as date, cast(fin.StmtDt as date),  Desc_, COA, Value_,UnitsConvToCode, seccode 
	FROM qai.dbo.RKDFndStdFinVal fin
	JOIN qai.dbo.RKDFndCmpRefIssue ref ON ref.Code = fin.code 
	JOIN qai.dbo.SecMap s ON s.vencode = ref.IssueCode AND ventype = 29 
	JOIN qai.dbo.RKDFndStdItem item ON item.Item = fin.Item
	JOIN qai.dbo.rkdfndstdperfiling per ON per.code = fin.code AND per.perenddt = fin.perenddt AND per.pertypecode = fin.pertypecode AND per.stmtdt = fin.stmtdt
	JOIN qai.dbo.RKDFndStdPeriod std ON std.Code = per.Code and std.PerEndDt = per.PerEndDt
	WHERE RANK = 1 AND fin.perTypeCode = %s AND per.PerTypeCode = %s AND std.PerTypeCode = 1
	AND (coa='%s' OR Desc_ = '%s')", perTypeCode, perTypeCode, type, type)
	
	query <- paste(query, "AND seccode = '%s' ORDER BY fin.StmtDt")
	
	if(most.recent)
		query <- paste(query, "DESC")
  
	return(get.info.from.qad(dates, seccodes, query, "Value_"))
}
