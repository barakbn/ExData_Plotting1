
# Read data from file

data<-read.csv("household_power_consumption.txt", sep = ";", skip = 66636, nrows = 3000)

names(data)<-c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

# Subsetting dataframe to required dates

dates<-as.Date(data[,1],"%d/%m/%Y")

dataForDatesBooleans<-(dates==as.Date("2007-02-01") | dates==as.Date("2007-02-02"))

dataForDates<-data[dataForDatesBooleans,]

# Making the Plot

dateTime<-strptime(paste(dataForDates[,1], dataForDates[,2]), "%d/%m/%Y %H:%M:%OS")

sm1 <- as.numeric(as.vector(dataForDates$Sub_metering_1))

sm2 <- as.numeric(as.vector(dataForDates$Sub_metering_2))

sm3 <- as.numeric(as.vector(dataForDates$Sub_metering_3))

png("plot3.png", width=480, height=480)

Sys.setlocale("LC_TIME", "English")

plot(x=dateTime, y=sm1, type="n", ylab = "Energy sub metering", xlab = "")

lines(x=dateTime, y=sm1, col="Black")

lines(x=dateTime, y=sm2, col="Red")

lines(x=dateTime, y=sm3, col="Blue")

legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), pch=NA, lty=1)

dev.off()
