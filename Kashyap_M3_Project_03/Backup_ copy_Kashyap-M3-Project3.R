#Kashyap-M3-Project3
print("Manoj Kashyap")

#Loading Linraries
library(FSA)
library(FSAdata)
library(magrittr)
library(tidyr)
library(plyr)  #Load this 1st before dplyr
library(dplyr)
library(tidyverse)

#First part ================================

#A. CREATE 4 vectors height, weight, sex, married. The values for the 
#vectors: #height: (65, 72, 78, 69, 70), #weight: (150, 120, 250, 175, 180)
#sex: ("M", "F", "M","M", "M") #married: (TRUE, FALSE, FALSE, TRUE, #TRUE)
height <- c(65, 72, 78, 69, 70)
weight <- c(150, 120, 250, 175, 180)
sex <-  c("M", "F", "M","M", "M")
married <- c(TRUE, FALSE, FALSE, TRUE, TRUE)

height
class(height)
weight
class(weight)
sex
class(sex)
married
class(married)


#B. CREATE and DISPLAY a vector < age > 30, 22,45,27,33 with associated 
# labels Jim, Sally, Paul, Sam and John 
#Your display should appear as 
#Jim Sally  Paul   Sam  John 
#30   22   45    27      33
age <- c(30, 22,45,27,33)
age
labels <- c("Jim", "Sally", "Paul", "Sam", "John")

names(age) <- labels #Labelling a vector
age     #Printing age with labels
names(age)        #Print only labells
as.numeric(age)   #Print only values
#stack(attr(age, "Sally"))

class(age)
is_vector(age)
str(age)


#C  SELECT and DISPLAY the second entry in < age > vector
age[2]

#D SELECT and DISPLAY the 1st and 5th elements in < age >
age[c(1,5)]

#E. SUBTRACT Sally’s age from the value 42.
42 - age["Sally"]

age["Sally"]  #I'm not assigning, above is just subtracted

#----------------------
#J. SUBTRACT Sallys’ age from 42 but #don’t print out Sally’s name 
class(age)
age["Sally"]
as.numeric(age["Sally"])
42 - as.numeric(age["Sally"])
as.numeric(42 - age["Sally"])

#-----------------------

#K. DISPLAY the data type class of the vector is sex?
class(sex)

#L. CREATE a vector named < sexFac > which is a factor.
sexFac <- as_factor(sex)
sexFac

#M. DISPLAY the levels for the factor sexFac
levels(sexFac)

#N. DISPLAY out your working directory 
getwd()
setwd("/Users/manojkashyap/Desktop/Intro to Analy_ALY6000/Week_03/Kashyap_M3_Project_03")
getwd()


#Seccond part ===================================
#O IMPORT inchBio.csv and name the table < bio >
#bio <- read.csv("inchBio.csv")  #Don't use it...we cant convet as Table in V, 
bio <- read.table("inchBio.csv", header=TRUE,
                  sep=',')
class(bio)


#P DISPLAY the head, tail and structure of < bio >
head(bio)
tail(bio)

#-------------------------------------
#Q CREATE an object < counts > that counts and lists all the Species record 
#counts <- cbind(length(bio$species), list(bio$species))
#length(table(bio$species))

counts <- unique(bio$species)
counts

#as.numeric(unique(bio$species))
#counts <- as.numeric(unique(bio$species))
#counts <- table(bio$species)
#-------------------------------------

#R Display just the 8 levels (names) of the species
class(bio$species)
levels(bio$species)
nlevels(bio$species)

#S CREATE a < tmp > object that displays the different species 
#and the number of records of each species in the dataset
tmp <-  table(bio$species)  #Is like value_counts() in Python
tmp
class(tmp)
tmp[1]


#T CREATE SUBSET < tmp2 > of just the species variable and display the first
#five records
temp2 <- subset(bio, select = species)
head(temp2, 5)
class(temp2)

#U Print you last name
tail(temp2, 1)    #Last name in temp2
print("Kashyap")  #My last name

#V CREATE a TABLE named < w > of the species variable. Display class of w
w <- table(bio$species)
w
class(w)

#W CONVERT < w > to a data frame, name the data frame < t > and display the #results
t <- as.data.frame(w)
class(t)
t

#X EXTRACT and display the  frequency values from the < t > data frame
#table(t)  #Is like value_counts() in Python..It works if we imported as read.csv
t$Freq

#Y CREATE a table named < cSpec > from the bio species attribute (variable). 
#and confirm you created a table which displays the number of each species in
#the dataset < bio >
# cSpec <- as.data.frame(table(subset(bio, select = species)))  #Is like value_counts() in Python
# cSpec
# class(cSpec)
cSpec <- table(bio$species)
cSpec
class(cSpec)


#Z CREATE a table named  < cSpecPct > that displaces the species 
#and percentage of the records for each species.Confirm you created a table 
#class

# cSpecPct <- as.data.frame(prop.table(table(bio$species)))
# cSpecPct
# 
# cSpecPct <- as.data.frame(prop.table(table(bio$species)) * 100)  #Scaled to 100
# cSpecPct
# class(cSpecPct)

cSpecPct <- prop.table(table(bio$species)) * 100  #Scaled to 100
cSpecPct
class(cSpecPct)

cSpecPct <- prop.table(table(bio$species))  # Scale 0 to 1
cSpecPct
class(cSpecPct)

#AA CONVERT the table < cSpecPct > to a data frame named < u >
#and confirm that < u > is a data frame
u <- as.data.frame(cSpecPct)
class(u)
u

#BB PLOT a BARPLOT of < cSpec >with y label: "COUNTS", color: "Light 
#Green", title "Fish Count",  y axis values: rotated to horizontal,   x axis font
#magnification: at 60% of nominal,
#par(mar=c(11,4,4,4))
op <- par(mar = c(10,5,5,8))  #Setting Margin size
barplot(cSpec, ylab = "COUNTS",
        col = "LightGreen",
        main = "PLOT1 Fish Count",
        las = 2,
        cex.names = 1.2,   # Maginfying x axis Labels font
        cex.axis = 1.6,   # Maginfying y axis tickles size
        cex.lab=1.2      # Maginfying y axis Labels size
        )
par(op) ## reset


#CC PLOT a BARPLOT of  < cSpecPct > with y axis limits: 0 to .4, y axis label: %, 
#color: "Light Blue, Title: "Fish Relative Frequency"
op <- par(mar = c(10,5,5,8))  #Setting Margin size
barplot(cSpecPct, ylab = "%",
        col = "LightBlue",
        main = "PLOT2 Fish Relative Frequency",
        las = 2,
        cex.names = 1.2,   # Maginfying x axis Labels font
        cex.axis = 1,     # Maginfying y axis tickles size
        cex.lab=1.5,      # Maginfying y axis Labels size
        ylim = c(0, 0.4)  #y axis limits: 0 to .4
)
par(op) ## reset

#DD REARRANGE the  < u > cSpecPct data frame in descending order of 
#relative frequency. SAVE the rearraged data frame as the object < d >
u
class(u)
d <- u %>%
        arrange(desc(Freq))  #Using dplyr
d
class(d)

#EE RENAME the < d > columns Var1 to Species, Freq to Relative Freq 
names(d) <- c("Species", "RelativeFreq")
d

#FF ADD NEW VARIABLES to the < d > data frame:  cumfreq, counts, cumcounts
d <- transform(d, cumfreq = cumsum(RelativeFreq))  #Adding cumfreq
d

d <- transform(d, counts = (RelativeFreq  * nrow(temp2))) #Adding counts
d

d <- transform(d, cumcounts = cumsum(d$counts)) #Adding cumcounts
d  #Final transformed d

#GG CREATE a parameter variable < def_par > to stor par values
def_par <- par(mar = c(10,5,5,8))  #Setting Margin size


#HH-1 CREATE the BARPLOT <pc> with the following spec:
#d$counts, width: 1, space:.15, border: NA, axes:F, yaxis limitL 
# 0,3.05*max(d$counts, na.rm: is TRUE, y label: cumulative Counts, scale x axis 
#to 70%, names.arg: d$Species, Title: Species Pareto, las=2)

barplot(d$counts, width = 1, space = 0.15,
        border = NA, axes = F,
        ylim = c(0, 3.05 * max(d$counts, na.rm = TRUE)),
        ylab = 'Cumulative Counts',
        cex.axis = 1.7,
        names.arg = d$Species,
        main = 'Species Pareto',
        las = 2
        )


#HH-2 ADD a Cumulative counts line to the < pc > plot with 
#spec line type: b, scale plotting text at .7, data values: solid circles, color: cyan4
def_par <- par(mar = c(10,5,5,8))
barplot(d$counts, width = 1, space = 0.15,
        border = NA, axes = F,
        ylim = c(0, 3.05 * max(d$counts, na.rm = TRUE)),
        ylab = 'Cumulative Counts',
        cex.axis = 1.7,
        names.arg = d$Species,
        main = 'Species Pareto',
        las = 2
        )
lines(d$cumcounts, type = 'b', pch = 19, col = 'cyan4') #Cumulative counts line

#HH-3 PLACE a grey62 box around the pareto plot
def_par <- par(mar = c(10,5,5,8))
barplot(d$counts, width = 1, space = 0.15,
        border = NA, axes = F,
        ylim = c(0, 3.05 * max(d$counts, na.rm = TRUE)),
        ylab = 'Cumulative Counts',
        cex.axis = 1.7,
        names.arg = d$Species,
        main = 'Species Pareto',
        las = 2
)
lines(d$cumcounts, type = 'b', pch = 19, col = 'cyan4') #Cumulative counts line
box(col = 'grey62') #grey62 box around the pareto plot

#HH-4 https://www.statmethods.net/advgraphs/parameters.html
##JJ ADD left side AXIS details, spec: side 2, at cumcounts, horizontal values at 
#tick marks, color: grey62,  color of axis: grey62, axis font scaled to 80% of nominal
def_par <- par(mar = c(10,5,5,8)) 
barplot(d$counts, width = 1, space = 0.15,
        border = NA, axes = FALSE,
        ylim = c(0, 3.05 * max(d$counts, na.rm = TRUE)),
        ylab = 'Cumulative Counts',
        cex.axis = 1.7,
        names.arg = d$Species,
        main = 'Species Pareto',
        las = 2
)
lines(d$cumcounts, type = 'b', pch = 19, col = 'cyan4')
box(col = 'grey62')
axis(side = 2, at = d$cumcounts, tick = TRUE,line = NA,   #left side AXIS/ y-axis
     col.ticks = "grey62",col = "grey62", cex.axis=0.8)


#Pareto chart
#HH-5 https://www.statmethods.net/advgraphs/axes.html
#ADD AXIS details on right side of box. spec: side:4, tick marks at: 
#cumcounts, #labels: 0 to cumfreq with %,  axis color: cyan5, label color: 
#cyan4, axis font scaled to 80% of nominal 

## Saving Parameters 
def_par <- par(mar = c(10,5,5,8))
pc <- barplot(d$counts, width = 1, space = 0.15,
              border = NA, axes = FALSE,
              ylim = c(0, 3.05 * max(d$counts, na.rm = TRUE)),
              ylab = 'Cumulative Counts',
              cex.axis = 1.7,
              names.arg = d$Species,
              main = 'PLOT3 Species Pareto',
              las = 2
              )

## Cumulative counts line 
lines(pc, d$cumcounts, type = 'b', pch = 19, col = 'cyan4')

## Framing plot
box(col = 'grey62')

## adding axes
axis(side = 2, at = c(0, d$cumcounts), tick = TRUE ,line = NA,   #left side AXIS/ y-axis
     col.ticks = "grey62",col = "grey62", cex.axis=0.8, las=2 )
axis(side = 4, at = c(0, d$cumcounts), col = "cyan2", cex.axis = 0.8, las = 2,  #Right side AXIS
     tick = TRUE, line = NA,
     col.axis = "dark cyan", labels = paste0(round( c(0,d$cumfreq) * 100,digits = 0), '%'))

## restoring default paramenter
par(def_par) 

# I have used cyan2 instead of cyan5, because cyan5 color code is not available and trows error.


