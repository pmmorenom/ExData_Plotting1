# EXPLORATORY DATA ANALYSIS. ASSIGNMENT WEEK 1
# PLOT 3

# Add line to ensure weekday labels are in English
Sys.setlocale(category = "LC_ALL", locale = "english")

# Read data
df = read.csv("household_power_consumption.txt", header=TRUE, sep=";", dec=".")
df$Date = as.Date(df$Date, format="%d/%m/%Y")

# Subset (only 2 specific dates)
df2 = df[df$Date == "2007-02-01" | df$Date == "2007-02-02",]

# Plot
png(file = "plot3.png", width = 480, height = 480)
df2$Sub_metering_1 = as.numeric(as.character(df2$Sub_metering_1))
df2$Sub_metering_2 = as.numeric(as.character(df2$Sub_metering_2))
df2$Sub_metering_3 = as.numeric(as.character(df2$Sub_metering_3))
df2$Time = as.character(df2$Time)
df2$datetime = paste(df2$Date, df2$Time)
df2$datetime = strptime(df2$datetime, format="%Y-%m-%d %H:%M:%S")
plot(df2$date, df2$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="", col="black")
lines(df2$date, df2$Sub_metering_2, type="l", col="red")
lines(df2$date, df2$Sub_metering_3, type="l", col="blue")
legend("topright", lty="solid", col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()