# Create plot3
# graph sub_meeting 1,2,3 on same graph with x-axis datetime

library(lubridate)

cn = c("Date","Time","Global_active_power","Global_reactive_power",
        "Voltage","Global_intensity","Sub_metering_1","Sub_metering_2",
        "Sub_metering_3")

dt <- read.table("household_power_consumption.txt",col.names=cn,sep=";",
                 na.strings = "?", skip=66637,nrows=2880)
dt$DateTime <- with(dt, dmy(Date) + hms(Time))

png("plot3.png", width=480, height=480)

plot(dt$DateTime,dt$Sub_metering_1, type='l',xlab='',ylab="Energy sub metering")
lines(dt$DateTime,dt$Sub_metering_2, type='l',xlab='',col="Red")
lines(dt$DateTime,dt$Sub_metering_3, type='l',xlab='',col="Blue")
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"), lty=1,lwd=1)

dev.off()
