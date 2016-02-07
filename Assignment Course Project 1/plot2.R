# Plot 2

# First we load the data. 
# ***PLEASE, INTRODUCE YOUR WORKING DIRECTORY BEFORE WE START AND BE SURE THE DATA IS ON YOUR WD***
setwd("YOUR WORKING DIRECTORY HERE")
x <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

# Now we subset the data to only use the observations from dates 2007-02-01 and 2007-02-02
y <- x[x$Date == "1/2/2007"  | x$Date == "2/2/2007",]

# Now we create a Date-Time variable
y$DateTime <- strptime(paste(y$Date, y$Time), format = "%d/%m/%Y %H:%M:%S")

# Finally we create the line plot
png("plot2.png", width = 480, height = 480)
with(y, plot(DateTime,Global_active_power, ylab = "Global Active Power (kilowatts)", type = "l"))
dev.off()

