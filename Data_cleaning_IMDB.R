#importing dataset

dataset <- read.csv("Movie_data.csv")

#Checking Datatype
str(dataset)

#converting datatypes
dataset$year <- as.numeric(dataset$year)
dataset$runtime <- as.numeric(dataset$runtime)

str(dataset)
#Re import dataset after finding null values creating by doing above method



#install library
#library: DPLYR
#import library
library(dplyr)

#Removing Extra Elements

dataset$year <- gsub("\\(|\\)","",dataset$year)
View(dataset)

dataset$runtime = gsub("min","",dataset$runtime)
View(dataset)

#Datatype Coversion

dataset$year = as.numeric(dataset$year)
dataset$runtime <- as.numeric(dataset$runtime)

str(dataset)

#Removing Extra column

dataset = subset(dataset,select = -(X))
View(dataset)

#Generating random numbers

set.seed(124)

#Adding coloumn in dataset

dataset$gross = runif(50,min = 100000, max = 10000000)
View(dataset)

dataset$rank = c(1:50)
View(dataset)

#Rearranging our dataset

dataset = dataset[c("rank","name","rating","runtime","year","genre","gross")]
View(dataset)

#Adding NA to Gross cells

dataset[10,7] = NA
dataset[25,7] = NA
dataset[45,7] = NA
dataset[1,7] = NA
dataset[50,7] = NA

#working on missing values

dataset$gross = ifelse(is.na(dataset$gross), 
                       ave(dataset$gross,FUN = function(x) mean(x,na.rm = TRUE)),
                       dataset$gross)

#Creating a watch list with imdb rating > 8.6

dataset$watch_list = dataset$rating > 8.6
View(dataset)

str(dataset)

dataset$watch_list = as.factor(dataset$watch_list)
View(dataset)

str(dataset)

#Categorical data
dataset$watch_list = factor(dataset$watch_list,
                            levels = c("TRUE","FALSE"),
                            labels = c(1,0))

View(dataset)

