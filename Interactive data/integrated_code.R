library(shiny)
library(ggplot2)

data <- read.csv("Grades.csv", sep = ";")
grades <- data[1:43,]
avg <- data[47:54,1:3]
avgapp <- data[c(47:54),3]

major <- function (data,m) {
  source <- paste0(data,"$",m)
  return(source)
}

grades$Major[41]
grades$GradeXECTS[41]

eco <- 0
c_eco <- 0
fin <- 0
c_fin <- 0
inf <- 0
c_inf <- 0
sci <- 0
c_sci <- 0

for (i in seq(1,43)) {
  if (grades$Major[i] == "Economics"){
    eco <- eco + grades$GradeXECTS[i]
    c_eco <- c_eco + grades$ECTS[i]
  }
  if (grades$Major[i] == "Finance"){
    fin <- fin + grades$GradeXECTS[i]
    c_fin <- c_fin + grades$ECTS[i]
  }
  if (grades$Major[i] == "Informatics"){
    inf <- inf + grades$GradeXECTS[i]
    c_inf <- c_inf + grades$ECTS[i]
  }
  if (grades$Major[i] == "Science"){
    sci <- sci + grades$GradeXECTS[i]
    c_sci <- c_sci + grades$ECTS[i]
  }
}

minor_df <- cbind.data.frame(rbind.data.frame("Econimics","Finance","Informatics","Science"),
                             rbind.data.frame(eco/c_eco, fin/c_fin, inf/c_inf, sci/c_sci))
names(minor_df) <- c("Minor","Mean")

ggplot(minor_df, aes(y = minor_df$Mean, x=minor_df$Minor)) + 
  geom_col(fill = 'dark blue') +
  labs(x = 'Minor', y = 'Mean')

avg$Grade
avgapp






entry <- data.frame(semester, avg$Grade)
start <-2
fine <- 6

ggplot(avg[c(start:fine),], aes(x=avg$Course[c(start:fine)], y=avg$Grade[c(start:fine)], group=1)) +
  geom_line(color="blue") +
  geom_point(colour="black", size=2) +
  ylim(6.8,8.2) + labs(x = "Semester", y = "Average Grade")




