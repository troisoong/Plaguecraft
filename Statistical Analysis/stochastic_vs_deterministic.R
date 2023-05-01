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

#plot to illustrate results
plot_stodet<- ggplot(stodetdata, aes(x=model, y=max_R, fill=model)) + 
  geom_boxplot() + 
  scale_fill_manual(name="Model type",labels=c("Deterministic", "Stochastic"),
  values = c("#D95F02","#7570B3")) + 
  labs(x=" ", y="Maximum R number") + 
  scale_x_discrete(labels=c("Deterministic","Stochastic")) +
  scale_y_continuous(expand = c(0,0), limits = c(0,14), breaks=seq(0,14, by=2)) +
  theme(panel.border = element_rect(colour = "black", fill=NA),
        panel.background = element_rect(fill="white"), 
        legend.key = element_blank(),
        axis.text = element_text(colour="black"),
        axis.title.x = element_text(size = 28),
        axis.title.y = element_text(size = 28,vjust = 2),
        axis.text.x = element_text(size = 21),
        axis.text.y = element_text(size = 23),
        legend.title = element_text(size = 17.5),
        legend.text = element_text(size = 15),
        plot.margin = margin(t=20,l=20))
plot_stodet

#save plot to computer
ggsave("plot_stodet.png",dpi=300)
