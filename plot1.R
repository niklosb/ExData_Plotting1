
#Load Data
tab5rows <- read.table("exdata-data-household_power_consumption/household_power_consumption.txt", header = TRUE, nrows = 5, sep=";")
classes <- sapply(tab5rows, class)

tabAll <- read.table("exdata-data-household_power_consumption/household_power_consumption.txt", header = FALSE,colClasses=classes, sep=";", na.strings="?", skip=66637, nrows=2880)
colnames(tabAll)<- colnames(tab5rows)

X <- paste(tabAll$Date, tabAll$Time)

tabAll$Date <- as.Date(tabAll$Date,format="%d/%m/%Y")
tabAll$Time <- strptime(X, format="%d/%m/%Y %H:%M:%S")

#Plot Data
histinfo<-hist(tabAll$Global_active_power, xlab="Gloabl Active Power (kilowatts)", main="Gloabl Active Power", col="red")
dev.copy(png,'plot1.png')
dev.off()
