prepare.qad.data <- function(input)
{
  require(data.table)
  output <- data.table(input)
  
  # Normalise RICs
  output$ric <- sub("\\.O$",".OQ",output$ric)
	
  # Find the appropriate trading dates for each input date
  if("minutes.of.day" %in% colnames(output))
  {
    output <- add.oo.date(output)
    output$date <- output$date.oo
    output$date.oo <- NULL
  }
  output$trade.date <- get.trade.dates(output$date)
	
  # Get all possible seccodes
  seccode.ric <- get.seccodes.for.rics(output$ric)
  seccodes <- unique(seccode.ric[,1])
  seccodes <- seccodes[!is.na(seccodes)]
  
  dates <- unique(output$trade.date)
  dates <- dates[order(dates)]
	
  # Get close information
  adj.close   <-  get.adj.daily.close(dates,seccodes,per.seccode=1)
  
  # Strip any date or seccode which is all blank
  adj.close <- adj.close[apply(is.na(adj.close),1,sum) < length(seccodes),apply(is.na(adj.close),2,sum) < length(dates)]
  
  # Now we have close information, we can filter through duplicates to find the seccodes to use
  useful.seccodes <- colnames(adj.close)
  seccode.ric <- seccode.ric[seccode.ric$seccode %in% useful.seccodes,]
  seccode.ric.dt <- data.table(seccode.ric)
  setkey(seccode.ric.dt,ric)
  setkey(output,ric)
  output <- seccode.ric.dt[output]
  seccodes <- unique(output$seccode)
  seccodes <- seccodes[!is.na(seccodes)]
  # Rekey
  setkey(output,seccode,trade.date)
	
  # Get general information
  mkt.cap   	<- 	get.market.cap(dates,seccodes)	
  sector    	<- 	get.sector.ibes(dates,seccodes)
  
  # Use data tables 
  adj.close.dt <- get.data.table.from.double.matrix(adj.close,"date","seccode","price.eod")
  mkt.cap.dt <- get.data.table.from.double.matrix(mkt.cap,"date","seccode","mkt.cap")
  sector.dt <- get.data.table.from.double.matrix(sector,"date","seccode","sector")
  
  output <- join.input.to.data.table(output,adj.close.dt)
  output <- join.input.to.data.table(output,mkt.cap.dt)
  output <- join.input.to.data.table(output,sector.dt)  
  	
  save(output, file=output.filename)
  return(output)
}

join.input.to.data.table <- function(input, data.table)
{
  setkey(input,seccode,trade.date)
  
  data.table$trade.date <- as.Date(data.table$date)
  data.table$date <- NULL
  setkey(data.table,seccode,trade.date)
  
  input <- data.table[input]
  
  return(input)
}

get.data.table.from.double.matrix <- function(matrix,rownames.title,colnames.title,values.title)
{
  require(reshape)

  matrix.m <- melt(matrix)
  dt.out <- data.table(matrix.m)
  setnames(dt.out,c(rownames.title,colnames.title,values.title))
  return(dt.out)
}