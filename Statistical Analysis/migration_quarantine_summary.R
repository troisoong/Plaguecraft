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
migrationdata <- read.csv("(file pathway)",
                          stringsAsFactors = TRUE, header=TRUE)

#save timepoint and run as factors
migrationdata$run <- as.factor(migrationdata$run)
migrationdata$timepoint <- as.factor(migrationdata$timepoint)

#create model using glmer to correct for binomial distribution
migrationmodel <- lm(peak_prop ~ teleporters + 
                          infection_migration + teleporters*infection_migration, 
                        data = migrationdata, family = binomial)

#perform anova to test               
anova(migrationmodel)
#check summaries
summary(migrationmodel) 
#standard residuals
resid_panel(migrationmodel)

#output
"
Analysis of Variance Table

Response: peak_prop
                                Df  Sum Sq   Mean Sq F value Pr(>F)
teleporters                      1 0.01140 0.0113964  0.9048 0.3503
infection_migration              1 0.00526 0.0052649  0.4180 0.5236
teleporters:infection_migration  1 0.01537 0.0153709  1.2203 0.2794
Residuals                       26 0.32748 0.0125956    
"
#no significant results
#residuals suggets quite a lot of overdistribuition and QQ plot not correcting for binomial distribuition, but there isn't a significant result anyway

#graphs plotted with ggplot
