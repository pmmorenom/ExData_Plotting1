# EXPLORATORY DATA ANALYSIS. ASSIGNMENT WEEK 1
# PLOT 1

# Read data
df = read.csv("household_power_consumption.txt", header=TRUE, sep=";", dec=".")
df$Date = as.Date(df$Date, format="%d/%m/%Y")

# Subset (only 2 specific dates)
df2 = df[df$Date == "2007-02-01" | df$Date == "2007-02-02",]

# Plot
png(file = "plot1.png", width = 480, height = 480)
df2$Global_active_power = as.numeric(as.character(df2$Global_active_power))
hist(df2$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()