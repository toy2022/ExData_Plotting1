###############################################################################
# Course Title        : Exploratory Data Analysis Project
# Data source         : UC Irvine Machine Learning Repository
# Date                : July 10, 2022
# Prepared by         : TOY
###############################################################################

# To clear the global workspace
####################
rm(list = ls())

# Install packages to easing workflow
####################
#install.packages("data.table")
#install.packages("stringr")
#install.packages("plyr")
#install.packages("tidyverse")
#install.packages("dplyr")
#install.packages("tidyr")
#install.packages("Hmisc")
#install.packages("dtplyr")
#install.packages("tidyfast")
#install.packages("glue")
#install.packages("lubridate")
#install.packages("readr")
#install.packages("janitor")
#install.packages("tools")
#install.packages("lessR")
#install.packages("tableone")
#install.packages("ggplot2")

# Laoding of the packages
##################
library(data.table)
library(stringr)
library(plyr)
library(tidyverse)
library(dplyr)
library(tidyr)
library(Hmisc)
library(dtplyr) 
library(tidyfast)
library(glue)
library(lubridate)
library(readr)
library(janitor)
library(tools)
library(lessR)
library(tableone)
library(ggplot2)

memory.limit(1200000)
gc()

# Pathway and load the data-set
################
setwd ("C:/Users/tyeabah/Downloads/exdata_data_household_power_consumption")
hhpower <- read.table("household_power_consumption.txt",skip=1,sep=";")
hhpower_df <- tbl_df(hhpower)

# Name and subset the data-set
################
names(hhpower_df) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
hhpower_df$Date <- as.Date(hhpower_df$Date)
subpower <- subset(hhpower_df, hhpower_df$Date == "1/2/2007" | hhpower_df$Date == "2/2/2007")

# Basic plot function
###############
subpower$Global_active_power <- as.numeric(subpower$Global_active_power)
png("plot1.png", width = 480, height = 480)
hist(subpower$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power(kilowatts)")
