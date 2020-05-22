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


png("plot2.png", width = 480, height = 480)
    plot(PowerData2$DateTime, PowerData2$Global_active_power, type ="l", col= "black", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()