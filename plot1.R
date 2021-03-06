# Create plot1
# graph histogram of Global_active_power

cn = c("Date","Time","Global_active_power","Global_reactive_power",
        "Voltage","Global_intensity","Sub_metering_1","Sub_metering_2",
        "Sub_metering_3")

dt <- read.table("household_power_consumption.txt",col.names=cn,sep=";",
                 na.strings = "?", skip=66637,nrows=2880)

png("plot1.png", width=480, height=480)
hist(dt$Global_active_power,col="Red",xlab="Global Active Power (kilowatts)",
     ylab="Frequency", main="Global Active Power")
dev.off()
