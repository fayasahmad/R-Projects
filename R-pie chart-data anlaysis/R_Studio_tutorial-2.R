library (ggplot2)
library(readr)
pie_chart_data <- read_csv("pie_chart_data.csv")
View(pie_chart_data)
pie_chart <- ggplot(pie_chart_data, aes(x="", y=`Number of Cars`, fill=`Engine Fuel Type`))+
                  geom_bar(stat="identity",width = 1)+ coord_polar("y")
pie_chart                                             
percentages <- paste0(round(pie_chart_data$`Number of Cars` /
                            sum(pie_chart_data$`Number of Cars`)*100,1),"%")
pie_chart <- pie_chart+ geom_text(aes(label = percentages),
                                  position = position_stack(vjust=0.5))

pie_chart <-pie_chart + labs(x=NULL, y=NULL, fill=NULL, title="Cars by Engine Fuel type")

pie_chart

pie_chart <- pie_chart + theme_classic() + these(axis.line = element_blank(),
                                                 axis.line = element_blank()
                                                 plot.title = element_text(hjust=0.5))

#data <- paste0(pie_chart_data$`Engine Fuel Type`)

#pie_chart <- pie_chart+ geom_text(aes(label = data),
 #                                 position = position_stack(vjust=0.54))

pie_chart
