#this command clears everything from R's memory. ALWAYS USE!
rm(list=ls())

#Open libraries
#this one is for creating plots (regressions)
library(ggplot2)
#these allow creation and analysis of glmer models
library(lme4)
library(lmerTest)
library(car)
#this allows table reorganisation
library(dplyr)
#allows plotting of residuals
library(ggResidpanel)
#for customising graph colour
library(RColorBrewer)

#load data
ratedata <- read.csv("(file pathway)",
                          stringsAsFactors = TRUE, header=TRUE)

#save timepoint and run as factors
ratedata$run <- as.factor(ratedata$run)
ratedata$timepoint <- as.factor(ratedata$timepoint)

#create model with glmer, including autocorrelations and binomial family
ratemodel <- glmer(cbind(infected,non_infected) ~ -exp(chance) +
                       (1|run) + (1|timepoint), 
                     data = ratedata, family = binomial)
#-exp found to be much better fit, otherwise crosses x-axis. Also gives higher p-value so less residuals.

#perform anova to test              
Anova(ratemodel)
#check summaries
summary(ratemodel) 
#standard residuals
resid_panel(ratemodel)

#output:
"Analysis of Deviance Table (Type III Wald chisquare tests)

Response: cbind(infected, non_infected)
            Chisq Df Pr(>Chisq)    
(Intercept) 244.8  1  < 2.2e-16 ***"
#significant effect
#residuals suggest slightly overdispursed and QQ plot may not be correcting 

#graphs plotted with ggplot


