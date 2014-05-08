
#Load Data
tab5rows <- read.table("exdata-data-household_power_consumption/household_power_consumption.txt", header = TRUE, nrows = 5, sep=";")
classes <- sapply(tab5rows, class)

tabAll <- read.table("exdata-data-household_power_consumption/household_power_consumption.txt", header = FALSE,colClasses=classes, sep=";", na.strings="?", skip=66637, nrows=2880)
colnames(tabAll)<- colnames(tab5rows)

X <- paste(tabAll$Date, tabAll$Time)

tabAll$Date <- as.Date(tabAll$Date,format="%d/%m/%Y")
tabAll$Time <- strptime(X, format="%d/%m/%Y %H:%M:%S")

#Plot Data
par(mfrow=c(1,1))
plot(tabAll$Time, tabAll$Sub_metering_1, col="black", type="l", ylab = "Energy sub metering", xlab="")
lines(tabAll$Time, tabAll$Sub_metering_2, col="red", type="l")
lines(tabAll$Time, tabAll$Sub_metering_3, col="blue", type="l")
legend("topright", c("Sub_metering_1", "Sub_metering_3","Sub_metering_3"), col=c("black", "red","blue"),lwd=1, lty=c(1,1,1), cex=.7)
dev.copy(png,'plot3.png')
dev.off()
