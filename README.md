# DataViz

In this project "Data Visualisation Portfolio" assigned by teacher Peter Gruber, at Università
della Svizzera italiana, we have been asked to gather several visualisation of different
data from different sources through any kind of software, programming language, package or
module available.

### Quickest way to test code?
Clone/Download this repository on your computer so you will be provided of all the code and source files needed to smoothly test it! In particular this will ease the deployment of the interactive Shiny App.

## First Challenge
### Good Data, Bad Visual
We must spot a bad data visualisation and make a better version out of it. The Reddit community has been super helpful for this commitment, as soon as I started working on this challenge I found two amazing Sub-Reddit:
http://github.com - automatic!
[GitHub](http://github.com)
For my case I choose to fix a bad visualisation about the correlation between GDP growth rate and consumption.

![Image of BadGraph](https://github.com/BG4Finance/DataViz/blob/master/GDP%25%20vs.%20Consumption/BAD%20GRAPH.png?raw=true)

I was able to find it

## Second Challenge
### Interactive visualisation, About Myself
An interactive data visualisation about my accademic performance measured each semester. Moreover I splitted the exam and computed each average of 4 minors:
Economics, subjects related to teorethical aspects of the economy, such as Macro/Micro-economics,Law, Monetary Economics, Business Political and Organizational Economics.
Finance, here I gathered quantitative and applied financial matters.
Informatics, programming and machine learning classes
Science, maths and statistics.

I had a couple of main issues with this visualisation challenge, in particular I couldn't not scale the bar chart for a clear minor comparison and
```r
conditionalPanel(condition = "input.type == 'uni",
                 radioButtons("course","University Course",
                              c("All"="all", "Bachelor"="bac", "Master"="msc"),
                              selected = "all"))
```
