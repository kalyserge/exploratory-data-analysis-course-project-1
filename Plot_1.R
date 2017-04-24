#Plot 1
## Check if directory already exists? and download.file
setwd("C:/Users/user/Documents/datasciencecoursera")
if(!file.exists("./coursera-exploratory-data-analysis-course-project-1")){
  dir.create("./coursera-exploratory-data-analysis-course-project-1")
}
dataset_url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(dataset_url,destfile="./coursera-exploratory-data-analysis-course-project-1/Electric_power_consumption.zip",mode = "wb")
unzip(zipfile="./coursera-exploratory-data-analysis-course-project-1/Electric_power_consumption.zip", exdir = "./coursera-exploratory-data-analysis-course-project-1/Electric_power_consumption")
path <- file.path("./coursera-exploratory-data-analysis-course-project-1" , "Electric_power_consumption")

#plotting 1
data_full <- read.csv(file.path(path, "household_power_consumption.txt" ), header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data1 <- subset(data_full, Date %in% c("1/2/2007","2/2/2007"))
data1$Date <- as.Date(data1$Date, format="%d/%m/%Y")
hist(data1$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

#Saving
png("./coursera-exploratory-data-analysis-course-project-1/plot1.png", width=480, height=480)
dev.off()
