#setwd(paste(getwd(),"/R/", sep = ""))
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
NEI_Sum_Baltimore <- with(subset(NEI,fips == "24510"), tapply(Emissions/1000,year,sum))

png("plot2.png")
p <- barplot(NEI_Sum_Baltimore,main = "Total Emissions Over Years in Baltimore", xlab = "Year", ylab = "Emissions in Ktons", col = "blue")
print(p)
dev.off()