# Titanic
# to examine the dataset i will use tidyverse,dplr,ggplot:
library(tidyverse)
library(ggplot2)
library(dplyr)

#load titanic data for analysis
titanic <- read.csv("C:/Users/Rohini Kanungo/Downloads/titanic_data.csv", stringsAsFactors = FALSE)
view(titanic)
glimpse(titanic)

#some prelimanary estimation before we force survived as factor:
summarize(titanic,SurvivalRate=sum(Survived)/nrow(titanic)*100)
titanicFact <-titanic

# Set up factors.
titanic$Pclass <- as.factor(titanic$Pclass)
titanic$Survived <- as.factor(titanic$Survived)
titanic$Sex <- as.factor(titanic$Sex)
titanic$Embarked <- as.factor(titanic$Embarked)

# First question - What was the survival rate? 
ggplot(titanic, aes(x = Survived)) + 
geom_bar()
#numbers perishing & surviving
table(titanic$Survived)
#in percentages:
prop.table(table(titanic$Survived))
#question 2: what was the survival rate by gender?
ggplot(titanic, aes(x = Sex, fill = Survived)) + 
  theme_bw() +
  geom_bar() +
  labs(y = "Passenger Count",
       title = "Titanic Survival Rates by Sex")
# Third question - What was the survival rate by class of ticket? 
ggplot(titanic, aes(x = Pclass, fill = Survived)) + 
  theme_bw() +
  geom_bar() +
  labs(y = "Passenger Count",
       title = "Titanic Survival Rates by Pclass")

#Fourth question - What was the survival rate by class of ticket
#                   and gender?
ggplot(titanic, aes(x = Sex, fill = Survived)) + 
  theme_bw() +
  facet_wrap(~ Pclass) +
  geom_bar() +
  labs(y = "Passenger Count",
       title = "Titanic Survival Rates by Pclass and Sex")
# Fifth Question - What is the distribution of passenger ages?
ggplot(titanic, aes(x = Age)) +
  theme_bw() +
  geom_histogram(binwidth = 5) +
  labs(y = "Passenger Count",
       x = "Age (binwidth = 5)",
       title = "Titanic Age Distribtion")
# Sixth Question - What are the survival rates by age?
#
ggplot(titanic, aes(x = Age, fill = Survived)) +
  theme_bw() +
  geom_histogram(binwidth = 5) +
  labs(y = "Passenger Count",
       x = "Age (binwidth = 5)",
       title = "Titanic Survival Rates by Age")


