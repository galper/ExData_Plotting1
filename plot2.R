##plot 2
library(data.table) 
file<-fread("household_power_consumption.txt", sep=";",na.strings="?")
### fread() is faster  than  read.csv() for reading large files
my_data<-subset(file,Date=="1/2/2007" |Date=="2/2/2007")
date_time<-paste(my_data$Date,my_data$Time)
date_time<-as.POSIXlt((strptime(date_time,format="%d/%m/%Y %H:%M:%S")))
png(filename="plot2.png",width=480,height=480)
with(my_data, plot(date_time, Global_active_power,type="l",col="black",xlab="",ylab="Global Active power (kilowatts)"))
dev.off()