#plot4.R
#Reading File and Subset
data <- read.table("household_power_consumption.txt", header=TRUE, stringsAsFactors=FALSE, dec=".", sep = ";")
sub <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]

#Plotting
gap <- as.numeric(sub$Global_active_power)
voltage <- as.numeric(sub$Voltage)
days <- strptime(paste(sub$Date, sub$Time), "%d/%m/%Y %H:%M:%S")
met1 <- as.numeric(sub$Sub_metering_1)
met2 <- as.numeric(sub$Sub_metering_2)
met3 <- as.numeric(sub$Sub_metering_3)
re_ac <- as.numeric(sub$Global_reactive_power)
png("plot4.png")
par(mfrow = c(2,2))
#1
plot(days, gap, type = "l", xlab = "", ylab = "Global Active Power (killowats)")
#2
plot(days, voltage, type = "l", xlab = "datetime", ylab = "Voltage")
#3
plot(days, met1, type = "l", ylab = "Energy Sub metering", xlab = "")
lines(days, met2, type = "l", col = "red")
lines(days, met3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"), 
       lty=1, lwd=2.5)
#4
plot(days, re_ac, type = "l", xlab = "datetime", ylab = "Global Reactive Power")
dev.off()