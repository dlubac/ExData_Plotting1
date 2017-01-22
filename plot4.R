# Read in data
df <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
dfFinal <- df[(df$Date == "1/2/2007") | (df$Date == "2/2/2007") ,]

dfFinal$Date <- as.Date(dfFinal$Date, format = "%d/%m/%Y")
dfFinal$dateTime <- as.POSIXct(paste(dfFinal$Date, dfFinal$Time), "%d/%m/%Y %H:%M:%S")

# Construct Plot 4
par(mfrow = c(2,2))
plot(dfFinal$dateTime, dfFinal$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")

plot(dfFinal$dateTime, dfFinal$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

plot(dfFinal$dateTime, dfFinal$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(dfFinal$dateTime, dfFinal$Sub_metering_2, col="red")
lines(dfFinal$dateTime, dfFinal$Sub_metering_3, col="blue")
legend("topright", col=c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1), lwd = 2, cex = 0.5, bty = "n")

plot(dfFinal$dateTime, dfFinal$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
dev.copy(png, filename = "plot4.png", width = 480, height = 480)
dev.off()