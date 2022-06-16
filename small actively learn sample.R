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
