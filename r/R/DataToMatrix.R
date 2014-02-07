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
# Last modified     : 02/07/2014
# Author            : Jeff Kenyon
# ----------------------------------------------------------------------
# Bugfix # |  Date    |  Name              |     Description        
# ----------------------------------------------------------------------
# 
# ----------------------------------------------------------------------

require(reshape2)

# The arguments are
# (1) query results
# (2) column number for date (rows)
# (3) column number for identifiers (columns)
# (4) column number for data items (values)

TRD_DataToMatrix <- function(queryResults,dateColumn,identifierColumn,dataColumn,eliminateWeekends=FALSE) {
  queryResults <- queryResults[,c(dateColumn,identifierColumn,dataColumn)]
  names(queryResults) <- c("DATE","IDENTIFIER","DATA")
  
  mdata <- melt(queryResults,id=c("IDENTIFIER","DATE")) 
  valueMatrix <- acast(mdata, DATE~IDENTIFIER) 
  
  valueMatrixDim <- dim(valueMatrix)
  
  # Eliminate NA rows (weekends)
  if (eliminateWeekends) {
    valueMatrix <- valueMatrix[apply(valueMatrix,1,function(x)any(!is.na(x))),]
    
    # Unfortunately, this elimination changes the class if there's only one 
    # row or one column. So we need to convert it back. Note that this has not
    # been tested thoroughly at all (e.g., if we passed a matrix containing 
    # Fri/Sat/Sun, and it got reduced to Fri). So if weirdness is discovered,
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


