library(tidyverse)

zelda <- read_csv("zelda.csv") |>
  separate(release, into = c("year", "system"), sep = " ", extra = "merge") |>
  mutate(year = as.integer(year)) |>
  pivot_wider(names_from = role, values_from = names) |>
  rename_with(tolower)

save(zelda, file = "zelda.RData")
