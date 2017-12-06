
# read in data
# note: data file must be in working directory

cons_data <- read.table("household_power_consumption.txt"
                        , header = TRUE
                        , sep = ";"
                        , colClasses = c("character", "character" , "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")
                        , na.strings = "?")

# extract relevant data
cons_data <- cons_data[cons_data$Date == "1/2/2007" | cons_data$Date == "2/2/2007", ]

# create a datetime vector for x axis
date_time_data <- as.POSIXct(paste(cons_data$Date, cons_data$Time), format = "%d/%m/%Y %H:%M:%S")

# plot 4

# initialize PNG file
png(filename = "plot4.png", width = 480, height = 480, units = "px")

# set chart matrix size
par(mfrow = c(2,2))

# plot values
plot(date_time_data, cons_data$Global_active_power, type = "l", ylab = "Global Active Power", xlab = "")

plot(date_time_data, cons_data$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")

plot(date_time_data, cons_data$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(date_time_data, cons_data$Sub_metering_2, col = "red")
lines(date_time_data, cons_data$Sub_metering_3, col = "blue")
legend("topright"
       , legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
       , col = c("black", "red", "blue")
       , lty = c(1, 1, 1)
       , bty = "n")
        

plot(date_time_data, cons_data$Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime")

# close device
dev.off()