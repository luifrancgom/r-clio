# Load packages ----
library(tidyverse)

# Import ----
saber_pro_genericas_faedis_2021_2024 <- read_rds(
  file = "data/2021-2024_saber-pro-genericas_faedis.rds"
)

divipola_departamentos <- read_rds(
  file = "data/divipola-departamentos.rds"
)

divipola_municipios <- read_rds(
  file = "data/divipola-municipios.rds"
)

programa_pregrado_faedis <- read_rds(
  file = "data/programas-pregrado-faedis.rds"
)

# Inspect ----
saber_pro_genericas_faedis_2021_2024 |>
  glimpse()

divipola_departamentos |>
  glimpse()

divipola_municipios |>
  glimpse()

programa_pregrado_faedis |>
  glimpse()

# Entities ----
## Resultado saber-pro ----
resultado_saber_pro <- saber_pro_genericas_faedis_2021_2024 |>
  select(
    ano:estu_cod_depto_presentacion,
    estu_cod_mcpio_presentacion,
    estu_snies_prgmacademico,
    mod_competen_ciudada_punt:punt_global
  )

resultado_saber_pro |>
  glimpse()

## Departamento ----
departamento <- divipola_departamentos

departamento |>
  glimpse()

## Municipio ----
municipio <- divipola_municipios

municipio |>
  glimpse()

## Programa pregrado faedis ----
programa_academico <- programa_pregrado_faedis

programa_academico |>
  glimpse()


municipio |>
  select(
    codigo_departamento:nombre_municipio
  )
