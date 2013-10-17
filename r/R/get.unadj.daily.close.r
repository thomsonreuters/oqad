# This source code is provided under the BSD license and is provided AS IS with no warranty or guarantee of fit for purpose.  See the project's LICENSE.txt for details.
# Copyright Thomson Reuters 2013. All rights reserved.

get.unadj.daily.close  <- 	function(dates,seccodes,per.seccode=1){

	query       <-  sprintf("SELECT cast(P.MarketDate as Date) as date,Close_ as unadj,s.seccode FROM SECMSTR s JOIN SECMAP t ON s.SECCODE=t.SECCODE AND t.VENTYPE=34 AND Type_=1 join DS2PRIMQTPRC P ON t.VENCODE=p.INFOCODE JOIN DS2ADJ A ON A.INFOCODE=P.INFOCODE AND ADJTYPE=2 AND P.MARKETDATE BETWEEN ADJDATE AND ISNULL(ENDADJDATE,'06/06/2025') WHERE P.MarketDate between '%s' and '%s' and ExchIntCode in (12,135,145,244) and rank=1 and Close_ is not null",dates[1],dates[length(dates)])
	
	if(per.seccode)	
		query <- paste(query, "and s.seccode = %s")
	
	return(get.info.from.qad(dates, seccodes, query, "unadj", per.seccode=per.seccode))
}
