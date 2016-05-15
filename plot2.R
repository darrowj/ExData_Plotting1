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

plot(powerDateTime, subPowerConsum$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.copy(png, file = "plot2.png")
dev.off()