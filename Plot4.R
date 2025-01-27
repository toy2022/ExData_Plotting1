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
###############
hhpower[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]

# Making a POSIXct date capable and graphing by time of day
###############
hhpower[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

# Filter Dates for 2007-02-01 and 2007-02-02
###############
hhpower <- hhpower[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]

par(mfrow=c(2,2))

# Plot 1
##############
plot(hhpower[, dateTime], hhpower[, Global_active_power], type="l", xlab="", ylab="Global Active Power")

# Plot 2
#############
plot(hhpower[, dateTime],hhpower[, Voltage], type="l", xlab="datetime", ylab="Voltage")

# Plot 3
#############
plot(hhpower[, dateTime], hhpower[, Sub_metering_1], type="l", xlab="", ylab="Energy sub metering")
lines(hhpower[, dateTime], hhpower[, Sub_metering_2], col="red")
lines(hhpower[, dateTime], hhpower[, Sub_metering_3],col="blue")
legend("topright", col=c("black","red","blue")
       , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       , lty=c(1,1)
       , bty="n"
       , cex=.5) 

# Plot 4
#############
plot(hhpower[, dateTime], hhpower[,Global_reactive_power], type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()