#Script to estimate the model parameters using a linear approximation

# install.packages("dplyr")
# Installation of the package is only required once, otherwise errors can arise 
# as well as the code slowing down due to package installation repetition
library(dplyr)

growth_data <- read.csv("experiment.csv")

#Case 1. K >> N0, t is small
# Finding the parameters of a model for the linear section of the log transformed
# exponential growth stage, previously shown at the base of the "plot_data.R" 
# script

# K is the carrying capacity of the population
# N0 is the starting population size of the bacterial population
# r is the growth rate of the population


data_subset1 <- growth_data %>% filter(t<1500) %>% mutate(N_log = log(N))
# filtering of the data for when t is less than 1500
# this value was estimated from the log tranformed plot in the "plot_data.R" 
# script where the linear section of the graph stopped

model1 <- lm(N_log ~ t, data_subset1)
summary(model1)
# running a linear model between log N and t to find the gradient and intercept

# Gradient of this model is 0.0100 so the the rate of growth for this time period is 0.01
# log(N0) is the intercept of the model which is 6.89
# base of log in r is e 
# therefore N0 is e^6.8941704 which is equal to 987 (3sf)
# This seems accurate as we also know the bacterial count at N0 from the data 
# set which is 879

#Case 2. N(t) = K

data_subset2 <- growth_data %>% filter(t>2000)
# Filtering the data set for when the population size of the culture plateaus 
# and remains constant
# This occurs when t is greater than 2000

model2 <- lm(N ~ 1, data_subset2)
summary(model2)
# Running a linear model for the second filtered data subset looking at the 
# carrying capacity stage 

# The gradient of this stage is 0 which is to be expected
# The carrying capacity of the population in this model is the intercept and 
# is 5.979 x10^10 as seen from the model summary
# Therefore 5.979 x10^10 is K

