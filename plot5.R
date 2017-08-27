#setwd(paste(getwd(),"/R/", sep = ""))
library(dplyr)
library(ggplot2)
library(stringr)
NEI <- readRDS("summarySCC_PM25.rds") %>% tbl_df()
SCC <- readRDS("Source_Classification_Code.rds") %>% tbl_df()

Emissions_Mobile <- merge(NEI,SCC,by.x = "SCC", by.y ="SCC", all.x = TRUE)%>%
                   filter(str_detect(EI.Sector, "Mobile.*Vehicles") & fips == "24510")
png("plot5.png")
p <-  ggplot(data=Emissions_Mobile, aes(x=factor(year), y=Emissions))+
  geom_bar(position = "dodge", stat="identity", fill = "Blue")+
  ggtitle ("Emissions By Motor Vehicles In Baltimore")+
  labs(x="Year", y="Emissions in tons")

print(p)
dev.off()