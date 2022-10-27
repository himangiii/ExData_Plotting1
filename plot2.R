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

#creating the plot2 
plot(data$Global_active_power~data$dateTime, type="l", ylab="Global Active Power (kilowatts)", xlab="")

#saving the plot as png file
dev.copy(png,"plot2.png", width=480, height=480)

#closing the device
dev.off()

