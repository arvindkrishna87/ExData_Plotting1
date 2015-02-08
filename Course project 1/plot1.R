'Reading data'
raw_data<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")

'Converting 'Date' into date format'
raw_data$Date<-as.Date(raw_data$Date,format="%d/%m/%Y")

'Extracting required data'
useful_data<-subset(raw_data,Date=='2007-02-01' | Date=='2007-02-02')

'Developing the histogram'
hist(useful_data$Global_active_power,xlab="Global Active Power (kilowatts)",main="Global Active Power",col="red")

'Saving the graph to png file'
dev.copy(png,file="plot1.png",height=480,width=480)
dev.off()