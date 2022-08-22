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

## Plot 3
with(md0, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
## Saving to file
dev.copy(png, file="./plot3.png", height=480, width=480)
dev.off()
