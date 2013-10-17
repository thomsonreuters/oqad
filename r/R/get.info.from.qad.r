# This source code is provided under the BSD license and is provided AS IS with no warranty or guarantee of fit for purpose.  See the project's LICENSE.txt for details.
# Copyright Thomson Reuters 2013. All rights reserved.

# Either dates or start.date and end.date
# Allow seccodes to be all, one, or a list
# Check if seccodes are null or na or contain any NA
# Check if dates contain Na or are null

get.info.from.qad <- function(dates, seccodes, query, result.column, date.column="date", seccode.column="seccode", per.seccode=1)
{
	output.matrix <- matrix(NA, length(dates),length(seccodes))
	colnames(output.matrix)	<- 	paste(seccodes)
	rownames(output.matrix) <- 	paste(dates)
	
	dates <- as.character(dates)
	conn <- get.qad.connection()	
  
	if(per.seccode)
	{
		data <- NULL
		
		for(seccode in seccodes)
		{
			this.query <- sprintf(query, seccode)
			results <- sqlQuery(conn, this.query)
			if(is.null(data))
				data <- results
			else
				data <- rbind(data, results)
		}
	}
  
	else 
		data <- sqlQuery(conn, query)
		
	error.string <- paste("was not found in the colnames of the data returned from the query, colnames returned were:", paste(colnames(data), collapse=", "))
	if(!result.column %in% colnames(data))
		stop(paste("result.column:", result.column, error.string))
	if(!date.column %in% colnames(data))
		stop(paste("date.column:", date.column, error.string))
	if(!seccode.column %in% colnames(data))
		stop(paste("seccode.column:", seccode.column, error.string))
		
	if(nrow(data) == 0)
		return(output.matrix)
	
	# It's possible some data will have a duplicate in the data column. We only take the topmost of any duplicate values.
	# This means that sorting is particularly important in get.info.from.rkd which cares about which row is taken.
	data <- data[!duplicated(data[,c(seccode.column, date.column)]),]
	
	data[,date.column] <- as.character(data[,date.column])
	if(per.seccode)
		data <- data[data[,date.column] %in% dates,]
	else
		data <- data[data[,date.column] %in% dates & data[,seccode.column] %in% seccodes,]
		
	data.cast <- dcast(data,as.formula(paste(date.column,seccode.column,sep = "~")),fun.aggregate=sum,value.var=result.column,fill = NA_real_)
	data.matrix <- as.matrix(data.cast[,-1])
	rownames(data.matrix) <- data.cast[,date.column]	
	# dcast to as.matrix silently drops colnames when there is only one column, so get it back
	if(ncol(data.cast) == 2)
		colnames(data.matrix) = colnames(data.cast)[2]
		
	row.int <- intersect(rownames(output.matrix),rownames(data.matrix))
	col.int <- intersect(colnames(output.matrix),colnames(data.matrix))
	output.matrix[row.int,col.int] <- data.matrix[row.int,col.int]
	  
	return(output.matrix)
}
