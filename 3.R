load("air.RData")

air <- air |>
  filter(county == "OR - Multnomah")

save(air, file = "3.RData")
