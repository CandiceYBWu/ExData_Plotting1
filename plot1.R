# calculate a rough estimate of how much memory the dataset will require in memory 
#  the number of megabytes of the data
memory.est <- 2075259 * 9 * 8 / 2^20

# loading the data
# extract subset "using data from the dates 2007-02-01 and 2007-02-02"
data.cp1 <- read.table("household_power_consumption.txt",header=T,sep=";")
data.sub <- data.cp1[which(data.cp1[,1]=="1/2/2007" | data.cp1[,1]=="2/2/2007"),]

# convert variables
# Date/Time & Numeric
data.sub$DT <- strptime(paste(data.sub$Date,data.sub$Time),"%d/%m/%Y %H:%M:%S")

for(i in 3:8){
    data.sub[,i] <- as.character(data.sub[,i])
    data.sub[which(data.sub[,i] == "?"),i] <- NA
    data.sub[,i] <- as.numeric(data.sub[,i])
}


# plot1.png
png('plot1.png')
hist(data.sub[,3],ylim=c(0,1200),xlab="Global Active Power (kilowatts)",main="Global Active Power",col="red")
dev.off()


