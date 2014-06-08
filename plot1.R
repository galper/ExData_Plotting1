##plot 1
library(data.table) 
file<-fread("household_power_consumption.txt", sep=";",na.strings="?")
### fread() is faster  then for read.csv() for large files
my_data<-subset(file,Date=="1/2/2007" |Date=="2/2/2007")
png(filename="plot1.png",width=480,height=480)
my_data$Global_active_power<-as.numeric(my_data$Global_active_power)
hist(my_data$Global_active_power,main="Global active power",xlab="Global Active Power (kilowatts)",col="RED")
dev.off()