
library(tidyverse)

# Veriyi oku
hurricanes <- read_csv("hurricanes.csv")

# Eksik verileri çıkar (gerekirse)
hurricanes <- hurricanes |> drop_na()

# Yıla göre ortalama maksimum rüzgar hızı
summary_df <- hurricanes |> group_by(Year) |> summarize(average_wind = mean(MaxWindSpeed))

# Görselleştir
plot <- ggplot(summary_df, aes(x = Year, y = average_wind)) +
  geom_line(color = "steelblue", size = 1.2) +
  labs(
    title = "Average Maximum Wind Speed of Hurricanes per Year",
    x = "Year",
    y = "Average Wind Speed (knots)"
  ) +
  theme_minimal()

# PNG olarak kaydet
ggsave("visualization.png", plot, width = 8, height = 6)

