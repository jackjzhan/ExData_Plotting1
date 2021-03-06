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

#Generate Plot 4
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(sub_dat, {
  plot(Global_active_power~dat_date, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  plot(Voltage~dat_date, type="l", 
       ylab="Voltage (volt)", xlab="")
  plot(Sub_metering_1~dat_date, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~dat_date,col='Red')
  lines(Sub_metering_3~dat_date,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~dat_date, type="l", 
       ylab="Global Rective Power (kilowatts)",xlab="")
})

dev.copy(png,'../Programming_Assignment/Assignment1/Plot4.png', height=480, width=480)
dev.off()
