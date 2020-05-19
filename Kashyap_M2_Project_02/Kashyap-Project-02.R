#Kashyap-Project-02 ALY6000
#Manoj Kashyap


#1. PRINT  "Plotting Basics: Your last name"  
print("Plotting Basics: Kashyap")

#2 IMPORT Libraries: FSA, FSAdata, magrittr,  dplyr, plotrix, ggplot2, moments
library(FSA)
library(FSAdata)
library(magrittr)
library(dplyr)
library(plotrix)
library(ggplot2)
library(moments)

#3.LOAD The dataset BullTroutRML2  using command data(“BullTroutRML2”)  
#Note the dataset is already imported into your project when you added  the libraries FSA and FSAdata.
#You only need to load the dataset.

data("BullTroutRML2") #Loading dataset

#4.PRINT  first and last 3 records dataset BullTroutRML2

head(BullTroutRML2, 3) # First 3 records
tail(BullTroutRML2, 3) #Last 3 records

#5 REMOVE all the records from BullTroutRML2 EXCEPT those from Harrison Lake 
levels(BullTroutRML2$lake)
Bull_Harrison <- filterD(BullTroutRML2, lake == "Harrison")
Bull_Harrison

#6 DISPLAY again the first and last 5 records from dataset BullTroutRML2
head(Bull_Harrison, 5)  # First 5 records
tail(Bull_Harrison, 5)  # Last 5 records

#7 DISPLAY the structure of the filtered BullTroutRML2 dataset
str(Bull_Harrison)

#8 DISPLAY the summary of the filtered BullTroutRML2 dataset
summary(Bull_Harrison)

#9 PLOT A SCATTERPLOT ( The spec:  age (y variable) and fl (x variable) from 
#the "filtered-Harrison " BullTroutRML2. Set limits on x axis 0,500 and y axis 0,15.
#Title is "Plot1: Harrison Lake Trout Scatter"
#Label the y axis "Age (yrs)" and x axis "Fork Length (mm)", 
#Use a filled small circle for the plotted data points)

#method-1
attach(Bull_Harrison) # Attaches Bull_Harrison for current script
plot(fl, age, xlim = c(0,500), ylim = c(0,15),
     main = "Plot1: Harrison Lake Trout Scatter",
     ylab = "Age (yrs)", xlab = "Fork Length (mm)",
     pch=16, las=1)

#method-2
plot(fl, age, xlim = c(0,500), ylim = c(0,15),
     main = "Plot1: Harrison Lake Trout Scatter",
     ylab = "Age (yrs)", xlab = "Fork Length (mm)",
     pch=16, yaxt='n')
axis(2, at = seq(0,15, 5), labels=seq(0,15,5), las=2)


#10 PLOT2 HISTOGRAM: a BullTroutRML2 age histogram with y axis label: 
#Frequency, x axis label:Age (yrs),  Title: Plot2: Harrison Fish Age Histogram
#Both x and y axis limits 0 15

hist(Bull_Harrison$age,
     xlab = "Age (yrs)",
     main = "Plot2: Harrison Fish Age Histogram",
     xlim = c(0,15), ylim = c(0,15),
     col = 'cyan')

#11 PLOT3 OVERDENSE SCATTERPLOT: Solution: use 2 levels of shading with 
#2 levels of green data points, y axis limits:0 to 15, x axis limits 0 to 500,
#y axis label:#Age (yr), X axis label: Fork Length (mm), Title: Plot3: Harrison Density 
#Shaded By #Era, plot solid circles as data points

attach(Bull_Harrison) # Attaches Bull_Harrison for current script
cola <- c('green','darkgreen')

plot(fl, age, xlim = c(0,500), ylim = c(0,15),
     main = "Plot3: Harrison Density Shaded By #Era",
     ylab = "Age (yrs)", xlab = "Fork Length (mm)",
     pch=19, las=1,
     col= cola[era])

#---------------------------------------------------------
#This code is just to use 2 colors for the data-points
attach(Bull_Harrison) # Attaches Bull_Harrison for current script
plot(fl, age, xlim = c(0,500), ylim = c(0,15),
     main = "Plot: Harrison Density Dual Color",
     ylab = "Age (yrs)", xlab = "Fork Length (mm)",
     pch=21, las=1,
     col='darkgreen', bg='green')
#----------------------------------------------------------

#12 CREATE tmp object with the first 3 and last 3 records of BullTroutRML2 and 
str(Bull_Harrison)  #Structure
tmp <- Bull_Harrison[c(1,2,3,59,60,61), ]
tmp

#13 DISPLAY the "era" column (variable) of the tmp object
tmp$era #As variable
tmp[,"era", drop=FALSE] #As dataframe

#14 CREATE a pchs vector with numerical  arguments for + and x 
pchs <- c(3,4) #numerical  arguments for + = 3 and x = 4 #Creating Numeric Vector
class(pchs) 

#14 CREATE a cols vector with the two elements: "red" and "gray60" 
cols <- c("red","gray60") #Creating character Vector
class(cols)   

#15 CONVERT the tmp era values to numeric
class(tmp$era)  #Factor
levels(tmp$era)  #2 levels
numEra <- as.numeric(tmp$era) #Creating Numeric Vector
numEra
class(numEra)

#16 INITIALIZE the cols vector with tmp era values
cols[numEra]<- initialize(tmp$era) #Creating character Vector
cols
class(cols)

#17 NOW PLOT4: (The spec: age(y variable) versus fl (x variable), 
# Title Plot:"Plot4: Symbol & #Color By Era, Set x variable limits 0, 500 and 
#y variable limits 0, 15, Set y axis label equal to "Age"
#and x axis label equal to Fork Length (mm).
#set pch equal to pchs era values and col equal to cols era values
attach(Bull_Harrison)
cols <- c("red","gray60")

plot(fl, age, xlim = c(0,500), ylim = c(0,15),
     main = "Plot4: Symbol & Color By Era",
     ylab = "Age (yrs)", xlab = "Fork Length (mm)",
     pch = pchs[era], col = cols[era])


#18 PLOT a regression line overlay on PLOT4:  Title PLOT5: "Plot5: Regression Overlay
attach(Bull_Harrison)
cols <- c("red","gray60")

plot(fl, age, xlim = c(0,500), ylim = c(0,15),
     main = "Plot5: Regression Overlay",
     ylab = "Age (yrs)", xlab = "Fork Length (mm)",
     pch = pchs[era], col = cols[era])
abline(lm(age~fl), col='darkcyan', lty= 5, lw = 1.5) #Adds Regression line

#19 PLOT6: Place a Legend overlay on PLOT5
#?legend
attach(Bull_Harrison)
cols <- c("red","gray60")

plot(fl, age, xlim = c(0,500), ylim = c(0,15),
     main = "Plot6: Legend Overlay",
     ylab = "Age (yrs)", xlab = "Fork Length (mm)",
     pch = pchs[era], col = cols[era])
abline(lm(age~fl), col='darkcyan', lty= 5, lw = 1.5) #Adds Regression line
legend("topleft", inset=.05, c('1977-80', '1997-01'),  #Adds Legend
       pch = pchs, col=c("red", "gray60"),
       bty = "n")


