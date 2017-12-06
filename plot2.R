
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

# initialize PNG file
png(filename = "plot2.png", width = 480, height = 480, units = "px")

# plot values
plot(date_time_data, cons_data$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

# close device
dev.off()