library("ggplot2")
library("tidyverse")
View(Jan2021)

str(Jan2021)
summary(Jan2021)

#visualize member type
ggplot(data=Jan2021)+
  geom_bar(mapping=aes(x=member_casual,fill=member_casual))

# Insight :The membership users are almost 4 times the casual users

#visualize ride type
ggplot(data=Jan2021)+
  geom_bar(mapping=aes(x=rideable_type,fill=rideable_type))

#Insight : Overall docked users are almost insignificant

#visualize ride type for casual users
Casual_members <- Jan2021 %>%
  filter(member_casual=="casual")%>%
  group_by(Day)

ggplot(data=Casual_members)+
  geom_bar(mapping=aes(x=rideable_type,fill=rideable_type))

#Conclusion : there are more casual users who use docked bike compared to users with membership


#visualize day traffic for all members
ggplot(data=Jan2021)+
  geom_bar(mapping=aes(x=Day,fill=Day))

#Insight: Sunday has the least traffic and traffic increases from Thursday to Saturday exponentially

#visualize day for casual members
Casual_members <- Jan2021 %>%
  filter(member_casual=="casual")%>%
  group_by(Day)

ggplot(data=Casual_members)+
  geom_bar(mapping=aes(x=Day,fill=Day))
# Insight : Monday to Thursday has the least traffic for casual members and Saturday having the highest

#conclusion : Saturday is the busiest day of the week

str(Jan2021)

# mean riding time for overall users is around 15 mins 
mean(as.numeric(Jan2021$ride_length),na.rm=TRUE)

Casual_members <- Jan2021 %>%
  filter(member_casual=="casual")%>%
  group_by(Day)

# mean riding time for casual users is around 20 mins
mean(as.numeric(Casual_members$ride_length),na.rm=TRUE)

# conclusion : casual users tend to spent more time riding compared to members