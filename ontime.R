# Load data
bus <- read.csv("bus.csv")
rail <- read.csv("rail.csv")

# Combine datasets
data <- rbind(bus, rail)

# Prompt user for a route
route_input <- readline("Route: ")

# Check if route is valid
if (!(route_input %in% data$route)) {
  cat("Please enter a valid route.\n")
} else {
  # Filter for the selected route
  route_data <- subset(data, route == route_input)

  # Peak and off-peak filtering
  peak_data <- subset(route_data, peak == "PEAK")
  offpeak_data <- subset(route_data, peak == "OFF_PEAK")

  # Calculate mean reliability percentages
  peak_reliability <- round(mean(peak_data$numerator / peak_data$denominator, na.rm = TRUE) * 100)
  offpeak_reliability <- round(mean(offpeak_data$numerator / offpeak_data$denominator, na.rm = TRUE) * 100)

  # Output
  cat(sprintf("On time %d%% of the time during peak hours.\n", peak_reliability))
  cat(sprintf("On time %d%% of the time during off-peak hours.\n", offpeak_reliability))
}
