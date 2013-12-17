# Copyright, Thomson Reuters, 2013
#
# All rights are reserved. Reproduction or transmission in whole or 
# in part, in any form or by any means, electronic, mechanical or 
# otherwise, is prohibited without the prior written consent of the 
# copyright owner.
#
# Filename          : ReplaceQueryParameters
# Project           : ThomsonReutersData package
# Brief Description : Utility function to take a list of query parameters
#                     and do a replacement.
# Date created      : 07/15/2013
# Last modified     : 11/07/2013
# Author            : Jeff Kenyon
# ----------------------------------------------------------------------
# Bugfix # |  Date    |  Name              |     Description        
# ----------------------------------------------------------------------
# 
# ----------------------------------------------------------------------

ReplaceQueryParameters <- function(query,queryParameters) {
  for (i in 1:length(queryParameters)) {
    query <- gsub(names(queryParameters)[i],queryParameters[[i]],query)
  }
  query
}



