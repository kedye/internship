add_func <- function(x, y) {
  x + y
}

subtract_func <- function(x, y) {
  x - y
}

#adding some control

subtract_func2 <- function(x, y, neg_allowed = FALSE) {
  ret <- x - y
  if(neg_allowed == FALSE & ret < 0) (
    stop("Can't return a negative number")
  ) else ret 
}

subtract_func2(3, 2)
subtract_func2(2, 3)
subtract_func2(2, 3, neg_allowed = TRUE)
