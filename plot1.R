setwd("D:/Education/Coursera/Exploratory Data Analysis/week1/assignment/")
getwd()
setAs("character","Date", function(from) as.Date(from, format="%d/%m/%Y") )

powerConsum <- read.csv("household_power_consumption.txt",sep = ";",na.strings = "?",header=TRUE,
                        colClasses = c("myDate", "character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
dim(powerConsum)
head(powerConsum)
tail(powerConsum)
str(powerConsum)

DATE1 <- as.Date("2007-02-01")
DATE2 <- as.Date("2007-02-02")

subPowerConsum <- subset(powerConsum, Date >= DATE1 & Date <= DATE2)

dim(subPowerConsum)
head(subPowerConsum)
tail(subPowerConsum)
str(subPowerConsum)

remove(powerConsum)

hist(subPowerConsum$Global_active_power, main = "Global Active Power", col = "red", ylab = "Frequency", xlab = "Global Active Power (kilowatts)")

dev.copy(png, file = "plot1.png")
dev.off()