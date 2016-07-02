#plot1.R
#Reading File and Subset
data <- read.table("household_power_consumption.txt", header=TRUE, stringsAsFactors=FALSE, dec=".", sep = ";")
sub <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]

#Plotting
sub$Global_active_power <- as.numeric(sub$Global_active_power)
png("plot1.png")
hist(sub$Global_active_power, col = "red", xlab = "Global Active Power(kilowatts)", main = "Global Active Power")
dev.off()