#' #This source code is provided under the BSD license and is provided AS IS with no warranty or guarantee of fit for purpose.  See the project's LICENSE.txt for details.
#' #Copyright Thomson Reuters 2013. All rights reserved.
#' @export example.connection
#' @author Sameena Shah 
#' @param server server address 
#' @param uid userid 
#' @param pwd password 
#' @param other any other information like database name etc, none by default
#' @return returns an odbcConnection object
#' @import RODBC
example.connection <- function(server,uid,pwd,other="")
{
  str <- sprintf("DRIVER={SQL SERVER};SERVER=%s;uid=%s;pwd=%s;%s",server,uid,pwd,other)
  str
  return(odbcDriverConnect(str))  
}
