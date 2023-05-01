#this command clears everything from R's memory. ALWAYS USE!
rm(list=ls())

#makes plots
library(ggplot2)
#reorganise tables
library(dplyr)
#shows residual plots
library(ggResidpanel)
#for customising graph colour
library(RColorBrewer)

#load data
stodetdata <- read.csv("C:\\Users\\perri\\Documents\\R_Data\\stodet.csv",
                          stringsAsFactors = TRUE, header=TRUE)

#make model using glm model
stodetmodel <- lm(max_R ~ model, data=stodetdata)

#test for significance
anova(stodetmodel)
#analyise summaries
summary(stodetmodel)
#check residuals
resid_panel(stodetmodel)

#outputs:
"Analysis of Variance Table

Response: max_R
           Df Sum Sq Mean Sq F value    Pr(>F)    
model       1 453.00  453.00  227.22 < 2.2e-16 ***
Residuals 198 394.75    1.99 "
#suggests significant difference between groups
#residuals all look fine

#graphs plotted with ggplot
