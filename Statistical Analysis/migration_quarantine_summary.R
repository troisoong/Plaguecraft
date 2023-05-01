#this command clears everything from R's memory. ALWAYS USE!
rm(list=ls())

#Open libraries
#this one is for creating plots (regressions)
library(ggplot2)
library(lme4)
library(lmerTest)
library(dplyr)
library(car)
library(ggResidpanel)

#load data
migrationdata <- read.csv("(file pathway)",
                          stringsAsFactors = TRUE, header=TRUE)

#save timepoint and run as factors
migrationdata$run <- as.factor(migrationdata$run)
migrationdata$timepoint <- as.factor(migrationdata$timepoint)

"create model with structure (values of interest, data table, random effects, 
autocorrelation)" 
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

#plot graph to visualise results
plot_migration <- ggplot(migrationdata, aes(x=teleporters, y=peak_prop,
                                            color=infection_migration)) + 
  geom_point(size=0.7) + 
  labs(x="Teleporters per Village", y="Peak Proportion of Population Infected") +
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





