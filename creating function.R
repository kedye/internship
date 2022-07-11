#anatomy of a function

add_func <- function(x, y) {
  x + y
}

#add_func = name of function 
# x and y (in parenth) are function arguments
# x + y in curly braces are function body

#call the function
add_func(1, 2)
add_func(x = 2, y = 1)
add_func(y = 1, x = 2)
#all equivalent 

#adding a default value

add_func2 <- function(x = 2, y = 2) {
  x + y
}

add_func2()

#more complex example 
library(tidyverse)

filter_mpg <- function(val) {
  mtcars %>%
    filter(mpg >= val)
}

filter_mpg(val = 20)

# creating an object in a function

summ_mtcars <- function(val) {
  tmp <- mtcars %>%
    filter(mpg >= val)
  mean(tmp$hp, na.rm = TRUE)
}

summ_mtcars(20)
