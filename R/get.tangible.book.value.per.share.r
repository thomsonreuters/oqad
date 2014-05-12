#' #This source code is provided under the BSD license and is provided AS IS with no warranty or guarantee of fit for purpose.  See the project's LICENSE.txt for details.
#' #Copyright Thomson Reuters 2013. All rights reserved.
#' Returns the tangible book value per share for a set of dates and seccodes 
#' @author Ian MacGillivray 
#' @param dates dates
#' @param seccodes seccodes
#' @param quarterly boolean 
#' @param most.recent boolean 
#' @return matrix 

#' @export
get.tangible.book.value.per.share  <-	function(dates,seccodes,quarterly=TRUE, most.recent=TRUE){
	return(get.info.from.rkd(dates, seccodes, "Tangible Book Value per Share", quarterly, most.recent))
}
