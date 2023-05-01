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
migrationmodel <- glm(peak_prop ~ teleporters + 
                          infection_migration + teleporters*infection_migration, 
                        data = migrationdata, family = binomial)

#perform anova to test               
Anova(migrationmodel, type=3)
#check summaries
summary(migrationmodel) 
#standard residuals
resid_panel(migrationmodel)

#output
"Analysis of Deviance Table (Type III tests)

Response: peak_prop
                                LR Chisq Df Pr(>Chisq)
teleporters                     0.001862  1     0.9656
infection_migration             0.037001  1     0.8475
teleporters:infection_migration 0.143422  1     0.7049"
#no significant results
#residuals suggets quite a lot of overdistribuition and QQ misaligned, but there isn't anything near a significant result anyway

#graphs plotted with ggplot
