# Load libraries
library(data.table)

# Load whole data into workspace using fread
data <- fread('household_power_consumption.txt', header=T, sep=';')

# Subset only Feb 1 and 2
feb <- subset(data, Date == '1/2/2007' | Date == '2/2/2007')

# Convert Date and Time
feb$DateTime <- strptime(paste(feb$Date, feb$Time), format="%d/%m/%Y %H:%M:%S")

# Plot histogram
par(mfrow=c(1,1))
png(filename='plot3.png', width=480, height=480, bg='transparent')
plot(x=feb$DateTime, y=as.numeric(feb$Sub_metering_1), type='l', xlab='', ylab='Energy sub metering')
lines(x=feb$DateTime, y=as.numeric(feb$Sub_metering_2), type='l', col='red')
lines(x=feb$DateTime, y=as.numeric(feb$Sub_metering_3), type='l', col='blue')
legend(x='topright', legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), col=c('black', 'red', 'blue'), lty=c(1, 1, 1))
dev.off()