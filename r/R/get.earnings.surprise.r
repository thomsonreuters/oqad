# This source code is provided under the BSD license and is provided AS IS with no warranty or guarantee of fit for purpose.  See the project's LICENSE.txt for details.
# Copyright Thomson Reuters 2013. All rights reserved.

get.earnings.surprise  <-	function(dates,seccodes){
	dates <- as.character(dates)	
	start.date <- min(dates)
	end.date <- max(dates)

	query   	<-  	sprintf("SELECT cast(A.PERDATE as date),A.PerType,H.MEAN AS MEAN_ESTIMATE,A.RPTDATE AS date, A.VALUE_ AS eps,A.VALUE_ - H.MEAN AS surprise, s.seccode FROM qai.DBO.SECMSTR S JOIN qai.DBO.SECMAP M ON M.SECCODE=S.SECCODE AND M.VENTYPE=1 AND M.RANK=1 JOIN qai.DBO.IBDACTL1 A ON A.CODE=M.VENCODE JOIN qai.DBO.IBESESTL1 H ON H.CODE=A.CODE AND H.MEASURE=A.MEASURE AND H.PERDATE=A.PERDATE AND H.PERIOD=6 AND H.ESTDATE=(SELECT MAX(ESTDATE) FROM qai.DBO.IBESESTL1 WHERE CODE=H.CODE AND MEASURE=H.MEASURE AND PERDATE=H.PERDATE AND PERIOD=H.PERIOD AND PERTYPE=H.PERTYPE) JOIN qai.dbo.Ibesmsrcode msr ON A.measure=msr.measureCode AND msr.measure='EPS' WHERE RptDate BETWEEN '%s' AND '%s'", start.date, end.date)
	
	query <- paste(query, "AND s.seccode=%s")

	surprise <- get.info.from.qad(dates, seccodes, query, "surprise")
	surprise[surprise<=-99999] <- NA

	return(surprise)	
}
