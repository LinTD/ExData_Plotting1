##load in data
txtfile<-"C:/Users/gridA/Desktop/R course/exploratory analysis/data/project1.txt"
table<- read.table(txtfile, header=T,sep=";",stringsAsFactors=F,dec=".")
dim(table)

##subsest table
table2 <- subset(table, subset=(Date == "1/2/2007" | Date == "2/2/2007"))
dim(table2)

##convert date
table2$DateTime <- paste(table2$Date, table2$Time)
table2$Date <- as.Date(table2$Date, format="%d/%m/%Y")
table2$DateTime <- strptime(table2$DateTime, "%d/%m/%Y %H:%M:%S")

##plot2
plot2<-"C:/Users/gridA/Desktop/R course/exploratory analysis/plot2.png"
png(file=plot2, 
#     bg="transparent",
    width=480,height=480)
plot(table2$DateTime, table2$Global_active_power,
     type="l",
     ylab="Global Active Power (kilowatts)",
     xlab="")
#dev.copy(png, file="C:/Users/gridA/Desktop/R course/exploratory analysis/plot2.png", height=480, width=480)
dev.off()
