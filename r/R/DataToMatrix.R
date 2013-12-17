# Copyright, Thomson Reuters, 2013
#
# All rights are reserved. Reproduction or transmission in whole or 
# in part, in any form or by any means, electronic, mechanical or 
# otherwise, is prohibited without the prior written consent of the 
# copyright owner.
#
# Filename          : DataToMatrix.R
# Project           : rqad package
# Brief Description : Take query data, put it in a nicely formatted matrix
# Date created      : 03/27/2013
# Last modified     : 11/07/2013
# Author            : Jeff Kenyon
# ----------------------------------------------------------------------
# Bugfix # |  Date    |  Name              |     Description        
# ----------------------------------------------------------------------
# 
# ----------------------------------------------------------------------

require(compiler)

# The arguments are
# (1) query results
# (2) column number for date (rows)
# (3) column number for identifiers (columns)
# (4) column number for data items (values)

UncompiledDataToMatrix <- function(queryResults,dateColumn,identifierColumn,dataColumn,eliminateWeekends=FALSE) {
  
  # put results into matrix form
  valueMatrix <- matrix()
  colNames <- NULL
  if (nrow(queryResults) > 0) {
    
    # form query result into a proper matrix
    rowNames <- as.character(sort(as.Date(unique(queryResults[,dateColumn]),format="%Y-%m-%d")))
    colNames <- sort(unique(queryResults[,identifierColumn]))
    valueMatrix <- matrix(data=NA,nrow=length(rowNames),ncol=length(colNames),dimnames=list(rowNames,colNames))
    
    queryResults[,dateColumn] <- as.character(as.Date(queryResults[,dateColumn],format="%Y-%m-%d"))
    queryResults[,dataColumn] <- as.numeric(queryResults[,dataColumn])
    
    # iterate through data and fill in matrix
    for (i in 1:nrow(queryResults)) {
      valueMatrix[queryResults[i,dateColumn],as.character(queryResults[i,identifierColumn])] <- queryResults[i,dataColumn]
    }
  }
  
  valueMatrixDim <- dim(valueMatrix)
  
  # Eliminate NA rows (weekends)
  if (eliminateWeekends) {
    valueMatrix <- valueMatrix[apply(valueMatrix,1,function(x)any(!is.na(x))),]
  
    # Unfortunately, this elimination changes the class if there's only one 
    # row or one column. So we need to convert it back. If weirdness is discovered,
    # do the weekend elimination in the custom code, and modify this later.
    if (class(valueMatrix) == "numeric") {
      newRows <- length(valueMatrix)/valueMatrixDim[2]
      valueMatrix <- matrix(valueMatrix,nrow=valueMatrixDim[1],ncol=valueMatrixDim[2],dimnames=list(rowNames,colNames))
    }
  }
  
  if (class(valueMatrix) != "matrix") {
    stop("valueMatrix class is not matrix")
  }
  
  valueMatrix
}

DataToMatrix <- cmpfun(UncompiledDataToMatrix)


