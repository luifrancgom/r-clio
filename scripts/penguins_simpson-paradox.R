# Load packages ----
library(tidyverse)
library(tidymodels)

# Import data ----
penguins <- as_tibble(penguins)

# Modeling ----
global <- penguins |>
  lm(
    data = _,
    formula = bill_depth_mm ~ bill_length_mm,
  ) |>
  tidy()

beta_1_global <- global$estimate[[2]]
p_value_global <- global$p.value[[2]]

species <- penguins |>
  group_nest(species) |>
  mutate(
    model = map(
      .x = data,
      .f = \(x) {
        lm(
          data = x,
          formula = bill_depth_mm ~ bill_length_mm
        )
      }
    )
  ) |>
  select(
    species,
    model
  ) |>
  mutate(
    model = map(
      .x = model,
      .f = tidy
    )
  ) |>
  unnest(model) |>
  filter(
    term == "bill_length_mm"
  ) |>
  select(
    species,
    estimate,
    p.value
  )

species
