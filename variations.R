# Return a random letter
random_character <- function() {
  return(sample(letters, 1))
}

# Print a sequence of letters, one at a time
print_sequence <- function(n) {
  for (i in 1:n) {
    Sys.sleep(0.25)
    cat(random_character())
  }
  cat("\n")
}

# Print a 20-character sequence
print_sequence(20)
