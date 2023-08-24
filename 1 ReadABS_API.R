library(httr)
library(jsonlite)

base_url <- "https://api.data.abs.gov.au"
response <- GET(base_url, path = "data/ABS,CPI,1.1.0/1.10001.10.50.Q", query = list(startPeriod = "2018", 
                dimensionAtObservation="AllDimensions", format = "jsondata"))
print(response$status)
prettify(response)

cpi_data <- fromJSON(content(response, "text"))
class(cpi_data)
write_json(cpi_data, "Response.json", pretty = T)

#attributes(cpi_data$data$structure$dimensions$observation)
#head(cpi_data$data$structure$dimensions$observation)

Dates<-cpi_data$data$structure$dimensions$observation$values[[6]]$name
#attributes(cpi_data$data$structure$dimensions$observation)
#attributes(cpi_data$data$dataSets)
xx<-unlist(cpi_data$data$dataSets$observations)
dim(xx)<-c(5,length(cpi_data$data$dataSets$observations))
Values<-as.numeric(xx[1,])
CPI.Data<-data.frame(Dates=Dates,Index=Values)
CPI.Data<-data.frame(CPI.Data,IncrPer=round(c(NA,diff(CPI.Data$Index)/CPI.Data$Index[-length(CPI.Data$Index)]*100),3))
xx<-tail(CPI.Data,8)
print(xx)

p1<-barplot(xx$Index, names=xx$Date, las=2, col=2, main="Australia Wide - CPI", ylab="Index", xlab= "Quarter", 
        cex.names = 0.75, ylim = c(0, max(xx$Index) + 50)) #, xaxis=list(dtick=10))
text(p1,xx$Index+10, labels=round(xx$Index,1), cex=0.6)

p2<-barplot(xx$IncrPer,names=xx$Date, col=3, las=2, xlab="Quarter", ylab="Increase = %", main="Australian CPI - Quarter on Quarter", cex.names = 0.75,
           ylim=c(0,max(xx$IncrPer) + 0.25))
text(p2,xx$IncrPer+0.15, labels=round(xx$IncrPer,1), cex=0.8)

save.image("CPI.RData")

