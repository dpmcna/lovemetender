makeSummary<-function(x){
data.frame(
Value=max(x$Value),
Description=x$Description[which.max(x$Value)],
Procurement.Method=x$Procurement.Method[which.max(x$Value)],
Title=x$Title[which.max(x$Value)],
Common.Title=names(which.max(table(x$Title))),
Count=nrow(x),
Total=sum(x$Value),
Limited=sum(x[x$Procurement.Method=="Limited tender","Value"]),
Open=sum(x[x$Procurement.Method=="Open tender","Value"]),
Prequalified=sum(x[x$Procurement.Method=="Prequalified tender","Value"])
)
}

#library(plyr)
#minValue<-1000000
#data<-read.csv("2012.csv",stringsAsFactors=FALSE)
#data[is.na(data)]<-""

#abnValues<-ddply(data,"ABN",makeSummary)
#abnValues<-data.frame(abnValues,Supplier.Name=sapply(abnValues$ABN,function(x){names(which.max(table(data[data$ABN==x,"Supplier.Name"])))}))
#abnValues<-data.frame(Agency.Name="All",abnValues)
#abnValues<-abnValues[!abnValues$ABN=="",]

#agencyValues<-ddply(data,"Agency.Name",makeSummary)
#agencyValues<-data.frame(Agency.Name=agencyValues$Agency.Name,ABN="All",agencyValues[,-1])
#agencyValues<-data.frame(agencyValues,Supplier.Name="All")

#values<-ddply(data,.(Agency.Name,ABN),makeSummary)
#values<-values[!values$ABN=="",]
#values<-merge(values,abnValues[,c("Supplier.Name","ABN")],by="ABN")
#values<-data.frame(Agency.Name=values$Agency.Name,ABN=values$ABN,values[,c(-1,-2)])

#totalValues<-data.frame(Agency.Name="All",ABN="All",makeSummary(data),Supplier.Name="All")

#allValues<-data.frame(rbind(totalValues,agencyValues,abnValues,values))
save(allValues,file="loadData.RData")
write.csv(allValues,file="2012summary.csv",row.names=FALSE)
