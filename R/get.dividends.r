#' #This source code is provided under the BSD license and is provided AS IS with no warranty or guarantee of fit for purpose.  See the project's LICENSE.txt for details.
#' #Copyright Thomson Reuters 2013. All rights reserved.
#' @param dates dates for which dividends are needed
#' @param seccodes seccodes for which divs are needed 
#' @author Sameena Shah 
#' @return matrix
#' @import sqldf
#' @export
get.dividends  <- 	function(dates,seccodes){
	dividends 			<- 	matrix(NA, length(dates),length(seccodes))
	colnames(dividends)	<- 	paste(seccodes)
	rownames(dividends) 	<- 	paste(dates)

	conn <- get.qad.connection()
	query 		<-  	sprintf("SELECT seccode,DivRate,EffectiveDate FROM qai.dbo.DS2DIV D JOIN qai.dbo.DS2CTRYQTINFO I ON D.INFOCODE=I.INFOCODE JOIN qai.dbo.DS2XREF X ON X.CODE=D.DIVTYPECODE AND X.TYPE_=8 join qai.dbo.secmap p on p.vencode=I.infocode and ventype=34 WHERE EffectiveDate between '%s' and SYSDATETIME() order by seccode,EffectiveDate desc",dates[1])
	data			<- 	sqlQuery(conn,query)

	for(i in paste(dates)){
		elig 		<- 	data[as.Date(data[,'EffectiveDate']) > i,]
		if(dim(elig)[1]){
			td		<- 	sqldf("SELECT seccode, SUM(divrate) FROM elig GROUP BY seccode")	
			rownames(td)<- 	td[,1]
			seccodes.comm 	<-	intersect(seccodes,rownames(td))
			td.comm	<-	td[paste(seccodes.comm),]
			dividends[paste(i),paste(td.comm[,1])] <- td.comm[,2]		
		}
	}
	
	return(dividends)
}
