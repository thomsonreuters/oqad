# This source code is provided under the BSD license and is provided AS IS with no warranty or guarantee of fit for purpose.  See the project's LICENSE.txt for details.
# Copyright Thomson Reuters 2013. All rights reserved.

# checks if connection is open 
get.qad.connection   <-   function(){
  prev.warn <- options("warn")$warn
  options(warn=2)
  #warning(immediate=TRUE)
  
  if(!exists("conn.function"))
    stop("Please invoke set.qad.connection function first")
  
  if(!exists("qad.conn")){    
    qad.conn <<- eval(conn.function)
  }
  else {
    tryCatch({
      odbcClose(qad.conn)},
                          error = function(e)
                          {
                            qad.conn <<- eval(conn.function)
                          }
      )
    qad.conn <<- odbcReConnect(qad.conn)
  }  
  options(warn=prev.warn)
  return(qad.conn)
}
