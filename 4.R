load("air.RData")

air <- air |>
  filter(county == "OR - Multnomah") |>
  arrange(desc(emissions))

save(air, file = "4.RData")
