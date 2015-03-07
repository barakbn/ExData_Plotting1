
# Read data from file

data<-read.csv("household_power_consumption.txt", sep = ";", skip = 66636, nrows = 3000)

names(data)<-c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

# Subsetting dataframe to required dates

dates<-as.Date(data[,1],"%d/%m/%Y")

dataForDatesBooleans<-(dates==as.Date("2007-02-01") | dates==as.Date("2007-02-02"))

dataForDates<-data[dataForDatesBooleans,]

# Making the Plot

gap <- as.numeric(as.vector(dataForDates$Global_active_power))

dateTime<-strptime(paste(dataForDates[,1], dataForDates[,2]), "%d/%m/%Y %H:%M:%OS")

png("plot2.png", width=480, height=480)

Sys.setlocale("LC_TIME", "English")

plot(dateTime, gap, type="l", ylab="Global Active Power (kilowatts)", xlab="")

dev.off()