# Load packages ----
library(tidyverse)


# Create ----
programa_pregrado_faedis <-
  tibble(
    codigo_snies_programa = c(
      6527L,
      102005L,
      108241L,
      11004L,
      53703L,
      105142L,
      11428L,
      10963L
    ),
    nombre_programa = c(
      "ADMINISTRACION DE EMPRESAS",
      "ADMINISTRACION DE LA SEGURIDAD Y SALUD OCUPACIONAL",
      "ADMINISTRACION DE RIESGOS, SEGURIDAD Y SALUD EN EL TRABAJO",
      "INGENIERIA CIVIL",
      "INGENIERIA INDUSTRIAL",
      "INGENIERIA INFORMÁTICA",
      "CONTADURIA PUBLICA",
      "RELACIONES INTERNACIONALES Y ESTUDIOS POLITICOS"
    ),
    estado_programa = c(
      "Activo",
      "Inactivo",
      "Activo",
      "Activo",
      "Activo",
      "Activo",
      "Activo",
      "Activo"
    ),
    ultima_actualizacion = ymd("2026-08-25")
  ) |>
  arrange(
    nombre_programa
  )

# Export ----
programa_pregrado_faedis |>
  write_rds(
    file = "data/programas-pregrado-faedis.rds"
  )
