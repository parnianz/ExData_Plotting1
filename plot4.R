

#reading the file
system("grep '^[12]/2/2007' household_power_consumption.txt >> input.txt")
d<-read.csv("input.txt",sep=";")

# convert the time to date with time
days=as.POSIXct(paste((d[,1]), d[,2]), format="%d/%m/%Y %H:%M:%S")


# plotting
par(mfrow = c(2, 2), mar = c(4, 4, 4, 4), oma = c(0, 0, 0, 0))
plot(days[37450:40318],as.numeric(d[37450:40318,3]),type="l",xlab="",ylab="Global active power (kilowatts)")
plot(days[37450:40318],as.numeric(d[37450:40318,5]),type="l",xlab="datetime",ylab="Voltage")
plot(days[37450:40318],as.numeric(d[37450:40318,7]),type="l",col="black",xlab="",ylab="Energy sub meters",xaxt='n')
points(days[37450:40318],as.numeric(d[37450:40318,8]),type="l",col="red")
points(days[37450:40318],as.numeric(d[37450:40318,9]),type="l",col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=1, lwd=2.5, col=c("black", "red", "blue"),cex=0.5)
plot(days[37450:40318],as.numeric(d[37450:40318,4]),type="l",xlab="datetime",ylab="Global_reactive_power")


#saving to png file
dev.copy(png, file = "plot4.png")
dev.off
