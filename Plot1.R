# R Programming (JHU) Coursera
## Written by Jack Zhan
## 01/24/2018

setwd("C:/git/datasciencecoursera/04_Exploratory-Data-Analysis/Dataset")

dat <- fread("household_power_consumption.txt")
#Subset dat to be using data from the dates 2007-02-01 and 2007-02-02
#Format Date and Time and add as new column
sub_dat <- dat[dat$Date=="1/2/2007" | dat$Date=="2/2/2007"]
dat_date <- as.POSIXct(strptime(paste(sub_dat$Date, sub_dat$Time),"%d/%m/%Y %H:%M:%S"))
sub_dat <- cbind(sub_dat, dat_date)

#Generate Plot 1
hist(as.numeric(sub_dat$Global_active_power), 
     main="Global Active Power",
     xlab = "Global Active Power (kilowatts",
     col = "red"
)

dev.copy(png,'../Programming_Assignment/Assignment1/Plot1.png', height=480, width=480)
dev.off()
