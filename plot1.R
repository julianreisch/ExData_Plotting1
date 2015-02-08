plot1<-function(){
  Sys.setlocale("LC_TIME", "English")
  data<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.string="?")
  data<-na.omit(data)
  data<-data[data$Date %in% c("1/2/2007","2/2/2007"),]
  data$Date<-strptime(data$Date,format="%d/%m/%Y")
  data$Global_active_power<-as.numeric(data$Global_active_power)
  png("plot1.png",width=480,height=480)
  hist(data$Global_active_power,freq=TRUE,col="red",xlab="Global Active Power (kilowatts)",xlim=c(0,8),xaxt="n",cex.lab=0.8,cex.axis=0.8,main="Global Active Power");axis(1, c(0,2,4,6),cex.lab=0.8,cex.axis=0.8)
  dev.off()
}
