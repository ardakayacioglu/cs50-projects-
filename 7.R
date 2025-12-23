load("air.RData")

air <- air |>
  group_by(source = level_1, pollutant) |>
  summarize(emissions = sum(emissions)) |>
  arrange(source, pollutant)

save(air, file = "7.RData")
