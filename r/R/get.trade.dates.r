# This source code is provided under the BSD license and is provided AS IS with no warranty or guarantee of fit for purpose.  See the project's LICENSE.txt for details.
# Copyright Thomson Reuters 2013. All rights reserved.

# Takes a vector of dates and returns a vector of valid trading dates for information arriving on these dates.
# For extra precision, first call add.open.close.date.indexes and choose a date based on the period (e.g. close-close) you care about.
get.trade.dates <- function(dates)
{ 
  dates <- as.Date(dates)
  
	start.date <- min(dates)
	end.date <- max(dates)
	
	holidays   <- get.holidays(start.date,end.date)
	trade.dates <- get.trading.dates.from.db(start.date,end.date)
	trade.dates <- trade.dates[!trade.dates %in% holidays] #setdiff does something weird here

	if(max(trade.dates) < max(dates))
		stop("trade.dates must include at least the most recent date in dates, and may include dates further into the future")
		
  # Our return vector
  valid.dates <- dates
  
  # String comparison is orders of magnitude faster
  trade.dates.string <- as.character(trade.dates)
	valid.dates.string <- as.character(valid.dates)
  
	# Skip ahead where needed to find trade dates
  validity.test <- !valid.dates.string %in% trade.dates.string
	while(sum(validity.test) > 0)
	{    
    valid.dates[validity.test] <- valid.dates[validity.test] + 1
    valid.dates.string <- as.character(valid.dates)
    validity.test <- !valid.dates.string %in% trade.dates.string
	}
  
  return(valid.dates)
}
