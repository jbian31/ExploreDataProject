#setwd(paste(getwd(),"/R/", sep = ""))
library(dplyr)
library(ggplot2)
library(stringr)
library(ggpubr)
NEI <- readRDS("summarySCC_PM25.rds") %>% tbl_df()
SCC <- readRDS("Source_Classification_Code.rds") %>% tbl_df()

Emissions_Mobile2 <- merge(NEI,SCC,by.x = "SCC", by.y ="SCC", all.x = TRUE)%>%
  filter(str_detect(EI.Sector, "Mobile.*Vehicles") & (fips == "24510" | fips == "06037"))


png("plot6.png")
p1 <-  ggplot(data=subset(Emissions_Mobile2,fips == "24510"), aes(x=factor(year), y=Emissions))+
  geom_bar(position = "dodge", stat="identity", fill = "Green")+
  ggtitle ("Emissions By Motor Vehicles In Baltimore")+
  labs(x="Year", y="Emissions in tons")


p2 <-  ggplot(data=subset(Emissions_Mobile2,fips == "06037"), aes(x=factor(year), y=Emissions))+
  geom_bar(position = "dodge", stat="identity", fill = "Blue")+
  ggtitle ("Emissions By Motor Vehicles In LA")+
  labs(x="Year", y="Emissions in tons")

ggarrange(p1,p2, nrow = 2, ncol = 1)
dev.off()


