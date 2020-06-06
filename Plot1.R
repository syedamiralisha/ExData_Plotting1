#getwd()
rm(list=ls())

#reading data into R
elet<- read.table("/Users/mario/Learning/MOOC_John Hopkins/Exploratory Data Analysis/Prog Assign_1/household_power_consumption.txt", sep=";",nrows= 2075260, header=TRUE, quote= "", strip.white=TRUE, stringsAsFactors = FALSE, na.strings= "?")

# Subsetting the full data to obtain the data related to two days: 
sub<- subset(elet, (elet$Date == "1/2/2007" | elet$Date== "2/2/2007")) 

# creating Plot1
png("plot1.png", width=480, height= 480)
hist(sub$Global_active_power, col= "red", xlab= "Global Active Power (kilowatts)", ylab= "Frequency", main= "Global Active Power")
dev.off()
