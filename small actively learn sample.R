#Actively Learn Small Anon Sample
library(dplyr)
library(psych)
library(tidyverse)

#94 teachers
make factors 
smallanon.clean <- small_df_anon %>%
  + mutate(school_name.fac = as_factor(school_name), subject.fac = as_factor(subject), teacher_name.fac = as_factor(teacher_name))
table(smallanon.clean$school_name.fac)