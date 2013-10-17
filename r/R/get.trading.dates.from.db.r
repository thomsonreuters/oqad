# This source code is provided under the BSD license and is provided AS IS with no warranty or guarantee of fit for purpose.  See the project's LICENSE.txt for details.
# Copyright Thomson Reuters 2013. All rights reserved.

get.trading.dates.from.db <- function(start.date='2011-01-01', end.date='2011-02-01'){

# We will get price information for a number of big companies, any date with no price information is assumed not to be a trading day.
# seccode	ric
# 47922		MS.N
# 8352		BAC.N
# 30655		GS.N
# 29629		GE.N
# 8156		BAC.N
# 6027		AAPL.OQ
# 75538		TRI.N  -- we are assuming all these companies won't go bankrupt at the same time. But, now that TRI.N is in there, if they are all bankrupt then I don't need to worry about maintaining this code.

price.dates <- seq(as.Date(start.date),to=as.Date(seq(as.Date(end.date),by="1 day",length.out=30)[30]),by="1 day")
seccodes <- c(47922,8352,30655,29629,8156,6027,75538)
close.prices <- get.adj.daily.close(price.dates,seccodes,per.seccode=1)
dates.from.db <- rownames(close.prices[apply(is.na(close.prices),1,sum) < length(seccodes),])
trade.dates <- dates.from.db[dates.from.db < end.date]
	if(length(trade.dates) < length(dates.from.db))
		trade.dates <- c(trade.dates, dates.from.db[length(trade.dates)+1])
	
	return(trade.dates) 
}
