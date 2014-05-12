#' #This source code is provided under the BSD license and is provided AS IS with no warranty or guarantee of fit for purpose.  See the project's LICENSE.txt for details.
#' #Copyright Thomson Reuters 2013. All rights reserved.
#' @param dates dates 
#' @param seccodes seccodes 
#' @param quarterly if only quarterly 
#' @param most.recent if only most recent 
#' @return matrix 
#' @export

get.underwriting.profit  <-	function(dates,seccodes,quarterly=TRUE, most.recent=TRUE){
	return(get.info.from.rkd(dates, seccodes, "Underwriting Profit or Loss", quarterly, most.recent))
}
