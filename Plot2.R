###############################################################################
# Course Title        : Exploratory Data Analysis Project
# Data source         : UC Irvine Machine Learning Repository
# Date                : July 10, 2022
# Prepared by         : TOY
###############################################################################

# Pathway and load the data-set
################
setwd ("C:/Users/tyeabah/Downloads/exdata_data_household_power_consumption")
hhpower <- data.table::fread(input = "household_power_consumption.txt"
                             , na.strings="?")

# Prevents notation
hhpower[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]

# Making a POSIXct date capable and graphing by time of day
hhpower[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

# Filter Dates for 2007-02-01 and 2007-02-02
hhpower <- hhpower[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]

## Plot
plot(x = hhpower[, dateTime]
     , y = hhpower[, Global_active_power]
     , type="l", xlab="", ylab="Global Active Power (kilowatts)")
