# R code to make the plots for the assignment 1
library(dplyr)
library(chron)

# read in the data
data <- data.table::fread(file = "~/Data_Science/exploratory_data_analysis/household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")

# format the Date format 
data$Date <- as.Date(data$Date, "%d/%m/%Y")

# subset the data 
data_sub<-filter(data, Date == "2007-02-01" | Date ==  "2007-02-02")

#format time 
data_sub$Time <- strptime(paste(data_sub$Date, data_sub$Time), "%Y-%m-%d %H:%M:%S")



### plotting graphs ### 
#plot1
png(filename = "~/Data_Science/exploratory_data_analysis/plot1.png")
plot1 <- hist(data_sub$Global_active_power,main  ="Global Active Power", ylab = "Frequency" ,xlab = "Global Active Power (kilowatts)", col = "red")
dev.off()

#plot2
png(filename = "~/Data_Science/exploratory_data_analysis/plot2.png")
with(data_sub, plot(Time, Global_active_power, type="l", ylab  ="Global Active Power (kilowatts)", xlab=""))
dev.off()

#plot3
png(filename = "~/Data_Science/exploratory_data_analysis/plot3.png")
with(data_sub, plot(Time, Sub_metering_1, type="l", ylab  ="Energy sub metering", xlab=""))
lines(data_sub$Time, data_sub$Sub_metering_2, col = "red")
lines(data_sub$Time, data_sub$Sub_metering_3, col = "blue")

legend("topright", col = c("black","red","blue"), lty= c(1,1,1), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()

#plot4
png(filename = "~/Data_Science/exploratory_data_analysis/plot4.png")

#specify margins:
par(mfcol=c(2,2), mar = c(4,4,2,1))

#subplot1
with(data_sub, plot(Time, Global_active_power, type="l", ylab  ="Global Active Power", xlab=""))  

#subplot2
with(data_sub, plot(Time, Sub_metering_1, type="l", ylab  ="Energy sub metering", xlab=""))
lines(data_sub$Time, data_sub$Sub_metering_2, col = "red")
lines(data_sub$Time, data_sub$Sub_metering_3, col = "blue")
legend("topright", col = c("black","red","blue"), lty= c(1,1,1), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = 0.75, bty = "n")

#subplots3
plot(data_sub$Time, data_sub$Voltage, type = "l", xlab="datetime", ylab="Voltage")

#subplots4
plot(data_sub$Time, data_sub$Global_reactive_power, type = "l", xlab="datetime", ylab  ="Global_reactive_power")

dev.off()
