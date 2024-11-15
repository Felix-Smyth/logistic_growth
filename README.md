# Question 1 #
Annotate the README.md file in your logistic_growth repo with more detailed information about the analysis. Add a section on the results and include the estimates for N0, r and K (mention which *.csv file you used)

## Data ## 
Raw data can be found in the experiment.csv file

Data was downloaded off (https://osf.io) 

The dataframe contains two columns, the time (in minutes) since the culture was mixed with the growth medium and the population size of the bacteria culture at that point in time. 

### Overview ### 
The data represents a simulation of logistic growth in a culture of _Escherichia coli_. The culture is expected to show logistic growth as there is a fixed concentration of resources in the growth medium. As a result the population experiences initial exponential growth when the concentration of resources in the environment does not limit the rate of growth of the population. However, as the concentration of resources declines with increasing consumption and a greater population size, the size of the population begins to plateau and reaches a carrying capacity in the environment. This code aims to evaluate a model for logsitic growth based on parameters estimated from linear models on the data before seeing how well this traces over the raw data itself.  

### Plotting raw data in plot_data.R ###
The first script of the analysis visualises the raw data pattern of growth from the experiment csv file through the plotting of two graphs, using the package ggplot 2. 


The first graph plots the culture population against time, displaying a clear sigmoidal curve shape logistic realtionship between the two variables. 
The second graph plots the same data but with the addition of a log base 10 transformation on the population y axis. This step creates a semi-log plot and results in the exponential stage of the logistic growth being represented as a straight line that then plateaus before reaching the population carrying capacity. 


### Fitting linear models in fit_linear_model.R ###
This script aims to measure the required logistic growth model parameters of: starting population size (N0), the exponential growth rate (r) and the carrying capacity of the population (K) from linear models applied to the raw data. Two linear models are applied and evaluated in this script. 

Note: This script requires the dplyr package that enables piping to be used within the code. 

The first linear model is used to measure the exponential growth rate and the starting population size of the growth culture of _E.coli._ This step is modelled on the exponential stage of the culture growth. In order to section this period of the time values off and convert the exponential stage to a linear relationship appropriate for linear analysis, the data was subsetted followed by the addition of a column represeting the log of the population size. Visualised on the second graph of the plot_data.R script, the time of the data were subsetted to only include values below 1500 minutes, identifying the exponential stage of the growth. Following this an additional column to the subsetted data was added that displayed the log base e of the population size at each respective time interval. After running and summarising a linear model on this now linear relationship between time and the natural log of the population size (N), the model intercept indicated the natural log of the starting population (N0) while the gradient indicated the exponential growth rate (r). 

The second model of this script was run on the plateaued stage of the logistic growth curve seen in plot_data.R. This did not make use of a log transformation and ran a linear model between the population size and 1 (based on the assumption that the line was completely horizontal). The data was subsetted where only time values above 2500 were included in order to identify only the section of the growth curve where the population size (N) equalled that of the carrying capacity. After running and summarising this model, the model intercept informed of the carrying capacity of the population (K). 


### Plotting logistic growth over data in plot_data_and_model.R ###


## Results ## 

