# This source code is provided under the BSD license and is provided AS IS with no warranty or guarantee of fit for purpose.  See the project's LICENSE.txt for details.
# Copyright Thomson Reuters 2013. All rights reserved.

# set user connection 
# Pass the function that you need to use to establish connection 
set.qad.connection <- function(func, ...){
  if(missing(func) || !is.function(func))
    stop("You must specify a function that returns a valid QAD connection")
  fcall <<- match.call(expand.dots=TRUE)
  conn.function <<- fcall[2:length(fcall)]
}
