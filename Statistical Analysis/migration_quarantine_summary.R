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
migrationdata <- read.csv("C:\\Users\\perri\\Documents\\R_Data\\migration_summary.csv",
                          stringsAsFactors = TRUE, header=TRUE)

#save timepoint and run as factors
migrationdata$run <- as.factor(migrationdata$run)
migrationdata$timepoint <- as.factor(migrationdata$timepoint)

"create model with structure (values of interest, data table, random effects, 
autocorrelation)" 
migrationmodel <- lm(peak_prop ~ teleporters + 
                          infection_migration + teleporters*infection_migration, 
                        data = migrationdata, family = binomial)


"-exp because fits data better (proportion dosn't go below zero and residuals a 
TINY bit better, 0.309321 vs. 0.309403). -log worse fit with residuals of 
0.3411896.
"

" 
corAR1 and corCAR1 give same output
Works because running the model without the run random effect and without 
accounting for autocorellation makes p-value MUCH more signif
#run anova to text for correlation"                
anova(migrationmodel)

summary(migrationmodel)


#try to check assumptions? 
#standard residuals
resid_panel(migrationmodel)

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
plot_migration

ggsave("plot_migration_summary.png",dpi=300)





