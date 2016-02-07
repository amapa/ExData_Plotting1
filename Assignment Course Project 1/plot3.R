# Plot 3

# First we load the data. 
# ***PLEASE, INTRODUCE YOUR WORKING DIRECTORY BEFORE WE START AND BE SURE THE DATA IS ON YOUR WD***
setwd("YOUR WORKING DIRECTORY HERE")
x <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

# Now we subset the data to only use the observations from dates 2007-02-01 and 2007-02-02
y <- x[x$Date == "1/2/2007"  | x$Date == "2/2/2007",]

# Now we create a Date-Time variable
y$DateTime <- strptime(paste(y$Date, y$Time), format = "%d/%m/%Y %H:%M:%S")

# Now we create the plot3
png("plot3.png", width = 480, height = 480)
with(y, plot(DateTime,Sub_metering_1, ylab = "Energy sub metering", type = "l"))
with(y, lines(DateTime, Sub_metering_2, col = "red"))
with(y, lines(DateTime, Sub_metering_3, col = "blue"))
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))
dev.off()
