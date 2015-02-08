plot3<-function(){
  Sys.setlocale("LC_TIME", "English")
  data<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.string="?")
  data<-na.omit(data)
  data<-data[data$Date %in% c("1/2/2007","2/2/2007"),]
  data$datetime<-as.POSIXct(paste(data$Date,data$Time), format="%d/%m/%Y %H:%M:%S")
  data$Global_active_power<-as.numeric(data$Global_active_power)
  png("plot3.png",width=480,height=480)
  plot(data$datetime,data$Sub_metering_1,type="l", main="", xlab="", ylab="Energy sub metering",cex.lab=0.8,cex.axis=0.8)
  lines(data$datetime,data$Sub_metering_2,col="red")
  lines(data$datetime,data$Sub_metering_3,col="blue")
  legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lwd = .75, cex = .75)
  dev.off()
}
