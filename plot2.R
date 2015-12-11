
# reading the files
system("grep '^[12]/2/2007' household_power_consumption.txt >> input.txt")
d<-read.csv("input.txt",sep=";")

#coverting to daytime
days=as.POSIXct(paste((d[,1]), d[,2]), format="%d/%m/%Y %H:%M:%S")


#plotting
plot(days[37450:40318],as.numeric(d[37450:40318,3]),type="l",xlab="",ylab="Global active power (kilowatts)")
dev.copy(png, file = "plot2.png")
dev.off


