#Script to plot data and model
# Plotting the logistic growth model (estimated from the collected values of 
# the other models in the "fit_linear_model.R" script) over the actual data 
# points and trend

growth_data <- read.csv("experiment.csv")

logistic_fun <- function(t) {
  
  N <- (N0*K*exp(r*t))/(K-N0+N0*exp(r*t))
  
  return(N)
  
}
# Creation of a function for the logistic growth model
# This function requires three inputs: The starting population size, the growth 
# rate and the carrying capacity of the population

N0 <- 987
# calculated from the intercept of the linear model representing the log of the 
# exponential growth phase
  
r <- 0.0100
# calculated from the gradient of the linear model representing the log of the 
# exponential growth phase
  
K <- 5.979e+10 
# calculated from the intercept of the second linear model where the population 
# has reached carrying capacity

ggplot(aes(t, N), data = growth_data) +
  
  geom_function(fun=logistic_fun, colour="red") +
  
  geom_point()
# Plotting a graph of the logistic growth model along side the data to see how
# well they fit one another
# Very accurate fit to one another which is to be expected


ggplot(aes(t, N), data = growth_data) +
  
  geom_function(fun=logistic_fun, colour="red") +
  
  geom_point()+
  
  scale_y_continuous(trans='log10')
# Plotting of the graph with the addition of transforming the y axis by log10
# This allows for visualisation of the linear section of the graph when the log
# transformation is applied as well as the accuracy of fit of the logistic growth
# model


sink(file = "package-versions.txt")
sessionInfo()
sink()
# This step makes a link of the packages saved and then puts them all into a file
# together
