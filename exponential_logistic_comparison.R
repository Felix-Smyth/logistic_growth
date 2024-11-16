# Making a graph to compare the exponential and logistic growth curves of the
# bacterial culture growth

# package library
library(dplyr)
library(ggplot2)


# importing the data
growth_data <- read.csv("experiment.csv")

# creation of logistic model function
# this is the same as the one use in the previous analysis of 
# plot_data_and_model.R

logistic_fun <- function(t) {
  
  N <- (N0*K*exp(r*t))/(K-N0+N0*exp(r*t))
  
  return(N)
  
}

# creation of an exponential model function
exponential_fun <- function(t) {
  
  N <- N0*(1 + r)^(t)
  
  return(N)
}

exponential_fun(t = 4980)
# Checking against the calculate value in question 2 - value matches


# creation of dataframe with only the model output data in it
# the raw data from experiment.csv can then be excluded in the final plot 

times <- seq(0,4980, 60)
logisticvalues <- c(logistic_fun(times))
exponentialvalues <- c(exponential_fun(times))

# creation of a data frame with time, the predicted logistic value and the predicted
# exponential values from the model
models_data <- data.frame(times, logisticvalues, exponentialvalues)

# plotting of values on the same graph
model_comparisons.png <- ggplot(data = models_data) + 
  geom_point(data = models_data, aes(x = times, y = logisticvalues, colour = "Logistic"), size = 0.5) + 
  geom_point(data = models_data, aes(x = times, y = exponentialvalues, colour = "Exponential"), size = 0.5) +
  geom_function(fun=logistic_fun, colour="#deebf7") +
  geom_function(fun=exponential_fun, colour="rosybrown1") +
  xlab("Time (minutes)") +
  ylab(bquote(paste(log[10], "(Population Size)"))) +
  labs(title = "Comparison of Logistic and Exponential Growth Curves", colour='Model Curve') +
  scale_y_continuous(trans='log10') + 
  theme(axis.text.x = element_text(size = 7, angle = 45, vjust = 1, hjust = 1),     
        axis.text.y = element_text(size = 7),
        axis.title = element_text(size = 8, face = "plain"), 
        title = element_text(size = 9),
        legend.text = element_text(size = 8, face = "italic"),     
        legend.title = element_blank(),                        
        legend.position.inside = c(0.9, 0.9))

# saving of the plot
ggsave("model_comparisons.png")