# This source code is provided under the BSD license and is provided AS IS with no warranty or guarantee of fit for purpose.  See the project's LICENSE.txt for details.
# Copyright Thomson Reuters 2013. All rights reserved.

get.market.cap  <-	function(dates,seccodes){
	dates <- as.character(dates)
	start.date <- min(dates)
	end.date <- max(dates)

	query <- sprintf("SELECT R.SecCode AS seccode, V.ConsolMktVal AS mcap, V.ValDate AS date FROM qai.dbo.SECMSTR R JOIN qai.dbo.SECMAP P ON R.SECCODE=P.SECCODE AND P.VENTYPE=34 and Type_=1 JOIN qai.dbo.Ds2MktVal V ON P.VenCode=V.infocode WHERE ValDate BETWEEN '%s' AND '%s'",start.date,end.date)

	query <- paste(query, "AND R.SecCode=%s")
	
	return(get.info.from.qad(dates, seccodes, query, "mcap"))
}
