# Copyright, Thomson Reuters, 2013
#
# All rights are reserved. Reproduction or transmission in whole or 
# in part, in any form or by any means, electronic, mechanical or 
# otherwise, is prohibited without the prior written consent of the 
# copyright owner.
#
# Filename          : QueryProcessor.R
# Project           : rqad package
# Brief Description : Processing of ad hoc queries
# Date created      : 03/14/2013
# Last modified     : 11/07/2013
# Author            : Jeff Kenyon
# ----------------------------------------------------------------------
# Bugfix # |  Date    |  Name              |     Description        
# ----------------------------------------------------------------------
# 
# ----------------------------------------------------------------------

require(RODBC)
require(XML)

QueryProcessor <- function(name,query) {
  if (!exists("CONNECTION_FILE")) {
    stop("Query failed, must define CONNECTION_FILE variable before calling.")
  }
  
  connections <- xmlInternalTreeParse(CONNECTION_FILE)
  connection <- getNodeSet(connections, 
      paste("//connections/connection[@name='",name,"']",sep=""))
  
  if (length(connection) == 0) {
    stop(paste("Connection ",name," is undefined. Please define it in ",CONNECTION_FILE,sep=""))
  }
  
  # retrieve parameters
  DSN <- xpathApply(connections, 
      paste("//connections/connection[@name='",name,"']/dsn",sep=""), 
      xmlValue)[[1]]
  USER <- xpathApply(connections, 
      paste("//connections/connection[@name='",name,"']/username",sep=""), 
      xmlValue)[[1]]
  PWD <- xpathApply(connections, 
      paste("//connections/connection[@name='",name,"']/password",sep=""), 
      xmlValue)[[1]]
  
  # open connection, get result, close connection
  conn <- odbcConnect(dsn=DSN, uid=USER, pwd=PWD, believeNRows=FALSE)
  result <- sqlQuery(conn,query,stringsAsFactors=FALSE)
  odbcClose(conn)
  
  # return result
  result
}
