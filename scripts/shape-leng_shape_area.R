# Load packages ----
library(tidyverse)
library(sf)

# Import data ----
col_dpto_sf <- read_sf(
  dsn = "data/nivel-departamento_version-mgn-2025_geopackage.gpkg"
)

# Filter Antioquia ----
antioquia <- col_dpto_sf |>
  filter(dpto_cnmbr == "ANTIOQUIA")

# Proyect oficial system Colombia in meters (EPSG 9377) ----
antioquia_proj <- st_transform(antioquia, crs = 9377)

# Calculate area km² (m² / 1000000)
area_km2 <- as.numeric(st_area(antioquia_proj)) / 1e6

# Calculate perimeter km (m / 1000)
perimeter_km <- as.numeric(st_length(st_cast(
  antioquia_proj,
  "MULTILINESTRING"
))) /
  1000

# Result
area_km2
area_km2

# Compare
col_dpto_sf |>
  filter(dpto_cnmbr == "ANTIOQUIA") |>
  select(
    dpto_narea,
    shape_Leng,
    shape_Area
  ) |>
  st_drop_geometry()
