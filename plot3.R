setwd("D:/Education/Coursera/Exploratory Data Analysis/week1/assignment/")
getwd()

powerConsum <- read.csv("household_power_consumption.txt",sep = ";",na.strings = "?",header=TRUE,
                        colClasses = c("character", "character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
dim(powerConsum)
head(powerConsum)
tail(powerConsum)
str(powerConsum)

subPowerConsum <- subset(powerConsum, Date %in% c("1/2/2007", "2/2/2007"))


dim(subPowerConsum)
head(subPowerConsum)
tail(subPowerConsum)
str(subPowerConsum)

remove(powerConsum)

powerDateTime <- strptime(paste(subPowerConsum$Date, subPowerConsum$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

plot(powerDateTime, subPowerConsum$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(powerDateTime, subPowerConsum$Sub_metering_2, type="l", col="red")
lines(powerDateTime, subPowerConsum$Sub_metering_3, type="l", col="blue")

legend("topright", c("Sub Meter 1", "Sub Meter 2", "Sub Meter 3"), lty=1, lwd=3, col=c("black", "red", "blue"))

dev.copy(png, file = "plot3.png")
dev.off()