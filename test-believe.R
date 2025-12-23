source("believe.R")
stopifnot(is_palindrome("racecar") == TRUE)
stopifnot(is_palindrome("hello") == FALSE)
stopifnot(is_palindrome("A man a plan a canal Panama") == TRUE)
stopifnot(is_palindrome("RaceCar") == TRUE)
stopifnot(is_palindrome("Was it a car or a cat I saw?") == TRUE)
stopifnot(is_palindrome("No lemon, no melon") == TRUE)

cat("All tests passed!\n")
