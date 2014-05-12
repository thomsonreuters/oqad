#' #This source code is provided under the BSD license and is provided AS IS with no warranty or guarantee of fit for purpose.  See the project's LICENSE.txt for details.
#' #Copyright Thomson Reuters 2013. All rights reserved.
#' @param dates dates for which result is needed
#' @param seccodes seccodes for which result is needed
#' @param quarterly  boolean to set whether quarterly or annual returns are needed 
#' @param most.recent boolean
#' @return matrix
#' @author Ian MacGillivray
#' @export
get.dividends.payable  <-	function(dates,seccodes,quarterly=TRUE, most.recent=TRUE){
	return(get.info.from.rkd(dates, seccodes, "Dividends Payable", quarterly, most.recent))
}
