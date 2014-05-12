#' #This source code is provided under the BSD license and is provided AS IS with no warranty or guarantee of fit for purpose.  See the project's LICENSE.txt for details.
#' #Copyright Thomson Reuters 2013. All rights reserved.
#' @param dates dates
#' @param seccodes seccodes 
#' @param quarterly if quarterly is needed 
#' @return matrix 
#' @author Ian MacGillivray
#' @export 
get.current.ratio  <-	function(dates,seccodes,quarterly){
	return(get.info.from.rkd(dates, seccodes, "Current Ratio"))
}
