
setwd("C:/Users/george.adam.kilgore/Desktop/CourseraDataScience/Exploratory Analysis")

PowerData <- read.table("./household_power_consumption.txt", sep = ";",header = TRUE)
PowerData$Global_active_power <- as.character(PowerData$Global_active_power)
PowerData2 <- filter(PowerData,PowerData$Date=="1/2/2007" | PowerData$Date =="2/2/2007",PowerData$Global_active_power != "?")
colnames(PowerData2) <- colnames(PowerData)
PowerData2$Global_active_power <- as.numeric(PowerData2$Global_active_power)
PowerData2$DateTime <- paste(PowerData2$Date,PowerData2$Time,sep = " ")
PowerData2$DateTime <- strptime(PowerData2$DateTime, format = "%d/%m/%Y %H:%M:%S")
PowerData2$Sub_metering_1 <- as.numeric(as.character(PowerData2$Sub_metering_1))
PowerData2$Sub_metering_2 <- as.numeric(as.character(PowerData2$Sub_metering_2))
PowerData2$Voltage <- as.numeric(as.character(PowerData2$Voltage))
PowerData2$Global_reactive_power <- as.numeric(as.character(PowerData2$Global_reactive_power))


png("plot1.png", width = 480, height = 480)
    hist(PowerData2$Global_active_power,col = "red",xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()



png("plot2.png", width = 480, height = 480)
    plot(PowerData2$DateTime, PowerData2$Global_active_power, type ="l", col= "black", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()



png("plot3.png", width = 480, height = 480)
    plot(PowerData2$DateTime,PowerData2$Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy Sub Metering", yaxt = "n")
    axis(2,seq(0,30,10))
    points(PowerData2$DateTime,PowerData2$Sub_metering_2, type = "l", col = "red")
    points(PowerData2$DateTime,PowerData2$Sub_metering_3, type = "l", col = "blue")
    legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"),lty = 1)
dev.off()




png("plot4.png", width = 480, height = 480)
    par(mfrow = c(2,2))
    plot(PowerData2$DateTime, PowerData2$Global_active_power, type ="l", col= "black", xlab = "", ylab = "Global Active Power")
    plot(PowerData2$DateTime, PowerData2$Voltage, xlab = "datetime", ylab = "Voltage", type = "l")
    plot(PowerData2$DateTime,PowerData2$Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy Sub Metering", yaxt = "n")
        axis(2,seq(0,30,10))
        points(PowerData2$DateTime,PowerData2$Sub_metering_2, type = "l", col = "red")
        points(PowerData2$DateTime,PowerData2$Sub_metering_3, type = "l", col = "blue")
        legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"),lty = 1, box.lty = 0, bg="transparent")
    plot(PowerData2$DateTime, PowerData2$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power", lwd = .5)
dev.off()
















