rm(list=ls())  #removes variables stored previously
library(Hmisc)

data <- read_csv("C:/R-Covid Analysis/COVID19_line_list_data.csv")
describe(data)

#cleaning death column
data$death_corrected <- as.integer(data$death != 0)

#death rate
sum(data$death_corrected) / nrow(data)

#Death
#finding out whether people who die from corona are older
death = subset(data, death_corrected == 1 )
alive = subset(data, death_corrected == 0 )
mean(death$age, na.rm = TRUE)
mean(alive$age, na.rm = TRUE)
#is this statistically significant?
t.test(alive$age, death$age, alternative = "two.sided", conf.level = 0.99)
# normally if p-value < 0.05, we reject null hypothesis
# here , p-value ~ 0, so we reject the null hypothesis and
# conclude that this is statistically significant


#Death
#does gender makes any difference
man = subset(data, gender == 'male' )
woman = subset(data, gender == 'female' )
mean(man$death_corrected)
mean(woman$death_corrected)
#is this statistically significant?
t.test(man$death_corrected, woman$death_corrected, alternative = "two.sided", conf.level = 0.99)
# 99% confidence- 0.8% to 8.8% higher chance of death
# p= 0.002 > 0.05 , so this is statistically significant




