#' #This source code is provided under the BSD license and is provided AS IS with no warranty or guarantee of fit for purpose.  See the project's LICENSE.txt for details.
#' #Copyright Thomson Reuters 2013. All rights reserved.

#' @author Ian MacGillivray 
#' @param dates dates
#' @param seccodes seccodes
#' @param quarterly boolean 
#' @param most.recent boolean 
#' @return matrix 

#' @export get.total.liabilities
get.total.liabilities  <-	function(dates,seccodes,quarterly=TRUE, most.recent=TRUE){
	return(get.info.from.rkd(dates, seccodes, "Total Liabilities", quarterly, most.recent))
}
