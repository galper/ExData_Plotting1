##plot 3
library(data.table) 
file<-fread("household_power_consumption.txt", sep=";",na.strings="?")
### fread() is faster  than  read.csv() for reading large files
my_data<-subset(file,Date=="1/2/2007" |Date=="2/2/2007")
date_time<-paste(my_data$Date,my_data$Time)
date_time<-as.POSIXlt((strptime(date_time,format="%d/%m/%Y %H:%M:%S")))
png(filename="plot3.png",width=480,height=480)
with(my_data, 
     plot(date_time, Sub_metering_1,type="l",col="black",xlab="",ylab="Energy sub metering"))
    with(my_data,lines(date_time,Sub_metering_2,col="red"))
     with(my_data,lines(date_time,Sub_metering_3,col="blue"))
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=1,lwd=2,col=c("black","red","blue"),
       ncol=1,cex=0.8, 
       bty="1",  
       inset =c(0,0),
       text.col=c("black"))
dev.off()