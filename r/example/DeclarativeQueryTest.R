library(rqad)

# Connections.xml file (see package examples subdirectory) refers to a pre-existing
# ODBC connection ("QA_DIRECT") defined on my machine. The ODBC connection name
# can be used as the first argument in the function call to QueryProcessor(),
# but more often is simply used in the query XML file.

CONNECTION_FILE <- "C:/oqad_test/Connections.xml"

# A low level call might be:
result <- QueryProcessor("QA_DIRECT",
   "select Close_ from ds2primqtprc where infocode = 65011 and marketdate = '2013-03-11'")

# ...but inline SQL was what I was trying to get away from. This will run a 
# query distributed with the package: 
result <- ExecuteStandardQuery("EquityIndexSearch",VERBOSE=TRUE,SEARCH_TERM="DJSI")

# ...and this will run a project-specific query:
result <- ExecuteQuery("C:/oqad_test/TRIndexConstituentsAsOfDate.xml",
    RIC=".TRXFLDCAP",POINT_DATE="2013-06-28")

# So, using these new functions, we might re-write a call to get.market.cap as:
result <- ExecuteStandardQuery("GetMarketCap",START_DATE="2013-10-28",END_DATE="2013-11-01",SECCODE="8274")

# (Note that this query is returning two [significantly different]
# results for each date. One would need to look into this. The company is
# Bank of Nova Scotia.)



