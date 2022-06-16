#Actively Learn Small Anon Sample
library(dplyr)
library(psych)
library(tidyverse)

#94 teachers
#make factors 
smallanon.clean <- small_df_anon %>%
  + mutate(school_name.fac = as_factor(school_name), subject.fac = as_factor(subject), teacher_name.fac = as_factor(teacher_name))

#School Count
table(smallanon.clean$school_name.fac)
Jones Middle School 48,  Burton Middle School 28, Incandenza High School 18
#Subject Count
table(smallanon.clean$subject.fac)
ELA Special Education    Social Studies 
58                 6                12 
Science             Other   World Languages 
14                 3                 1 
#group by and descriptives
group_by(smallanon.clean, school_name.fac) %>%
  + summarise(count = n(), mean = mean(number_active_students, na.rm = TRUE), sd = sd(number_active_students, na.rm = TRUE))
school_name.fac        count  mean    sd
<fct>                  <int> <dbl> <dbl>
1 Jones Middle School       48  55.9  63.2
2 Burton Middle School      28  25.7  48.0
3 Incandenza High School    18  36.3  41.3

group_by(smallanon.clean, school_name.fac) %>%
  + summarise(count = n(), mean = mean(total_active_learning_time, na.rm = TRUE), sd = sd(total_active_learning_time, na.rm = TRUE))
# A tibble: 3 × 4
school_name.fac        count  mean    sd
<fct>                  <int> <dbl> <dbl>
1 Jones Middle School       48  69.2 119. 
2 Burton Middle School      28  17.1  47.5
3 Incandenza High School    18  25.8  35.6

#group by with multiple variables
grouped %>%
  + group_by(school_name.fac) %>%
  + summarise(across(number_active_students:vocabulary, mean))

grouped %>%
  group_by(subject.fac) %>%
  summarise(across(number_active_students:vocabulary, mean)) %>%
  view()


smallanoncombined <- smallanoncombined %>%
  mutate(total_activetime = total_active_learning_time + total_active_learning_time_for_co_taught_classes)

#plot
ggplot(smallanoncombined, aes(x = total_activetime, y = school_name.fac, color = school_name.fac)) + 
  geom_jitter(width = 0, alpha = 0.8) + 
  theme(legend.position = "none")

smallanoncombined <- smallanoncombined %>%
  mutate(total_activetime = total_active_learning_time + total_active_learning_time_for_co_taught_classes, total_activestudents = number_active_students + number_active_students_for_co_taught_classes, totalassignments = number_of_assignments + number_of_assignments_for_co_taught_classes)
