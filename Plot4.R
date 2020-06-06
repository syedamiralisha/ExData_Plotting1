Skip to content
Search or jump to…

Pull requests
Issues
Marketplace
Explore
 
@syedamiralisha 
karthikmca39
/
ExData_Plotting-1
forked from ma-t/ExData_Plotting
1
01
 Code
 Pull requests 0 Actions
 Projects 0
 Wiki
 Security 0
 Insights
ExData_Plotting-1/Plot4.R
@karthikmca39 karthikmca39 Update Plot4.R
63b287c on Jun 24, 2018
29 lines (22 sloc)  1.55 KB
  
# Coursera Exploratory Data Analysis
# Plot4.R (Assignment 1)

# rm(list=ls())

#reading data into R
elet<- read.table("/Users/amir/desktop/household_power_consumption.txt", sep=";",nrows= 2075260, header=TRUE, quote= "", strip.white=TRUE, stringsAsFactors = FALSE, na.strings= "?")

# Subsetting the full data to obtain the data related to two days: 
sub<- subset(elet, (elet$Date == "1/2/2007" | elet$Date== "2/2/2007")) 

# Changing the class of Date from character to Date: 
sub$Date <- as.Date(sub$Date, format = "%d/%m/%Y")
# Combining the Date and Time; creating a new column called "DateTime":
sub$DateTime <- as.POSIXct(paste(sub$Date, sub$Time))

# Creating Plot4:
png("plot4.png", width = 480, height = 480)
par(mfcol=c(2,2)) # adding plots in col-wised manner.
plot(sub$DateTime, sub$Global_active_power, type= "l", lwd=1, ylab= "Global Active Power (kilowatts)", xlab="") # Adding the first plot.
plot(sub$DateTime, sub$Sub_metering_1, type="l", ylab= "Energy sub metering", xlab="")
lines(sub$DateTime, sub$Sub_metering_2, type="l", col="red")
lines(sub$DateTime, sub$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, bty="n", col=c("black", "red", "blue")) # The end of adding the second plot.
plot(sub$DateTime, sub$Voltage, type="l", xlab="datetime", ylab="Voltage")   # Adding the third plot.
plot(sub$DateTime, sub$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")  # Adding the forth plot.
dev.off()
