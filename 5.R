load("zelda.RData")

zelda <- zelda |>
  filter(str_detect(producers, ",")) |>
  group_by(title) |>
  filter(year == min(year)) |>
  ungroup() |>
  arrange(year, title, system)

save(zelda, file = "5.RData")
