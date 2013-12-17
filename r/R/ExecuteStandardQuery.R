# Copyright, Thomson Reuters, 2013
#
# All rights are reserved. Reproduction or transmission in whole or 
# in part, in any form or by any means, electronic, mechanical or 
# otherwise, is prohibited without the prior written consent of the 
# copyright owner.
#
# Filename          : ExecuteStandardQuery.R
# Project           : rqad package
# Brief Description : Use a query from the standard library.
# Date created      : 09/25/2013
# Last modified     : 11/07/2013
# Author            : Jeff Kenyon
# ----------------------------------------------------------------------
# Bugfix # |  Date    |  Name              |     Description        
# ----------------------------------------------------------------------
# 
# ----------------------------------------------------------------------

# Usage example: result <- ExecuteStandardQuery("EquityIndexSearch",VERBOSE=TRUE,SEARCH_TERM="DJSI")
ExecuteStandardQuery <- function(queryName, VERBOSE=FALSE, ...) {
  
  if (!exists("kStandardQueryDir", where=".GlobalEnv")) {
    kStandardQueryDir <- paste(Sys.getenv("R_HOME"),"/library/rqad/queries",sep="")
  }
  
  # Make sure the query dir ends in a slash
  if (substr(kStandardQueryDir,nchar(kStandardQueryDir),nchar(kStandardQueryDir)) != "/") {
    kStandardQueryDir <- paste(kStandardQueryDir,"/",sep="")
  }
  
  ExecuteQuery(paste(kStandardQueryDir,queryName,".xml",sep=""), VERBOSE=VERBOSE, ...)
}

