
#reading the file
system("grep '^[12]/2/2007' household_power_consumption.txt >> input.txt")
d<-read.csv("input.txt",sep=";")

# convert the time to date with time
days=as.POSIXct(paste((d[,1]), d[,2]), format="%d/%m/%Y %H:%M:%S")


#plotting
par(mar = c(5, 5, 5, 5))
plot(days[37450:40318],as.numeric(d[37450:40318,7]),type="l",col="black",xlab="",ylab="Energy sub meters",xaxt='n')
points(days[37450:40318],as.numeric(d[37450:40318,8]),type="l",col="red")
points(days[37450:40318],as.numeric(d[37450:40318,9]),type="l",col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=1, lwd=2.5, col=c("black", "red", "blue"))

#saving
dev.copy(png, file = "plot3.png")
dev.off





