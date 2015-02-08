'Reading data'
raw_data<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")

'Converting Date into date format'
raw_data$Date<-as.Date(raw_data$Date,format="%d/%m/%Y")

'Extracting required data'
useful_data<-subset(raw_data,Date=='2007-02-01' | Date=='2007-02-02')

'Combining date and time in one field'
useful_data$moment<-as.POSIXct(paste(useful_data$Date, useful_data$Time), format="%Y-%m-%d %H:%M:%S")

'Plotting the required line chart'
plot(useful_data$moment,useful_data$Sub_metering_1,type='l',col="black",ylab="Energy sub metering",xlab="",yaxp=c(0,30,3))
lines(useful_data$moment,useful_data$Sub_metering_2,col="red")
lines(useful_data$moment,useful_data$Sub_metering_3,col="blue")

'Putting the legend'
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),pch = c(NA, NA, NA),lty = c(1, 1, 1),cex=0.75)

'Saving the graph to png file'
dev.copy(png,file="plot3.png",height=480,width=480)
dev.off()