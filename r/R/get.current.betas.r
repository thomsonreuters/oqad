# This source code is provided under the BSD license and is provided AS IS with no warranty or guarantee of fit for purpose.  See the project's LICENSE.txt for details.
# Copyright Thomson Reuters 2013. All rights reserved.

get.current.betas <-	function(seccodes){
	conn <- get.qad.connection()
	qa.betas 		<- 	matrix(NA, 1,length(seccodes))
	colnames(qa.betas)<- 	paste(seccodes)

	query 		<-	sprintf("select distinct SecCode, Beta from qai.dbo.IBQSIG i join qai.dbo.SecMap p on p.VenCode  = I.Code and VenType=1 and Rank=1")
	data			<- 	sqlQuery(conn,query)
	rownames(data)	<-	data[,1]
	seccodes.common 	<-	intersect(seccodes,data[,1])
	qa.betas[1,paste(seccodes.common)]	<-	data[paste(seccodes.common),2]
	qa.betas[qa.betas[1,]==-9999]		<-	NA
	return(qa.betas)
}
