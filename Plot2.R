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

#Generate Plot 2
#Plot 2
plot(sub_dat$Global_active_power~sub_dat$dat_date, 
     type="l",
     ylab="Global Active Power (kilowatts)", 
     xlab="")

dev.copy(png,'../Programming_Assignment/Assignment1/Plot2.png', height=480, width=480)
dev.off()

