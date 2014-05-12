#' #This source code is provided under the BSD license and is provided AS IS with no warranty or guarantee of fit for purpose.  See the project's LICENSE.txt for details.
#' #Copyright Thomson Reuters 2013. All rights reserved.

#' Sets user connection 
#' @param func Pass the function that you need to use to establish connection
#' @param ... any additional arguments that you want to pass for func 
#' @author Sameena Shah
#' @export
set.qad.connection <- function(func, ...){
  if(missing(func) || !is.function(func))
    stop("You must specify a function that returns a valid QAD connection")
  fcall <<- match.call(expand.dots=TRUE)
  conn.function <<- fcall[2:length(fcall)]
#  rqad.environ <- get.environ()
#  assign(match.call(expand.dots=TRUE), fcall, rqad.environ)
#  assign(fcall[2:length(fcall)],conn.function,rqad.environ)
}
