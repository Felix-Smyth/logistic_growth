# Question 1 #
Annotate the README.md file in your logistic_growth repo with more detailed information about the analysis. Add a section on the results and include the estimates for N0, r and K (mention which *.csv file you used)

## Data ## 
Raw data can be found in the experiment.csv file

Data was downloaded off (https://osf.io) 

The dataframe contains two columns, the time (in minutes) since the culture was mixed with the growth medium and the population size of the bacteria culture at that point in time. 

### Overview ### 
The data represents a simulation of logistic growth in a culture of _Escherichia coli_. The culture is expected to show logistic growth as there is a fixed concentration of resources in the growth medium. As a result the population experiences initial exponential growth when the concentration of resources in the environment does not limit the rate of growth of the population. However, as the concentration of resources declines with increasing consumption and a greater population size, the size of the population begins to plateau and reaches a carrying capacity in the environment. This code aims to evaluate a model for logsitic growth based on parameters estimated from linear models on the data before seeing how well this traces over the raw data itself.  

### Plotting raw data in plot_data.R ###
The first script of the analysis visualises the raw data pattern of growth from the experiment csv file through the plotting of two graphs

The first graph plots the culture population against time, displaying a clear sigmoidal curve shape. 
The second graph plots the same data but with the addition of a log base e transformation on the population size y axis


### Fitting linear models in fit_linear_model.R ###


### Plotting logistic growth over data in plot_data_and_model.R ###
