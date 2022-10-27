#Loading and cleaning of the data

#read data
data <- read.table("C:\\Users\\HP\\Desktop\\datascience coursera\\exdata_data_household_power_consumption\\household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))
head(data)


#formatting date to type: Date 
data$Date <- as.Date(data$Date, "%d/%m/%Y")

# subsetting data from the dates 2007-02-01 and 2007-02-02
data <- subset(data,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))

#removing the incomplete data observations
data <- data[complete.cases(data),]

#combining date and time column to form a new column
dateTime <- paste(data$Date, data$Time)
dateTime <- setNames(dateTime, "DateTime")
data <- data[ ,!(names(data) %in% c("Date","Time"))]
data <- cbind(dateTime, data)
data$dateTime <- as.POSIXct(dateTime)
#Plot 4:

# Graphic device with 2 rows, 2 columns:
par(mfrow = c(2, 2))

# plot a (top left)
plot(Global_active_power ~ dateTime, data, type = "l", ylab = "Global Active Power (kilowatts)",xlab = "")

# plot b (top right)
plot(Voltage ~ dateTime, data, type = "l")

# plot c (bottom left)
plot(Sub_metering_1 ~ dateTime, data, type = "l", ylab = "Energy sub metering",xlab = "")
lines(Sub_metering_2 ~ dateTime, data, type = "l", col = "red")
lines(Sub_metering_3 ~ dateTime, data, type = "l", col = "blue")
legend("topright",col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),lty = 1,bty = "n")

# plot c (bottom right)
plot(Global_reactive_power ~ dateTime, data, type = "l")

#saving the plot as png file
dev.copy(png,"plot4.png", width=480, height=480)

#closing the device
dev.off()
