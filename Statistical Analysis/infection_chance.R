#this command clears everything from R's memory. ALWAYS USE!
rm(list=ls())

#Open libraries
#this one is for creating plots (regressions)
library(ggplot2)
#install package that accounts for autocorrelation
library(nlme)
#this package lets you logit transform for nlme, which doesn't allow family
#link: https://stats.stackexchange.com/questions/398869/r-how-to-fit-a-glmm-in-nlme
library(car)

#load data
ratedata <- read.csv("C:\\Users\\perri\\Documents\\R_Data\\SIR_infection_chance.csv",
                      stringsAsFactors = TRUE, header=TRUE)

#logit transform output to account for binomial
logit.prop <- logit(ratedata$proportion)

"create model with structure (values of interest, data table, random effects, 
autocorrelation)" 
ratemodel <- lme(logit.prop ~ exp(-time_to_infect), data = ratedata, 
                 random =~ 1|run, correlation = corAR1(form =~ timepoint|run))


"-exp because fits data better (proportion dosn't go below zero and residuals a 
TINY bit better, 0.309321 vs. 0.309403). -log worse fit with residuals of 
0.3411896.
"

" 
corAR1 and corCAR1 give same output
Works because running the model without the run random effect and without 
accounting for autocorellation makes p-value MUCH more significant"

#run anova to text for correlation                 
anova(ratemodel)

#no accounting for proportions gives p-value = 0.0415
#fitting model as -exp gives p-value = 0.0383
#binomial model and -exp gives p-value = 0.0452
#when method of model changed to ML p-value = 0.0375, but ML might be biased?

#plot graph to visualise results
plot_rate <- ggplot(ratedata, aes(x=time_to_infect, y=proportion,)) + 
  geom_point() + geom_smooth(method = "lm", formula= (y ~ exp(-x)), se = FALSE) +
  theme_bw()
plot_rate

#try to check assumptions? 
#standard residuals
plot(ratemodel)
#not consistent, larger residuals at larger fitted values

#qq plot
qqnorm(residuals(ratemodel), 
       ylab="Sample Quantiles for residuals")
qqline(residuals(ratemodel),  
       col="red")
#not consistent, below line at negative values and above line at positive values

#leverage vs. residuals


#tried running with number of infected, exact same problems. What to do?


