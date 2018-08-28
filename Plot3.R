# This script reads in data on household power consumption between 1/2/2007 and 2/2/2007 and plots a time series of the Energy sub-metering values

# Read in data for 1/2/2007 and 2/2/2007
data <- read.table("C:\Users\donmac\Documents\Documents\BGS_admin\Training\Data_science\Module_4_Exploratory_data_analysis\Week_1\Assignment\household_power_consumption.txt", skip=grep("1/2/2007", readLines("household_power_consumption.txt")), nrows=60*48, sep=";")

# Name columns in the dataset
colnames(data) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

# Convert dates as strings to date format
Date <- strptime(data$Date, format = "%d/%m/%Y") 
Date <- as.Date(Date)

# Optionally replace date column
#data[["Date"]] <- Date

# Combine data and time columns
Date_time <- as.POSIXct(paste(Date, data$Time), format="%Y-%m-%d %H:%M:%S")

# Open a png file and set dimensions
png("Plot3.png", width = 480, height = 480)

# Plot time series of the data
plot(Date_time, data$Sub_metering_1, type = "l", xlab = "", ylab="Energy sub metering", main="Energy sub metering time series")
lines(Date_time, data$Sub_metering_2, col="red",lty=2)
lines(Date_time, data$Sub_metering_3, col="blue",lty=3)

# Add a legend
legend(x= "topright", 40,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"),lty=c(1,2,3), ncol=1)

# Reset the graphic device
dev.off()
graphics.off()