#' #This source code is provided under the BSD license and is provided AS IS with no warranty or guarantee of fit for purpose.  See the project's LICENSE.txt for details.
#' #Copyright Thomson Reuters 2013. All rights reserved.
#' @author Ian MacGillivray 
#' @param dates dates for which employees number are needed 
#' @param seccodes seccodes for which employees number are needed 
#' @param quarterly boolean to set quarterly or not 
#' @param most.recent if most recent is needed or not 
#' @return matrix 
#' @export
get.employees  <-	function(dates,seccodes,quarterly=TRUE, most.recent=TRUE){
	return(get.info.from.rkd(dates, seccodes, "Employees", quarterly, most.recent))
}
