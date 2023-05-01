#this command clears everything from R's memory. ALWAYS USE!
rm(list=ls())

#Open libraries
#this one is for creating plots (regressions)
library(ggplot2)
#these allow creation and analysis of glmer models
library(lme4)
library(lmerTest)
library(car)
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

#create model with glmer, including autocorrelations and binomial family
migrationmodel <- glmer(cbind(infected,non_infected) ~ teleporters + 
                       infection_migration + teleporters*infection_migration +
                       (1|run) + (1|timepoint), 
                     data = migrationdata, family = binomial)

#perform anova to test              
Anova(migrationmodel,type=3)
#check summaries
summary(migrationmodel) 
#standard residuals
resid_panel(migrationmodel)

#output:
"Analysis of Deviance Table (Type III Wald chisquare tests)

Response: cbind(infected, non_infected)
                                  Chisq Df Pr(>Chisq)    
(Intercept)                     29.1792  1  6.598e-08 ***
teleporters                      1.3171  1    0.25111    
infection_migration              2.5008  1    0.11379    
teleporters:infection_migration  4.2684  1    0.03883 *"
#significant interaction detected
#overdispursed but standard error not small QQ plot not correcting for binomila family, rest of residual plots fine

#graphs plotted with ggplot
