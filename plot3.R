#plot3.R
#Reading File and Subset
data <- read.table("household_power_consumption.txt", header=TRUE, stringsAsFactors=FALSE, dec=".", sep = ";")
sub <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]

#Plotting
sub$Sub_metering_1 <- as.numeric(sub$Sub_metering_1)
sub$Sub_metering_2 <- as.numeric(sub$Sub_metering_2)
sub$Sub_metering_3 <- as.numeric(sub$Sub_metering_3)
days <- strptime(paste(sub$Date, sub$Time), "%d/%m/%Y %H:%M:%S")
png("plot3.png")
plot(days, sub$Sub_metering_1, type = "l", ylab = "Energy Submetering", xlab = "")
lines(days, sub$Sub_metering_2, type = "l", col = "red")
lines(days, sub$Sub_metering_3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"), 
       lty=1, lwd=2.5)
dev.off()