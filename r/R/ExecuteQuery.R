# Copyright, Thomson Reuters, 2013
#
# All rights are reserved. Reproduction or transmission in whole or 
# in part, in any form or by any means, electronic, mechanical or 
# otherwise, is prohibited without the prior written consent of the 
# copyright owner.
#
# Filename          : ExecuteQuery.R
# Project           : rqad package
# Brief Description : Process an XML query 
# Date created      : 09/26/2013
# Last modified     : 11/07/2013
# Author            : Jeff Kenyon
# ----------------------------------------------------------------------
# Bugfix # |  Date    |  Name              |     Description        
# ----------------------------------------------------------------------
# 
# ----------------------------------------------------------------------

require(XML)

# Usage example: result <- ExecuteQuery("C:/Development/ThomsonReutersData/ThomsonReutersData/queries/EquityIndexSearch.xml",VERBOSE=TRUE,SEARCH_TERM="DJSI")
ExecuteQuery <- function(queryXmlFileName, ...) {
  
  VERBOSE <- list(...)[["VERBOSE"]]
  if (is.null(VERBOSE)) {
    VERBOSE <- FALSE
  }
  
  # Get query 
  queryDoc <- xmlInternalTreeParse(queryXmlFileName)
  query <- gsub("\n *"," ",xmlValue(getNodeSet(queryDoc,"//Query/SQL")[[1]]))

  queryName <- xmlValue(getNodeSet(queryDoc,"//Query/QueryName")[[1]])
  system <- xmlValue(getNodeSet(queryDoc,"//Query/System")[[1]])
  
  if (VERBOSE) {
    cat(paste("(Running ",system," query, data source(s) = ",xmlValue(getNodeSet(queryDoc,"//Query/Sources")[[1]]),")\n",sep=""))
  }
  
  parameters <- getNodeSet(queryDoc,"//Query/Parameters/Parameter")
  
  # Deal with parameter substitution
  if (length(parameters) > 0) {
    queryParameters <- list()
    for (i in 1:length(parameters)) {
      # get parameter name
      parameterName <- xmlValue(parameters[[i]])
      # get default parameter value
      parameterValue <- xmlGetAttr(parameters[[i]],"default")
      # if parameter override was passed in, use that value instead
      parameterValue <- list(...)[[parameterName]]
      # If parameter is null, there's a problem (no default, argument not in "..." list)
      if (is.null(parameterValue)) {
        stop(paste("In query ",queryName,", parameter ",parameterName," has value of NULL (no default, no value passed)",sep=""))
      }
      # add to parameter substitution list
      queryParameters[paste("%",parameterName,"%",sep="")] <- as.character(parameterValue)
    }
    query <- ReplaceQueryParameters(query,queryParameters)
  }

  if (VERBOSE) {
    cat(paste("(QUERY: ",query,")\n",sep=""))
  }
  
  # Run the query and retrieve the results
  queryResults <- QueryProcessor(system,query)
  queryResults
}

