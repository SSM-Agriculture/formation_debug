library(readr)
library(dplyr)

#### EXERCICE 1 ####

### Import des fichiers
# - COG 2025
COG_2025_04_01 <- read_delim("~/CERISE/02-Espace-de-Production/000_Referentiels/0040_Geo/COG/2025/COG_2025_04_01.csv", 
                             delim = ";", escape_double = FALSE, trim_ws = TRUE)

# - Nomenclature des régions
regions <- readRDS("donnees/regions.rds")

# Définition des régions de l'utilisateur
regions_utilisateur <- c("93","94")

RESULTAT <- COG_2025_04_01 |> 
  filter(REG %in% regions_utilisateur) |> 
  left_join(regions, by = c("REG" = "code_region")) |> 
  summarise(
    NB_COMMUNES = n(),
    .by = c(REG,LIB_REG,DEP)) |>
  arrange(REG,LIB_REG,desc(NB_COMMUNES))

# Choix du zoom
zoom <- "94"

# Compilation des fonctions
source("fonctions.R")

# Lancement des calculs
calculs(zoom)