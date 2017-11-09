# This is a practice R script with Titanic Dataset based on Few questions.
# This practice Set created by Learning from Dojo Web Seminar. 
# So Let's Start.


#Install "ggplot2" package
install.packages("ggplot2")

#Call "ggplot2" package
library(ggplot2)

# Load Titanic titanicing data for analysis. Open in spreadsheet view.
#Put dataset location to get data.
#titanic <- read.csv("C:/Users/nandan/titanic.csv", stringsAsFactors = FALSE)
#Suppose , if dataset is in same working directory then you can use as below.

titanic <- read.csv("titanic.csv", stringsAsFactors = FALSE)

#In this dataset, there are 891 rows and 12 Columns data. so please  confirm it. 

#View the data of loaded data
View(titanic)

# Set up factors because Factors are variables in R , which are often refered to as 
# cateogorical variables..
# As PassangerId and Names are Unique , so no need to do factor on these 2 columns. 
# We are going to do analysis based on Pclass,Survived,Sex,Embarked.

titanic$Pclass <- as.factor(titanic$Pclass)
titanic$Survived <- as.factor(titanic$Survived)
titanic$Sex <- as.factor(titanic$Sex)
titanic$Embarked <- as.factor(titanic$Embarked)

#
# First question - What was the survival rate? 
#
# As Survived is a factor (i.e., categorical) variable, a bar chart 
# is a great visualization to use.
# We will use geom_bar() to get bar chart . 

ggplot(titanic, aes(x = Survived)) + 
  geom_bar()

# Put labels and theme to make Bar chart more meaningful and easy to understand.
# We will use  theme_bw() for white theme.

ggplot(titanic, aes(x = Survived)) + 
  theme_bw() +
  geom_bar() +
  labs(y = "Passenger Count",
       title = "Titanic Survival Rates")


#
# Second question - What was the survival rate by gender? 
#
# We can use color to look at two aspects (i.e., dimensions)
# of the data simultaneously.
# We will use Fill option to fill the space with different color. 

ggplot(titanic, aes(x = Sex, fill = Survived)) + 
  theme_bw() +
  geom_bar() +
  labs(y = "Passenger Count",
       title = "Titanic Survival Rates by Sex")


#
# Third question - What was the survival rate by class of ticket? 
#
ggplot(titanic, aes(x = Pclass, fill = Survived)) + 
  theme_bw() +
  geom_bar() +
  labs(y = "Passenger Count",
       title = "Titanic Survival Rates by Pclass")


#
# Fourth question - What was the survival rate by class of ticket
#                   and gender?
#
# We can leverage facets to further segment the data and enable
# "visual drill-down" into the data.
# For Combining two columns , we will use Facet_wrap funtion. 

ggplot(titanic, aes(x = Sex, fill = Survived)) + 
  theme_bw() +
  facet_wrap(~ Pclass) +
  geom_bar() +
  labs(y = "Passenger Count",
       title = "Titanic Survival Rates by Pclass and Sex")

#
# Fifth Question - What is the distribution of passenger ages?
#
# The histogram is a staple of visualizing numeric data as it very 
# powerfully communicates the distrubtion of a variable (i.e., column).
# we have to use binwidth values when we have to work with ranges of numeric value. 

ggplot(titanic, aes(x = Age)) +
  theme_bw() +
  geom_histogram(binwidth = 5) +
  labs(y = "Passenger Count",
       x = "Age (binwidth = 5)",
       title = "Titanic Age Distribtion")

#Here just we change Age binwidth at X axis to get the more sharp result.
ggplot(titanic, aes(x = Age)) +
  theme_bw() +
  geom_histogram(binwidth = 10) +
  labs(y = "Passenger Count",
       x = "Age (binwidth = 5)",
       title = "Titanic Age Distribtion")

#
# Sixth Question - What are the survival rates by age?
#
ggplot(titanic, aes(x = Age, fill = Survived)) +
  theme_bw() +
  geom_histogram(binwidth = 5) +
  labs(y = "Passenger Count",
       x = "Age (binwidth = 5)",
       title = "Titanic Survival Rates by Age")

# We can also use Box method also known as box-and-whisker plot.
# for this we will use geom_boxplot() method.

ggplot(titanic, aes(x = Survived, y = Age)) +
  theme_bw() +
  geom_boxplot() +
  labs(y = "Age",
       x = "Survived",
       title = "Titanic Survival Rates by Age")


#
# Seventh Question - What is the survival rates by age when segmented
#                    by gender and class of ticket?

ggplot(titanic, aes(x = Age, fill = Survived)) +
  theme_bw() +
  facet_wrap(Sex ~ Pclass) +
  geom_density(alpha = 0.5) +
  labs(y = "Age",
       x = "Survived",
       title = "Titanic Survival Rates by Age, Pclass and Sex")

# If you prefer histograms, no problem!
ggplot(titanic, aes(x = Age, fill = Survived)) +
  theme_bw() +
  facet_wrap(Sex ~ Pclass) +
  geom_histogram(binwidth = 5) +
  labs(y = "Age",
       x = "Survived",
       title = "Titanic Survival Rates by Age, Pclass and Sex")

