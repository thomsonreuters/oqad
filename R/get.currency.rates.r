#' #This source code is provided under the BSD license and is provided AS IS with no warranty or guarantee of fit for purpose.  See the project's LICENSE.txt for details.
#' #Copyright Thomson Reuters 2013. All rights reserved.
#' @author Sameena Shah
#' @param start.date start.date in Y-m-d format 
#' @param end.date end.date in Y-m-d format 
#' @param from.curr set of currencies to be converted
#' @param to.curr which currency to be converted to 
#' @param rate.type SPOT or which forward contract etc  
#' @return data.frame
#' @export 
get.currency.rates  	<- 	function(start.date='2011-01-01',end.date='2011-02-01',from.curr='all',to.curr='USD',rate.type='SPOT'){
	conn <- get.qad.connection()
	
  if(from.curr=='all'){
    query <- sprintf( "SELECT ExRateDate AS date, MidRate AS mid_rate, BidRate AS bid_rate,OfferRate AS offer_rate,FromCurrCode AS from_curr_code,ToCurrCode AS to_curr_code ,RateTypeCode AS rate_type_code FROM Ds2FxRate rate JOIN Ds2FxCode code ON rate.ExRateIntCode = code.ExRateIntCode WHERE ToCurrCode = '%s' AND ExRateDate BETWEEN '%s' AND '%s' AND RateTypeCode ='%s'", to.curr, start.date, end.date, rate.type )
    currency.rates <- sqlQuery(conn,query)
  }
  else {
      currency.rates <- data.frame()
      i <- 1
      while(i<=length(from.curr)){
        
        query <- sprintf( "SELECT ExRateDate AS date, MidRate AS mid_rate, BidRate AS bid_rate,OfferRate AS offer_rate,FromCurrCode AS from_curr_code,ToCurrCode AS to_curr_code ,RateTypeCode AS rate_type_code FROM Ds2FxRate rate JOIN Ds2FxCode code ON rate.ExRateIntCode = code.ExRateIntCode WHERE ToCurrCode = '%s' AND FromCurrCode = '%s' AND ExRateDate BETWEEN '%s' AND '%s' AND RateTypeCode = '%s'", to.curr, from.curr[i],  start.date, end.date, rate.type )
        temp <- sqlQuery(conn,query)
        currency.rates <- rbind(currency.rates,temp)
        i <- i +1 
      }
}
  return(currency.rates)

}
