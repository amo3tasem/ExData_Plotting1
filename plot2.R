#plot2.R
#Reading File and Subset
data <- read.table("household_power_consumption.txt", header=TRUE, stringsAsFactors=FALSE, dec=".", sep = ";")
sub <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]

#Plotting
gap <- as.numeric(sub$Global_active_power)
days <- strptime(paste(sub$Date, sub$Time), "%d/%m/%Y %H:%M:%S")
png("plot2.png")
plot(days, gap, type = "l" , xlab = "", ylab = "Global Active Power (killowats)")
dev.off()