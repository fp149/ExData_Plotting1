
# read in data
# note: data file must be in working directory

cons_data <- read.table("household_power_consumption.txt"
                        , header = TRUE
                        , sep = ";"
                        , colClasses = c("character", "character" , "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")
                        , na.strings = "?")

# extract relevant data
cons_data <- cons_data[cons_data$Date == "1/2/2007" | cons_data$Date == "2/2/2007", ]

# initialize PNG file
png(filename = "plot1.png", width = 480, height = 480, units = "px")

# plot values
hist(cons_data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

# close device
dev.off()