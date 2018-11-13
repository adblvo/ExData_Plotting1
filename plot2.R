# Create plot2
# using x-axis datetime, y-axis Global Active Power

library(lubridate)

col_names = c("Date","Time","Global_active_power","Global_reactive_power",
        "Voltage","Global_intensity","Sub_metering_1","Sub_metering_2",
        "Sub_metering_3")

dt <- read.table("household_power_consumption.txt",col.names=col_names,sep=";",
                 na.strings = "?", skip=66637,nrows=2880)

dt$DateTime <- with(dt, dmy(Date) + hms(Time))

png("plot2.png", width=480, height=480)
plot(dt$DateTime,dt$Global_active_power, type='l',xlab='',ylab="Global Active Power(kilowatts)")
dev.off()
