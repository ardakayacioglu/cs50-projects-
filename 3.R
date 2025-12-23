library(tidyverse)
load("zelda.RData")

zelda <- zelda |>
  mutate(system = str_remove(system, "^[-\\s]+")) |>   # baştaki - ve boşlukları sil
  group_by(title) |>
  filter(year == min(year)) |>
  arrange(year, title, system) |>
  ungroup()

save(zelda, file = "3.RData")
