#Kashyap_M1_Project_01  ALY6000 =============================
#Manoj Kashyap

#a.	Page 19: INSTALL the vcd package
install.packages('vcd')

#b.	Page 19: IMPORT the vcd library
library(vcd)

#c.	Page 9: PLOT a sales ~ temp scatter plot  Specs: yaxis: < sales >
# sales data: (8,11,15,20,21,11,18,10,6,22)
# temperature data: (69,80,77,84,80,77,87,70,65,90)
sales <- c(8,11,15,20,21,11,18,10,6,22)
sales
class(sales)      #Note: Creating numeric
typeof(sales)     #Note: Elements of sales are double

temp <- c(69,80,77,84,80,77,87,70,65,90)
temp
class(temp)      #Note: Creating numeric
typeof(temp)     #Note: Elements of temp are double

plot(temp, sales)  #Scatter ploteswith Specification: yaxis: < sales >

#EDA
#d.	Page 9: FIND the mean temperature
mean(temp)  #Average temperature
sd(temp)    #Deviation

#e.	Google: DELETE the 3rd element (#15 ) from the sales vector
sales
sales[3]
length(sales)

sales <- sales[-3]  #Deleting 3rd element
sales
sales[3]
length(sales)  #Length reduced by 1

#f.	Google: INSERT 16 as the 3rd element in the sales vector {Here existing 3rd element is Replaced}
sales
sales[3]

sales[3] <- 16
sales
sales[3]
length(sales)

#We can also append element without Replacing the existing one 
?append
sales <- c(8,11,15,20,21,11,18,10,6,22)
sales
sales <- append(sales, 16, after = 2)
sales
length(sales)



#g.	Page 22: CREATE a vector < names > with elements Tom, Dick, Harry

names <- c("Tom", "Dick", "Harry")
class(names)     #Creating character


#h.	Page 23: CREATE a 5 row and 2 column matrix of 10 integers  
mat1 <- matrix(1:10, nrow = 5, ncol = 2)  #By default its Column wise insertion
mat1

#Improvised
cells <- 1:10   #Elements
rname <- c('R1', 'R2', 'R3', 'R4', 'R5')  #Row names
cname <- c('C1', 'C2')                    #Column names
mymat <- matrix(cells, nrow = 5, ncol = 2, byrow = TRUE,    #Row wise insering
                dimnames = list(rname, cname))
mymat


#a.	Page 26: CREATE a data frame <icSales> with sales and temp attributes
sales <- c(8,11,15,20,21,11,18,10,6,22)
icSales <- data.frame(sales, temp)
icSales
class(icSales)  #Creating Dataframe
class(icSales$sales)
class(icSales$temp)

#b.	Pages 28-31: DISPLAY the data frame structure of icSales
str(icSales)

#c.	Pages 28-31: DISPLAY a summary of the icSales data frame
summary(icSales)


#Student.csv ===================
#d.	Pages 34-37: IMPORT the data set as Student.csv
# --------------This is my Working directory ------------------------
getwd()
setwd("/Users/manojkashyap/Desktop/Intro to Analy_ALY6000/WEEK_01/Kashyap_M1_Project_01")
# -------------------------------------------------------------------

grades <- read.table("studentgrades.csv", header=TRUE,
                     row.names="StudentID", sep=",")
grades # print data frame
str(grades)
summary(grades)

# Alternatively, import the data while specifying column classes 
grades <- read.table("studentgrades.csv", header=TRUE,
                     row.names="StudentID", sep=",",
                     colClasses=c("character", "character", "character",
                                  "numeric", "numeric", "numeric"))
grades
str(grades)
summary(grades)

#Using read.csv
grades <- read.csv("studentgrades.csv", row.names="StudentID")
grades

class(grades) #Creating a "data.frame"
str(grades)
summary(grades)





