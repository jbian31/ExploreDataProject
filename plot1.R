#setwd(paste(getwd(),"/R/", sep = ""))
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
NEI_Sum <- with(NEI, tapply(Emissions/1000,year,sum))

png("plot1.png")
p <-barplot(NEI_Sum,main = "Total Emissions Over Years in United States", xlab = "Year", ylab = "Emissions in Ktons", col = "blue")
print(p)
dev.off()