load("air.RData")

air <- air |>
  group_by(county) |>
  slice_max(emissions, n = 1) |>
  ungroup() |>
  arrange(desc(emissions))

save(air, file = "5.RData")
