# EXPLORATORY DATA ANALYSIS. ASSIGNMENT WEEK 1
# PLOT 2

# Add line to ensure weekday labels are in English
Sys.setlocale(category = "LC_ALL", locale = "english")

# Read data
df = read.csv("household_power_consumption.txt", header=TRUE, sep=";", dec=".")
df$Date = as.Date(df$Date, format="%d/%m/%Y")

# Subset (only 2 specific dates)
df2 = df[df$Date == "2007-02-01" | df$Date == "2007-02-02",]

# Plot
png(file = "plot2.png", width = 480, height = 480)
df2$Global_active_power = as.numeric(as.character(df2$Global_active_power))
df2$Time = as.character(df2$Time)
df2$datetime = paste(df2$Date, df2$Time)
df2$datetime = strptime(df2$datetime, format="%Y-%m-%d %H:%M:%S")
plot(df2$date, df2$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.off()