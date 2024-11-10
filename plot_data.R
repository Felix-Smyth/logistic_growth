#Script to plot the logistic growth data

growth_data <- read.csv("experiment.csv")
# This data is from a simulated experiment of the logistic growth curve of Escherichia coli
# downloaded off OSF

# install.packages("ggplot2")
# do not want to run install.packages each time, it only needs running once

library(ggplot2)

View(growth_data)
# looking at the growth dataframe before visualisation through plots

ggplot(aes(t,N), data = growth_data) +
  
  geom_point() +
  
  xlab("t") +
  
  ylab("y") +
  
  theme_bw()
# Visualisation of the data without any transformations
# The data shows an apparent logisitic growth curve

ggplot(aes(t,N), data = growth_data) +
  
  geom_point() +
  
  xlab("t") +
  
  ylab("y") +
  
  scale_y_continuous(trans='log10')
# Plotting the data with a log transformed y axis
# This appears to convert the exponential growth rate stage of the graph above
# into a straight line
# This linearity then tails off as the resources in the culture become depleted
# from the increasing population size, resulting in the population tailing off 
# and reaching its carrying capacity
