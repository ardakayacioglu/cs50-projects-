# Load data
data <- read.csv("visitors.csv")

# Implement this function!
calculate_growth_rate <- function(years, visitors) {
  growth <- (visitors[length(visitors)] - visitors[1]) / (years[length(years)] - years[1])
  return(growth)
}

# Implement this function!
predict_visitors <- function(years, visitors, year) {
  growth_rate <- calculate_growth_rate(years, visitors)
  last_year <- years[length(years)]
  last_visitors <- visitors[length(visitors)]
  predicted <- last_visitors + (year - last_year) * growth_rate
  return(predicted)
}

# Don't change the code below!
years <- data$year
visitors <- data$visitors
year <- as.integer(readline("Year: "))
prediction <- predict_visitors(years, visitors, year)
cat(sprintf("%.2f million visitors.\n", prediction))
