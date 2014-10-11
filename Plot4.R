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

##plot4
plot4<-"C:/Users/gridA/Desktop/R course/exploratory analysis/plot4.png"
png(file=plot4, width=480,height=480)
par(mfrow=c(2,2))

# Upper Left Corner
plot(table2$DateTime, table2$Global_active_power, type = "l", xlab = "", ylab= "Global Active Power (kilowatts)")

# Upper Right Corner
plot(table2$DateTime, table2$Voltage, type = "l", xlab = "", ylab= "Voltage", main = "")

# Lower Left Corner
plot(table2$DateTime, table2$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering", main = "")
lines(table2$DateTime, table2$Sub_metering_2, col = "red")
lines(table2$DateTime, table2$Sub_metering_3, col = "blue")
legend("topright", lty = 1, bty = "n", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"))

# Lower Right Corner
plot(table2$DateTime, table2$Global_reactive_power, type = "l", xlab = "", ylab= "Global_rective_power")
#dev.copy(png, file="C:/Users/gridA/Desktop/R course/exploratory analysis/plot4.png", height=480, width=480)
dev.off()
