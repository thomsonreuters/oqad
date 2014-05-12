#' #This source code is provided under the BSD license and is provided AS IS with no warranty or guarantee of fit for purpose.  See the project's LICENSE.txt for details.
#' #Copyright Thomson Reuters 2013. All rights reserved.

#' @author Sameena Shah
#' @param rics rics 
#' @return seccode.ric seccode.ric 
#' @export
get.seccodes.for.rics <- function(rics)
{
	us.query 	<- sprintf("select distinct SecCode, DisplayRIC from qai.dbo.secmap p join qai.dbo.rkdfndcmprefissue iss on iss.IssueCode=p.VenCode and VenType=29 and Rank=1 and DisplayRIC is not null")
	other.query <- sprintf("select distinct SecCode, DisplayRIC from RKDPIT2FndCmpRefIss iss join gSecMap p on p.VenCode = iss.IssueCode and VenType = 29 and DisplayRIC is not null and ListingTypeCode is not null")
	conn <- get.qad.connection()
	
	us.seccode.ric <- sqlQuery(conn, us.query)	
	other.seccode.ric <- sqlQuery(conn, other.query)
	seccode.ric <- rbind(us.seccode.ric, other.seccode.ric)
	seccode.ric[,2] <- as.character(seccode.ric[,2])
	
	# Normalise .O to .OQ
	seccode.ric[,2] <- sub("\\.O$",".OQ",seccode.ric[,2])
  
	# Match just RICs we care about
	seccode.ric <- seccode.ric[seccode.ric[,2] %in% rics,]
	rics <- unique(rics)
  
	# Tidy
	colnames(seccode.ric) <- c("seccode","ric")
  
	return(seccode.ric)
}
