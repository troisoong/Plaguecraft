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

#create model with glmer, including autocorrelations and binomial family
migrationmodel <- glmer(cbind(infected,non_infected) ~ teleporters + 
                       infection_migration + teleporters*infection_migration +
                       (1|run) + (1|timepoint), 
                     data = migrationdata, family = binomial)

#perform anova to test              
Anova(migrationmodel)
#check summaries
summary(migrationmodel) 
#standard residuals
resid_panel(migrationmodel)

#output:
"Analysis of Deviance Table (Type II Wald chisquare tests)

Response: cbind(infected, non_infected)
                                 Chisq Df Pr(>Chisq)  
teleporters                     0.2554  1    0.61328  
infection_migration             0.0228  1    0.87995  
teleporters:infection_migration 4.2684  1    0.03883 *"
#significant interaction detected

#plot graph to visualise results
plot_migration <- ggplot(migrationdata, aes(x=teleporters, y=peak_prop,
                                            color=infection_migration)) + 
  geom_point(size=0.7) + 
  labs(x="Teleporters per Village", y="Proportion of Population Infected") +
  scale_color_manual(labels = c("Infectious Villagers Quarantined",
                                "Infectious Villagers Free to Migrate"),values = c("#D95F02","#7570B3")) +
  geom_smooth(method = "lm", formula= (y ~ x), aes(color = infection_migration), 
              size=1.5,se = TRUE) + 
  scale_y_continuous(expand = c(0,0), limits = c(0,0.3), breaks=seq(0,0.3, by=0.05)) +
  theme(panel.border = element_rect(colour = "black", fill=NA),
        panel.background = element_rect(fill="white"), 
        legend.key = element_blank(),
        axis.text = element_text(colour="black"),
        axis.title.x = element_text(size = 20,vjust = -0.4),
        axis.title.y = element_text(size = 20,vjust = 2),
        axis.text.x = element_text(size = 15),
        axis.text.y = element_text(size = 15),
        legend.title = element_text(size = 17.5),
        legend.text = element_text(size = 15),
        aspect.ratio=2/1) +
  guides(color=guide_legend(" "))

#display graph
plot_migration

#save to computer
ggsave("plot_migration_summary.png",dpi=300)





