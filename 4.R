library(tidyverse)
load("zelda.RData")

zelda <- zelda |>
  mutate(system = str_remove(system, "^[-\\s]+")) |>
  group_by(title) |>
  filter(year == min(year)) |>
  ungroup() |>
  filter(str_detect(producers, "Shigeru Miyamoto")) |>
  arrange(year, title, system)

save(zelda, file = "4.RData")
