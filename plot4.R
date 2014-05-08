
#Load Data
tab5rows <- read.table("exdata-data-household_power_consumption/household_power_consumption.txt", header = TRUE, nrows = 5, sep=";")
classes <- sapply(tab5rows, class)

tabAll <- read.table("exdata-data-household_power_consumption/household_power_consumption.txt", header = FALSE,colClasses=classes, sep=";", na.strings="?", skip=66637, nrows=2880)
colnames(tabAll)<- colnames(tab5rows)

X <- paste(tabAll$Date, tabAll$Time)

tabAll$Date <- as.Date(tabAll$Date,format="%d/%m/%Y")
tabAll$Time <- strptime(X, format="%d/%m/%Y %H:%M:%S")

#Plot Data
par(mfrow=c(2,2))


#plot1
plot(tabAll$Time, tabAll$Global_active_power, type="l", ylab = "Global Active Power", xlab="")

#plot2
plot(tabAll$Time, tabAll$Voltage, type="l", ylab = "Voltage", xlab="datetime")

#plot3
plot(tabAll$Time, tabAll$Sub_metering_1, col="black", type="l", ylab = "Energy sub metering", xlab="")
lines(tabAll$Time, tabAll$Sub_metering_2, col="red", type="l")
lines(tabAll$Time, tabAll$Sub_metering_3, col="blue", type="l")
legend("topright", c("Sub_metering_1", "Sub_metering_3","Sub_metering_3"), col=c("black", "red","blue"),lwd=1, lty=c(1,1,1), cex=.5, box.lwd=0, bty="n")

#plot4
plot(tabAll$Time, tabAll$Global_reactive_power, type="l", ylab = "Global_reactive_power", xlab="datetime")


dev.copy(png,'plot4.png')
dev.off()
