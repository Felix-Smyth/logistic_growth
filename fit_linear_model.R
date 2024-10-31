#Script to estimate the model parameters using a linear approximation

install.packages("dplyr")
library(dplyr)

growth_data <- read.csv("experiment.csv")

#Case 1. K >> N0, t is small
# K is the carrying capacity of the population
# N0 is the starting population size of the bacterial population
# r is the growth rate of the population

data_subset1 <- growth_data %>% filter(t<1500) %>% mutate(N_log = log(N))

model1 <- lm(N_log ~ t, data_subset1)
summary(model1)

# gradient is 0.01 so the the rate of growth for this time period is 0.01
# N0 is the intercept of the model which is 6.89

#Case 2. N(t) = K

data_subset2 <- growth_data %>% filter(t>2000)

model2 <- lm(N ~ 1, data_subset2)
summary(model2)

# there is no gradient 
# not entirely sure about the meaning or result of the second model
# carrying capacity of the data is 5.99 x10^10

