# Create plot4
# plot Global active power vs time
# plot Voltage vs time
# plot Sub metering 1,2,3 vs time
# plot Global reactive power vs time

library(lubridate)

col_names = c("Date","Time","Global_active_power","Global_reactive_power",
        "Voltage","Global_intensity","Sub_metering_1","Sub_metering_2",
        "Sub_metering_3")

dt <- read.table("household_power_consumption.txt",col.names=col_names,sep=";",
                 na.strings = "?", skip=66637,nrows=2880)
dt$DateTime <- with(dt, dmy(Date) + hms(Time))


png("plot4.png", width=480, height=480)
par(mfrow=c(2,2),mar=c(4,4,1,1))

plot(dt$DateTime,dt$Global_active_power, type='l',xlab='',ylab="Global Active Power")

plot(dt$DateTime,dt$Voltage, type='l',xlab='datetime', ylab="Voltage")

plot(dt$DateTime,dt$Sub_metering_1, type='l',xlab='',ylab="Energy sub metering")
lines(dt$DateTime,dt$Sub_metering_2, type='l',xlab='',col="Red")
lines(dt$DateTime,dt$Sub_metering_3, type='l',xlab='',col="Blue")
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"), lty=1,lwd=1)


plot(dt$DateTime,dt$Global_reactive_power, type='l',xlab='datetime', ylab="Global_reactive_power")

dev.off()
