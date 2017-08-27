#setwd(paste(getwd(),"/R/", sep = ""))
library(dplyr)
library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds") %>% tbl_df()
SCC <- readRDS("Source_Classification_Code.rds") %>% tbl_df()

NEI_Sum_Baltimore2 <- filter(NEI, fips == "24510") %>% group_by(type,year) %>% summarise(EmiSum = sum (Emissions))

png("plot3.png")
p <-  ggplot(data=NEI_Sum_Baltimore2, aes(x=factor(year), y=EmiSum,fill = type))+
      geom_bar(position = "dodge", stat="identity")+
      ggtitle ("Emissions By Type In Baltimore")+
      labs(x="Year", y="Emissions in tons")
print(p)
dev.off()

