# Plot 4

# First we load the data. 
# ***PLEASE, INTRODUCE YOUR WORKING DIRECTORY BEFORE WE START AND BE SURE THE DATA IS ON YOUR WD***
setwd("YOUR WORKING DIRECTORY HERE")
x <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

# Now we subset the data to only use the observations from dates 2007-02-01 and 2007-02-02
y <- x[x$Date == "1/2/2007"  | x$Date == "2/2/2007",]

# Now we create a Date-Time variable
y$DateTime <- strptime(paste(y$Date, y$Time), format = "%d/%m/%Y %H:%M:%S")

# Now lets create the four graphics
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))
with(y, plot(DateTime,Global_active_power, ylab = "Global Active Power", type = "l", xlab = ""))
with(y, plot(DateTime,Voltage, ylab = "Voltage", type = "l"))
with(y, plot(DateTime,Sub_metering_1, ylab = "Energy sub metering", type = "l", xlab = ""))
with(y, lines(DateTime, Sub_metering_2, col = "red"))
with(y, lines(DateTime, Sub_metering_3, col = "blue"))
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),bty = "n")
with(y, plot(DateTime,Global_reactive_power, type = "l"))
dev.off()

