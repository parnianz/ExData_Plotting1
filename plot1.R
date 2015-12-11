## Read Data
system("grep '^[12]/2/2007' household_power_consumption.txt >> input.txt")
d<-read.csv("input.txt",sep=";")

#plot the hist
hist(d[,3],col="red",xlab="Global active power (kilowatts)",main="Global Active Power")

#save to png file
dev.copy(png, file = "plot1.png")
dev.off

