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
