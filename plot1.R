## Getting full dataset
md <- read.csv("./household_power_consumption.txt", header=T, sep=';', na.strings="?", 
               nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
md$Date <- as.Date(md$Date, format="%d/%m/%Y")

## Subsetting the data
md0 <- subset(md, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(md)

## Converting dates
md2 <- paste(as.Date(md0$Date), md0$Time)
md0$Datetime <- as.POSIXct(md2)

## Plot 1
hist(md0$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Saving to file
dev.copy(png, file="./plot1.png", height=480, width=480)
dev.off()
