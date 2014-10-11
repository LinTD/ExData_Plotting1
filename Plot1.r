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

##plot1
GAP<-as.numeric(table2$Global_active_power)
plot1<-"C:/Users/gridA/Desktop/R course/exploratory analysis/plot1.png"
png(file=plot1, 
    #bg="transparent",
    width=480,height=480)
hist(GAP, main="Global Active Power", 
     xlab="Global Active Power (killowatts)",
     col="red")
#dev.copy(png, file="C:/Users/gridA/Desktop/R course/exploratory analysis/plot1.png", height=480, width=480)
dev.off()
