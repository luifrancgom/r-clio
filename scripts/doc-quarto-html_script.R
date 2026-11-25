# Cargar paquetes ----
library(tidyverse)
library(knitr)

# Import y seleccionar datos ----
saber_pro_ingles_2021_2024_umng <- read_rds(
  file = "data/2021-2024_saber-pro-genericas_umng.rds"
) |>
  select(
    ano,
    estu_consecutivo,
    mod_ingles_desem,
    mod_ingles_punt
  )

# Agrupar y colapsar ----
saber_pro_ingles_agrupado_2021_2024_umng <- saber_pro_ingles_2021_2024_umng |>
  group_by(ano) |>
  summarise(
    mean_floor = as.integer(mean(mod_ingles_punt)),
    sd_floor = as.integer(sd(mod_ingles_punt))
  )

# Visualizar ----
## Paleta primaria UMNG ----
paleta_primaria_umng <- c(
  "#043074",
  "#fdc600",
  "#0d5e30",
  "#ee2a24",
  "#000000",
  "#ffffff"
)

## Distribución ---
saber_pro_ingles_2021_2024_umng |>
  ggplot(
    mapping = aes(x = mod_ingles_punt)
  ) +
  geom_histogram(
    mapping = aes(fill = mod_ingles_desem),
    color = "black",
    boundary = 0,
    bins = 40
  ) +
  scale_fill_manual(
    values = paleta_primaria_umng[1:4]
  ) +
  facet_wrap(
    facets = vars(ano),
    nrow = 4
  ) +
  labs(
    x = "Puntaje (rango [0, 300])",
    y = "Frecuencia",
    fill = "Nivel de desempeño",
    title = "Distribución puntaje módulo inglés en UMG",
    caption = "Fuente: Data Icfes"
  ) +
  theme(
    legend.position = "bottom"
  )

# Tablas ----
saber_pro_ingles_agrupado_2021_2024_umng |>
  kable(
    format = "pipe",
    col.names = c(
      "**Año ($j$)**",
      "**Media ($\\bar{x}_{j, \\text{piso}}$)**",
      "**Desviación estándar ($s_{j, \\text{piso}}$)**"
    ),
    align = c("c", "c", "c")
  )
