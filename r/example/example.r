# With the library built & loaded...

# Trivia
alpha.dockets.filename <- "example/data/example.docket.data.csv"
qad.output.filename <- "example/output/alpha.dockets.qad.data.csv"
stock.prices.filename <- "example/output/stock.prices.qad.data.csv"

# Read the CSV
alpha.dockets <- read.csv(alpha.dockets.filename,stringsAsFactors=FALSE)

# Query QAD and save results
alpha.dockets.qad.data <- prepare.qad.data(alpha.dockets)
alpha.dockets.qad.data <- alpha.dockets.qad.data[!is.na(seccode),]
write.csv(alpha.dockets.qad.data,file=qad.output.filename)

# For prices, we want all info back 14 months and forward two months (for beta calculation in ranges)
start.date <- seq(min(alpha.dockets.qad.data$trade.date),by="-14 months",length.out=2)[2]
end.date <- seq(max(alpha.dockets.qad.data$trade.date),by="2 month",length.out=2)[2]
price.dates <- seq(start.date, to=end.date, by="1 day")
	
# Get daily close information, stripping any date or seccode which is all blank, and save results
seccodes <- unique(alpha.dockets.qad.data$seccode)
adj.close <- get.adj.daily.close(price.dates,seccodes,per.seccode=1)
adj.close <- adj.close[apply(is.na(adj.close),1,sum) < length(seccodes),apply(is.na(adj.close),2,sum) < length(price.dates)]
write.csv(adj.close,file=stock.prices.filename)