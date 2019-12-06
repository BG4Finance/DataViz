library(readr)
library(ggplot2)
library(dplyr)

#setwd("~YOUR PATH TO FILE~")
df <- read_csv("WBData.csv", na = "0")

# Modify the code as below to consider single countries
# macroGDP <- df[c(seq(218,228,1),45,150,67),]
macroGDP <- df[seq(218,228,1),]
macroGDPpc <- df[seq(446,456,1),]
macroCONS <- df[seq(674,684,1),]
macroCONS$`2012 [YR2012]`[8] <- 200
regions <- macroGDP$`Country Name`

#Dataframe composition
data12 <- data_frame(regions, round(as.numeric(macroGDP$`2012 [YR2012]`),2), +
                       round(as.numeric(macroGDPpc$`2012 [YR2012]`),2), +
                       round(as.numeric(macroCONS$`2012 [YR2012]`),2))
names(data12) <- c("regions", "GDP", "GDPpc", "consumptionKW")
data12 <- arrange(data12,desc(GDP))

#Early graph
ggplot(data12, aes(x=GDPpc, y=consumptionKW, size = GDP)) + geom_point(alpha=0.7)

#Advanced one
ggplot(data12, aes(x=GDPpc, y=consumptionKW, size=GDP, color=regions, label = regions)) +
  geom_point(alpha=0.5) +
  scale_size(range = c(1, 40), name="GDP") +
  geom_text(size=3,hjust=0, vjust=0) 

