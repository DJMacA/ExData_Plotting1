# This script reads in data on household power consumption between 1/2/2007 and 2/2/2007 and plots a histogram of Global Active Power
  
  # Read in data for 1/2/2007 and 2/2/2007
  data <- read.table("C:\Users\donmac\Documents\Documents\BGS_admin\Training\Data_science\Module_4_Exploratory_data_analysis\Week_1\Assignment\household_power_consumption.txt", skip=grep("1/2/2007", readLines("household_power_consumption.txt")), nrows=60*48, sep=";")

  # Name columns in the dataset
  colnames(data) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
  
  # Open a png file and set dimensions
  png("Plot1.png", width = 480, height = 480)
  
  # Plot a histogram of the data
  hist(data$Global_active_power, xlab="Global Active Power (kilowatts)", main="Global Active Power", col="red")
  
  # Reset the graphic device
  dev.off()
  graphics.off()
  