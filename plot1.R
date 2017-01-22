# Read in data
df <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
dfFinal <- df[(df$Date == "1/2/2007") | (df$Date == "2/2/2007") ,]

dfFinal$Date <- as.Date(dfFinal$Date, format = "%d/%m/%Y")
dfFinal$dateTime <- as.POSIXct(paste(dfFinal$Date, dfFinal$Time), "%d/%m/%Y %H:%M:%S")

# Construct Plot 1
hist(dfFinal$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
dev.copy(png, filename = "plot1.png", width = 480, height = 480)
dev.off()
