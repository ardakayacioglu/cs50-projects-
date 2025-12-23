# Kullanıcıdan ülke adı al
country <- readline("Country: ")

# Yıllar
years <- 2020:2024

# Her yıl için döngü
for (year in years) {
  file <- paste0(year, ".csv")
  data <- read.csv(file)

  # Ülke dosyada var mı kontrol et
  if (country %in% data$country) {
    row <- data[data$country == country, ]
    score <- sum(row$gdp, row$support, row$life_expectancy, row$freedom, row$generosity, row$corruption, row$residual)
    cat(sprintf("%.2f in %d\n", round(score, 2), year))
  } else {
    cat(sprintf("Data unavailable for %d\n", year))
  }
}
