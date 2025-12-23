# Prompt for flavor preference
flavor <- readline("What flavor do you prefer? (Light/Bold): ")

# Prompt for caffeine preference
caffeine <- readline("Do you want caffeine? (Yes/No): ")

# Check for valid input
valid_flavor <- flavor %in% c("Light", "Bold")
valid_caffeine <- caffeine %in% c("Yes", "No")

# Make recommendation based on input
if (!valid_flavor) {
  cat("Please enter a valid flavor: Light or Bold.\n")
} else if (!valid_caffeine) {
  cat("Please enter a valid caffeine preference: Yes or No.\n")
} else {
  if (flavor == "Light" && caffeine == "Yes") {
    cat("We recommend: green tea.\n")
  } else if (flavor == "Bold" && caffeine == "Yes") {
    cat("We recommend: black tea.\n")
  } else if (flavor == "Light" && caffeine == "No") {
    cat("We recommend: chamomile tea.\n")
  } else if (flavor == "Bold" && caffeine == "No") {
    cat("We recommend: rooibos tea.\n")
  }
}
