#setwd(paste(getwd(),"/R/", sep = ""))
library(dplyr)
library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds") %>% tbl_df()
SCC <- readRDS("Source_Classification_Code.rds") %>% tbl_df()

Emissions_Coal <- merge(NEI,SCC,by.x = "SCC", by.y ="SCC", all.x = TRUE)%>%
               filter(EI.Sector == "Fuel Comb - Electric Generation - Coal" |EI.Sector == "Fuel Comb - Comm/Institutional - Coal")


png("plot4.png")
p <-  ggplot(data=Emissions_Coal, aes(x=factor(year), y=Emissions))+
      geom_bar(position = "dodge", stat="identity", fill = "Blue")+
      ggtitle ("Emissions By Coal Combustion In United States")+
      labs(x="Year", y="Emissions in tons")
print(p)
dev.off()