##load in data
table<- read.table("C:/Users/gridA/Desktop/R course/exploratory analysis/data/project1.txt", header=T,sep=";",stringsAsFactors=F)
dim(table)

##subsest table
table2 <- subset(table, subset=(Date == "1/2/2007" | Date == "2/2/2007"))
dim(table2)

##convert date
table2$DateTime <- paste(table2$Date, table2$Time)
table2$Date <- as.Date(table2$Date, format="%d/%m/%Y")
table2$DateTime <- strptime(table2$DateTime, "%d/%m/%Y %H:%M:%S")

##plot3
plot3<-"C:/Users/gridA/Desktop/R course/exploratory analysis/plot3.png"
png(file=plot3, width=480,height=480)
plot(table2$DateTime, table2$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering", main = "")
lines(table2$DateTime, table2$Sub_metering_2, col = "red")
lines(table2$DateTime, table2$Sub_metering_3, col = "blue")
legend("topright", lty = 1, legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       col = c("black","red","blue"))
#dev.copy(png, file="C:/Users/gridA/Desktop/R course/exploratory analysis/plot3.png", height=480, width=480)
dev.off()
