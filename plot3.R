# Read in data
df <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
dfFinal <- df[(df$Date == "1/2/2007") | (df$Date == "2/2/2007") ,]

dfFinal$Date <- as.Date(dfFinal$Date, format = "%d/%m/%Y")
dfFinal$dateTime <- as.POSIXct(paste(dfFinal$Date, dfFinal$Time), "%d/%m/%Y %H:%M:%S")

# Construct Plot 3
plot(dfFinal$dateTime, dfFinal$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(dfFinal$dateTime, dfFinal$Sub_metering_2, col="red")
lines(dfFinal$dateTime, dfFinal$Sub_metering_3, col="blue")
legend("topright", col=c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 1, cex = 0.75)
dev.copy(png, filename = "plot3.png", width = 480, height = 480)
dev.off()