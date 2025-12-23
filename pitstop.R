# Prompt user for filename
filename <- readline("Enter CSV file: ")

# Read the data
data <- read.csv(filename)

# Total number of pit stops
total_stops <- nrow(data)

# Shortest pit stop
shortest <- min(data$time)

# Longest pit stop
longest <- max(data$time)

# Total time spent
total_time <- sum(data$time)

# Print results
cat("Total pit stops:", total_stops, "\n")
cat("Shortest pit stop:", round(shortest, 2), "seconds\n")
cat("Longest pit stop:", round(longest, 2), "seconds\n")
cat("Total time spent on pit stops:", round(total_time, 2), "seconds\n")
