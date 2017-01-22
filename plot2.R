# Read in data
df <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
dfFinal <- df[(df$Date == "1/2/2007") | (df$Date == "2/2/2007") ,]

dfFinal$Date <- as.Date(dfFinal$Date, format = "%d/%m/%Y")
dfFinal$dateTime <- as.POSIXct(paste(dfFinal$Date, dfFinal$Time), "%d/%m/%Y %H:%M:%S")

# Construct Plot 2
plot(dfFinal$dateTime, dfFinal$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.copy(png, filename = "plot2.png", width = 480, height = 480)
dev.off()