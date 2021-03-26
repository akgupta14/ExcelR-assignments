#A hospital wants to determine whether there is any difference in the average turn around time (TAT) 
#of reports of the laboratories on their preferred list. they collected a random sample and recorded 
#TAT for reports of 4 laboratories . TAT is defined as sample collected to report dispatch.

#analyze the data and determine whether there is any difference in average TAT among the different
#laboratories at 5% significance level.

#research question:- is there any difference in average TAT among different laboratory

#since here we are  here comparing four different data sets.

install.packages("nortest")
library(nortest)
library(car)

LABs_data<-read.csv(file.choose())
dim(LABs_data)

#we are combining all the columns in one column so that 
#we do not need to test normality for each column one by one

stacked_data<-stack(LABs_data)
dim(stacked_data)
attach(stacked_data)
 #now we will check normality of of each data set by ad.test

ad.test(values)

#since p-value is 0.0507 which is good enough to reject null hypothesis 
#therefore we can conclude that data is normally distributed


#now we will check whether the dataset have equal variance or not using levene test


leveneTest(values~ind,data=stacked_data)
#p-value=0.05161 indicates that null hypothesis is rejected i.e data sets have equal variances

#research question:-is there any difference in average TAT among different laboratory
#H0:-average TAT of all laboratory are same
#Ha:-average TAT of all laboratory are different

Annova_result<-aov(values~ind,data = stacked_data)
summary(Annova_result)

#here p-value of anova test is very less i.e 2e-16 conclude that avg TAT of all labs are different