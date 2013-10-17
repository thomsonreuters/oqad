# This source code is provided under the BSD license and is provided AS IS with no warranty or guarantee of fit for purpose.  See the project's LICENSE.txt for details.
# Copyright Thomson Reuters 2013. All rights reserved.

get.holidays<- function(start.date='2009-01-01', end.date='2012-02-01'){
  stopifnot(end.date>=start.date)
  
  conn <- get.qad.connection()
	query 	    <- sprintf("SELECT I.NAME,D.DATE_ FROM DBO.SDINFO I JOIN DBO.SDDATES D ON D.CODE=I.CODE WHERE I.CODE=31 and Date_ between '%s' and '%s' order by Date_", start.date,end.date)
	td 		      <-  sqlQuery(conn,query)
	holidays 	  <-  as.Date(strptime(td$DATE_,"%Y-%m-%d"))
	return(holidays) 
}
