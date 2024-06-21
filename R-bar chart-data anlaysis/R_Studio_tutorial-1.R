library (ggplot2)
library(readr)
bar_chart_data <- read_csv("bar_chart_lab.csv")
View(bar_chart_data)

library ("ggplot2")
bar_chart <- ggplot(bar_chart_data, aes(x=Cities, y= Frequency))+
  geom_bar(stat = "identity")+ coord_flip()

bar_chart
