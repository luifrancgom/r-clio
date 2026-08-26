# Load packages ----
library(tidyverse)
library(readxl)
library(janitor)

# Import ----
divipola_departamentos <- read_excel(
  path = "data/divipola-departamentos.xlsx",
  sheet = "Departamentos",
  range = "A10:D43"
)

divipola_municipios <- read_excel(
  path = "data/divipola-municipios.xlsx",
  sheet = "Municipios",
  range = "A12:G1133",
  col_names = c(
    "codigo_departamento",
    "nombre_departamento",
    "codigo_municipio",
    "nombre_municipio",
    "tipo",
    "longitud",
    "latitud"
  )
)

# Clean ----
divipola_departamentos <- divipola_departamentos |>
  clean_names()

# Transform ----
divipola_municipios <- divipola_municipios |>
  mutate(
    notas = case_when(
      codigo_municipio %in%
        c(
          "27150",
          "27493",
          "27615"
        ) ~ "A partir del decreto 0284 del 26 de diciembre de 2023 y de la Ordenanza No. 180 del 27 de junio de 2023, por la cual se crea el municipio de Nuevo Belén de Bajirá, segregado del municipio de Riosucio, el Departamento Administrativo Nacional de Estadística (DANE) ha incorporado el nuevo municipio y sus centros poblados a la Divipola; una vez el Instituto Geográfico Agustín Codazzi (IGAC) culmine el proceso de deslinde respectivo y elabore la cartografía oficial con esta nueva entidad territorial, el DANE procederá con la actualización del Marco Geoestadístico Nacional (MGN) y realizará las actualizaciones cartográficas a que haya lugar; se debe tener presente que la creación del nuevo municipio afecta los límites municipales de los municipios Nuevo Belén de Bajirá, Riosucio y Carmen del Darién (Choco).",
      codigo_municipio %in%
        c(
          "88001"
        ) ~ "La cabecera municipal de San Andrés corresponde a la delimitación geográfica definida por el DANE para fines estadísticos, alusiva al área geográfica delimitada por el perímetro censal, aunque en su interior no se localiza la sede administrativa, ya que no se cataloga como municipio.",
      .default = NA_character_
    )
  ) |>
  mutate(ultima_actualizacion = ymd("2025-12-30")) |>
  select(-nombre_departamento)

# Inspect ----
divipola_departamentos |>
  glimpse()

divipola_municipios |>
  glimpse()

# Export ----
divipola_departamentos |>
  write_rds(
    file = "data/divipola-departamentos.rds"
  )

divipola_municipios |>
  write_rds(
    file = "data/divipola-municipios.rds"
  )
