# This source code is provided under the BSD license and is provided AS IS with no warranty or guarantee of fit for purpose.  See the project's LICENSE.txt for details.
# Copyright Thomson Reuters 2013. All rights reserved.

get.sector.ibes   	<-	function(dates,seccodes){
	dates <- as.character(dates)

	sector  		      <- 	matrix(NA, length(dates), length(seccodes))
	colnames(sector) 	<-	paste(seccodes)
	rownames(sector) 	<-	paste(dates)
	conn <- get.qad.connection()

	for(i in paste(dates)){
		query 			<-  	sprintf("select distinct seccode, sector from qai.dbo.Ibeshist3 i join qai.dbo.secmap on ventype=1 and VenCode=Code and rank=1 and Date_ = (select max(i2.Date_) from qai.dbo.ibeshist3 i2 where i.code=i2.code and Date_ <= '%s' )",i)
		sector.large		<- 	sqlQuery(conn,query)
		rownames(sector.large) 	<-	sector.large$seccode
		sector.common		<-	intersect(seccodes,sector.large$seccode)
		sector.sub			<- 	sector.large[paste(sector.common),]
		sector[paste(i),paste(sector.common)]	<-	sector.large[paste(sector.common),2]
	}
	
	return(sector)
}
