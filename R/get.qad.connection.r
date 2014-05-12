#' #This source code is provided under the BSD license and is provided AS IS with no warranty or guarantee of fit for purpose.  See the project's LICENSE.txt for details.
#' #Copyright Thomson Reuters 2013. All rights reserved.
#' @author Sameena Shah
#' @return odbc connection object
#' Checks if connection is open else reopens it 
#' @export
get.qad.connection   <-   function(){
  prev.warn <- options("warn")$warn
  options(warn=2)
  #warning(immediate=TRUE)
  
#  if(!exists("conn.function"), qad.environ)
  if(!exists("conn.function"))
    stop("Please invoke set.qad.connection function first")
  
#  if(!exists("qad.conn"),qad.environ){    
  if(!exists("qad.conn")){
#    assign(eval(conn.function),qad.conn,qad.environ)
    qad.conn <<- eval(conn.function)
  }
  else {
    tryCatch({
      odbcClose(qad.conn)},
                          error = function(e)
                          {
        #                    assign(eval(conn.function),qad.conn,qad.environ)                            
                            qad.conn <<- eval(conn.function)
                          }
      )
    #    assign(odbcReConnect(qad.conn),qad.conn,qad.environ)
    qad.conn <<- odbcReConnect(qad.conn)
  }  
  options(warn=prev.warn)
  return(qad.conn)
}
