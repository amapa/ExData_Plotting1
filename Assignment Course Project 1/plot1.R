# Plot 1

# First we load the data. 
# ***PLEASE, INTRODUCE THE LOCATION OF THE DATA FILE IN YOUR PC BEFORE YOU START***
setwd("YOUR WORKING DIRECTORY HERE")
x <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

# Now we subset the data to only use the observations from dates 2007-02-01 and 2007-02-02
y <- x[x$Date == "1/2/2007"  | x$Date == "2/2/2007",]

# Now we transform the Global_active_power variable to numeric
y <- transform(y, Global_active_power = as.numeric(as.character(Global_active_power)))

# Now we create the histogram
png("plot1.png", width = 480, height = 480)
hist(y$Global_active_power, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")
dev.off()
