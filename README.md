# DataViz

In this project "Data Visualisation Portfolio" assigned by teacher Peter Gruber, at Università
della Svizzera italiana, we have been asked to gather several visualisation of different
data from different sources through any kind of software, programming language, package or
module available.

#### Quickest way to test code?
Clone/Download this repository on your computer so you will be provided of all the code and source files needed to smoothly test it! In particular this will ease the deployment of the interactive Shiny App.

## First Challenge
### Good Data, Bad Visual
We must spot a bad data visualisation and make a better version out of it. The Reddit community has been super helpful for this commitment, as soon as I started working on this challenge I found two amazing Sub-Reddit:
[r/dataisugly](https://www.reddit.com/r/dataisugly/) and [r/shittydataisbeautiful](https://www.reddit.com/r/shittydataisbeautiful/) :joy:. These two threads provided me with a load of ugly or nonsense data visualisation.  
For my challenge I choose to fix this amazing graph of how GDP per capita has evolved across years in different countries compared to their per capita energy consumption.

![Image of BadGraph](https://github.com/BG4Finance/DataViz/blob/master/GDP%25%20vs.%20Consumption/BAD%20GRAPH.png?raw=true)

I think that this representation is absolutely bananas, moreover “y” and “r²” items are reported in a “legend” box but their meaning is not explained (maybe instead of a temporal evolution the graph wants to represent a regression).  
Even if the way data have been gathered and reported on the graph would be correct, there are too many lines, names and colour to get a glimpse of understanding. For almost any country is impossible to understand to which colour it belongs.  


I managed to improve and optimise this graph. First of all I needed data, and was able to collect them from ![World Bank DataBase](https://databank.worldbank.org/indicator/NY.GDP.MKTP.KD.ZG/1ff4a498/Popular-Indicators); I choose to use macro regions plus I picked few countries which I thought reader would be interested in.  I dedicated the Y-axis to pro capita electricity consumption and the X-axis to GDP pro capita growth rate.  
I choose a bubble graph to better emphasise the actual GDP pro capita volume in dollar for each region both to give a sense of measure and to ignite the curiosity of the reader.

![Image of BadGraph](https://github.com/BG4Finance/DataViz/blob/master/GDP%25%20vs.%20Consumption/FinalPlot.png?raw=true)

## Second Challenge
### Interactive visualisation, About Myself
An interactive data visualisation about my academic performance measured each semester. Moreover I split the exam and computed each average of 4 minors:  
Economics, subjects related to teorethical aspects of the economy, such as Macro/Micro-economics,Law, Monetary Economics, Business Political and Organisational Economics.
Finance, here I gathered quantitative and applied financial matters.
Informatics, programming and machine learning classes
Science, maths and statistics.
You can run the app from ![Interactive data folder](https://github.com/BG4Finance/DataViz/).  
I had a couple of issues with this visualisation challenge, mainly I could not scale the bar chart for a more clear minor comparison and the conditionalPanel command seems to not work properly
```r
conditionalPanel(condition = "input.type == 'uni",
                 radioButtons("course","University Course",
                              c("All"="all", "Bachelor"="bac", "Master"="msc"),
                              selected = "all"))
```
