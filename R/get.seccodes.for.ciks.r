#' #This source code is provided under the BSD license and is provided AS IS with no warranty or guarantee of fit for purpose.  See the project's LICENSE.txt for details.
#' #Copyright Thomson Reuters 2013. All rights reserved.

#' @author Sameena Shah 
#' @param ciks ciks 
#' @return data.frame 
#' @export
get.seccodes.for.ciks  	<-	function(ciks){
	conn <- get.qad.connection()

	query 		<-	sprintf("select CIKNO, seccode from qai.dbo.RKDFndCmpRef ref join qai.dbo.rkdfndcmprefissue iss on iss.code = ref.Code and IssueOrder = 1 and IssueTypeCode = 'C' join qai.dbo.SecMap p on p.VenCode = iss.IssueCode and VenType = 29 and Rank =1 and Exchange=1 WHERE exchcode in ('NYSE','NASD','AMEX')")
	data			<- 	sqlQuery(conn,query)
	colnames(data) <- c("cik","seccode")
	data <- data[paste(ciks),]
	data <- data[!is.na(data$ciks),]
	return(data)
}
