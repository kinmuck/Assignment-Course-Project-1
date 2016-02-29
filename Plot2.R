#####
## R-code for Plot1

#1.0 Set directory to read text file
setwd("C:\\Users\\Kin\\Desktop\\R files\\Data analysis\\Week1\\exdata-data-household_power_consumption")

#2.0 Read data file from local directory
dat1<-read.table("household_power_consumption.txt",sep=";",header = TRUE, na.strings = "?")
dat<-dat1  # creat of copy of the data frame for manipulation
str(dat)

#3.0 Set the Date column to date format
dat$Date <- as.Date(dat$Date, format = "%d/%m/%Y")
head(dat$Date)

#4.0 Only keep the data for the 2 days required
dat<- dat[dat$Date >= "2007-02-01" & dat$Date <= "2007-02-02", ]

#5.0 Combine the Date and Time columns and create a new column call datetime with strptime

datetime<-paste(dat$Date,dat$Time,sep=" ")
datetime<-strptime(datetime,format="%Y-%m-%d %H:%M:%S")
dat$datetime<-datetime

# 6.0 plot line graph
plot(dat$datetime, dat$Global_active_power, type="l", ylab="Global Active Power (kilowatts)",xlab="")

#7.0 Save as PNG file
dev.copy(png,'Plot2.png')

#8.0 dev.off
dev.off()

