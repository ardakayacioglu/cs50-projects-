library(tidyverse)

# Veriyi oku ve sütunları seç + yeniden adlandır
air <- read_csv("air.csv") |>
  select(
    state = State,
    county = `State-County`,
    pollutant = POLLUTANT,
    emissions = `Emissions (Tons)`,
    level_1 = `SCC LEVEL 1`,
    level_2 = `SCC LEVEL 2`,
    level_3 = `SCC LEVEL 3`,
    level_4 = `SCC LEVEL 4`
  )

# Veriyi kaydet
save(air, file = "air.RData")
