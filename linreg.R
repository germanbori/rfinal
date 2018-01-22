


#install and load the packages
library(tidyverse) 
library(dplyr)
install.packages("magrittr")
library(magrittr)
install.packages("broom")
library(broom)
#checking the RESIDUALS
# check the linearity between the variables str1


data %>% 
  ggplot() +
  aes(y = hu_str1_diff_2nd, x = Cs_avg) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) 

data %>% 
  ggplot() +
  aes(y = hu_str1_diff_2nd, x = Pr) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) 

# data %>% 
#   ggplot() +
#   aes(y = hu_str1_diff_2nd, x = fluency) +
#   geom_point() +
#   geom_smooth(method = "lm", se = FALSE) 
# 
# data %>% 
#   ggplot() +
#   aes(y = hu_str1_diff_2nd, x = avg_groupsize) +
#   geom_point() +
#   geom_smooth(method = "lm", se = FALSE) 
# 
# data %>% 
#   ggplot() +
#   aes(y = hu_str1_diff_2nd, x =avg_clustswitch) +
#   geom_point() +
#   geom_smooth(method = "lm", se = FALSE) 
# 
# data %>% 
#   ggplot() +
#   aes(y = hu_str1_diff_2nd, x = avg_sharpswitch) +
#   geom_point() +
#   geom_smooth(method = "lm", se = FALSE) 
# 
# data %>% 
#   ggplot() +
#   aes(y = hu_str1_diff_2nd, x = avg_groupnumb) +
#   geom_point() +
#   geom_smooth(method = "lm", se = FALSE) 
# 
# # check the linearity between the variables for str2
# 
# data %>% 
#   ggplot() +
#   aes(y = hu_str2_diff_2nd, x = Cs_avg) +
#   geom_point() +
#   geom_smooth(method = "lm", se = FALSE) 
# 
# data %>% 
#   ggplot() +
#   aes(y = hu_str2_diff_2nd, x = Pr) +
#   geom_point() +
#   geom_smooth(method = "lm", se = FALSE) 
# 
# data %>% 
#   ggplot() +
#   aes(y = hu_str2_diff_2nd, x = fluency) +
#   geom_point() +
#   geom_smooth(method = "lm", se = FALSE) 
# 
# data %>% 
#   ggplot() +
#   aes(y = hu_str2_diff_2nd, x = avg_groupsize) +
#   geom_point() +
#   geom_smooth(method = "lm", se = FALSE) 
# 
# data %>% 
#   ggplot() +
#   aes(y = hu_str2_diff_2nd, x =avg_clustswitch) +
#   geom_point() +
#   geom_smooth(method = "lm", se = FALSE) 
# 
# data %>% 
#   ggplot() +
#   aes(y = hu_str2_diff_2nd, x = avg_sharpswitch) +
#   geom_point() +
#   geom_smooth(method = "lm", se = FALSE) 
# 
# data %>% 
#   ggplot() +
#   aes(y = hu_str2_diff_2nd, x = avg_groupnumb) +
#   geom_point() +
#   geom_smooth(method = "lm", se = FALSE)



# ASSUMPTIONS
 # multicollinearity 
install.packages("car")
library(car)
# vif_data_lm1 <- vif(lm1) i don't have enough terms for this
# 1/car::vif(lm1) or for this
 
# independence of residuals
 #car::dwt(lm1)

 
# check heteroscedasticity 
# residual diag - not a normal distribution

# data %>% 
#    augment(lm(marital_dummi ~ degree, data = .), .) %>% 
#    ggplot() +
#    aes(.resid) +
#    geom_histogram(bins = 10)
# ggsave("15", width = 10, height = 7)
# #  normality test on the residuals - significant differenc from normal distribution
# used %>% 
#    augment(lm(marital_dummi ~ degree, data = .), .) %>% 
#    pull(.resid) %>% 
#    shapiro.test(.)
 
 #exploring residuals
install.packages("ggfortify")
library(ggfortify)
autoplot(lm7, which = 1:6, label.size = 3)

autoplot(lm14, which = 1:6, label.size = 3)

#store new variables from the diagnostics
lm1_diag <- augment(lm1, used)
 

# All Subsets Regression
# install.packages('leaps')
# library(leaps)
# attach(data)
# leaps<-regsubsets(hu_str1_diff_2nd ~ Cs_avg+Pr+fluency+avg_groupsize+avg_clustswitch+avg_sharpswitch+avg_groupnumb,data=data,nbest=1)
# # view results 
# summary(leaps)
# # plot a table of models showing variables in each model.
# # models are ordered by the selection statistic.
# plot(leaps,scale="r2")
# # plot statistic by subset size 
# library(car)
# subsets(leaps, statistic="rsq")

#LINEAR REGRESSION
#using the broom package for the clean results, adding residuals for the data, and model performance metrics
library(broom)


mydata<- data
# lm1 <- lm( hu_str1_diff_2nd ~ Cs_avg, data = mydata)
# summary(lm1) 
# tidy(lm1) 
# augment(lm1, mydata) 
# glance(lm1) 
# 
# lm2 <- lm( hu_str1_diff_2nd ~ Cs_avg + avg_clustswitch, data = mydata) 
# summary(lm2) 
# tidy(lm2) 
# augment(lm2, mydata) %>%  
# glance(lm2) 
# 
# lm3 <- lm( hu_str1_diff_2nd ~ Cs_avg + avg_clustswitch + avg_groupsize , data = mydata)
# summary(lm3) 
# tidy(lm3) 
# augment(lm3, mydata) 
# glance(lm3) 
# 
# lm4 <- lm( hu_str1_diff_2nd ~ Cs_avg+ avg_clustswitch + avg_groupsize + avg_groupnumb, data = mydata)
# summary(lm4) 
# tidy(lm4) 
# augment(lm4, mydata) 
# glance(lm4) 
# 
# lm5 <- lm( hu_str1_diff_2nd ~ Cs_avg+ avg_clustswitch + avg_groupsize + avg_groupnumb+ Pr, data = mydata)
# summary(lm5) 
# tidy(lm5) 
# augment(lm5, mydata) 
# glance(lm5) 
# 
# lm6 <- lm( hu_str1_diff_2nd ~ Cs_avg+ avg_clustswitch + avg_groupsize + avg_groupnumb+ Pr+avg_sharpswitch, data = mydata)
# summary(lm6) 
# tidy(lm6) 
# augment(lm6, mydata) 
# glance(lm6) 

lm7 <- lm( hu_str1_diff_2nd ~ Cs_avg+ avg_clustswitch + avg_groupsize + avg_groupnumb+ Pr+avg_sharpswitch+fluency, data = mydata)
summary(lm7) 
tidy(lm7) 
augment(lm7, mydata) 
glance(lm7) 

 
install.packages("stargazer")
library(stargazer)
results <- stargazer(lm7,  title = "Results", align = TRUE, type = "text", out = ".txt")


# # All Subsets Regression STR 2
# install.packages('leaps')
# library(leaps)
# attach(mydata)
# leaps<-regsubsets(hu_str2_diff_2nd ~ Cs_avg+Pr+fluency+avg_groupsize+avg_clustswitch+avg_sharpswitch+avg_groupnumb,data=mydata,nbest=1)
# # view results 
# summary(leaps)
# # plot a table of models showing variables in each model.
# # models are ordered by the selection statistic.
# plot(leaps,scale="r2")
# # plot statistic by subset size 
# library(car)
# subsets(leaps, statistic="rsq")

#LINEAR REGRESSION STR 2
#using the broom package for the clean results, adding residuals for the data, and model performance metrics
library(broom)
# lm8 <- lm( hu_str2_diff_2nd ~ avg_groupnumb, data = mydata)
# lm9 <- lm( hu_str2_diff_2nd ~ avg_groupnumb+avg_groupsize, data = mydata) 
# lm10 <- lm( hu_str2_diff_2nd ~  avg_groupnumb+avg_groupsize+avg_sharpswitch, data = mydata)
# lm11 <- lm( hu_str2_diff_2nd ~ avg_groupnumb+avg_groupsize+avg_sharpswitch+fluency, data = mydata)
# lm12 <- lm( hu_str2_diff_2nd ~ avg_groupnumb+avg_groupsize+avg_sharpswitch+fluency+Pr, data = mydata)
# lm13 <- lm( hu_str2_diff_2nd ~ avg_groupnumb+avg_sharpswitch+fluency+Pr+Cs_avg+avg_clustswitch, data = mydata)

lm14 <- lm( hu_str2_diff_2nd ~ Cs_avg+ avg_clustswitch + avg_groupsize + avg_groupnumb+ Pr+avg_sharpswitch+fluency, data = mydata)
summary(lm14) 
tidy(lm14) 
augment(lm14, mydata) 
glance(lm14) 


results2 <- stargazer(lm14,  title = "Results", align = TRUE, type = "text", out = ".txt")
