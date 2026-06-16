# Load packages ----
library(tidyverse)

# Import data ----
saber_pro_genericas_faedis_2021_2024 <- read_rds(
  file = "data/2021-2024_saber-pro-genericas_faedis.rds"
)

# Line plot data ----
saber_pro_genericas_faedis_2021_2024_programas <- saber_pro_genericas_faedis_2021_2024 |>
  group_by(
    ano,
    estu_snies_prgmacademico,
    estu_prgm_academico
  ) |>
  summarise(
    across(
      .cols = ends_with("punt") | starts_with("punt"),
      .fns = \(x) round(mean(x), digits = 0)
    )
  ) |>
  ungroup()

# Inspect ----
saber_pro_genericas_faedis_2021_2024_programas |>
  glimpse()

# Export ----
saber_pro_genericas_faedis_2021_2024_programas |>
  write_rds(
    file = "data/2021-2024_saber-pro-genericas_faedis_programas.rds"
  )
