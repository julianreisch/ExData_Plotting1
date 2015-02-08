plot2<-function(){
  Sys.setlocale("LC_TIME", "English")
  data<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.string="?")
  data<-na.omit(data)
  data<-data[data$Date %in% c("1/2/2007","2/2/2007"),]
  data$datetime<-as.POSIXct(paste(data$Date,data$Time), format="%d/%m/%Y %H:%M:%S")
  data$Global_active_power<-as.numeric(data$Global_active_power)
  png("plot2.png",width=480,height=480)
  plot(data$datetime,data$Global_active_power,type="l", main="", xlab="", ylab="Global Active Power (in kilowatts)",cex.lab=0.8,cex.axis=0.8)
  dev.off()
}
