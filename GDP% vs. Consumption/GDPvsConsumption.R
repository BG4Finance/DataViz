library(readr)
library(ggplot2)
library(dplyr)

#setwd("~YOUR PATH TO FILE~")
df <- read_csv("WBData.csv", na = "0")

# Modify the code as below to consider single countries
# macroGDP <- df[c(seq(218,228,1),45,150,67),] 
#The sequence interpolate macro regions dta, the single fugures are 5 
macroGDP <- df[c(seq(218,228,1),36,189,96,54,27),]
macroGDPpc <- df[c(seq(446,456,1),264,417,324,282,255),]
macroCONS <- df[c(seq(674,684,1),492,645,552,510,483),]
#Missing data entry and region name string
macroCONS$`2012 [YR2012]`[8] <- 200
regions <- macroGDP$`Country Name`

#Dataframe composition and arrangements
data12 <- data_frame(regions, round(as.numeric(macroGDP$`2012 [YR2012]`),2), +
                       round(as.numeric(macroGDPpc$`2012 [YR2012]`),2), +
                       round(as.numeric(macroCONS$`2012 [YR2012]`),2))
names(data12) <- c("regions", "GDP", "GDPpc", "consumptionKW")
data12 <- arrange(data12,desc(GDP))

#Early graph, mostly to test the dataframe
ggplot(data12, aes(x=GDPpc, y=consumptionKW, size = GDP)) + geom_point(alpha=0.7)

#Advanced one
ggplot(data12, aes(x=GDPpc, y=consumptionKW, size=GDP, color=regions, label = regions)) +
  geom_point(alpha=0.5) +
  scale_size(range = c(1, 50), name="GDP") +
  geom_text(size=6,hjust=0, vjust=0) +
  expand_limits(x = c(0, 6), y = c(0,17000)) +
  labs(title = "GDP vs. Electric Consumption pro capita, Width is actual GDP pro capita ") +
  labs(x = "GDP growth % pro capita", y = "Electric consumption pro capita (KW)") +
  labs(caption = "(based on data from World Bank Dataset)") +
  theme(legend.key.size = unit(0.05, "cm"), panel.background = 
          element_rect(fill = "white", colour = "#6D9EC1"),
        panel.grid.major = element_line(size = 0.25, linetype = 'solid', colour = "gray")
        )


  
 
 