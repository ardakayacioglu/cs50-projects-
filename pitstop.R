filename <- readline("CSV file: ")
data <- read.csv(filename)

total_pit_stops <- nrow(data)
shortest_pit_stop <- min(data$time)
longest_pit_stop <- max(data$time)
total_time <- sum(data$time)

cat("Total pit stops:", total_pit_stops, "\n")
cat("Shortest pit stop:", shortest_pit_stop, "\n")
cat("Longest pit stop:", longest_pit_stop, "\n")
cat("Total time:", round(total_time, 2), "\n")
