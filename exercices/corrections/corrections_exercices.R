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


#### EXERCICE 2 ####

options(boomer.clock = TRUE)

library(boomer)

# - Nomenclature des régions
regions <- readRDS("donnees/regions.rds")

resultat <-  readRDS("/root_cerise/03-Espace-de-Diffusion/100_Comptes_Revenus/10010_RICA/10_Donnees_definitives/RICA_2023/format_rds/rica23.rds") %>%
  # Sélection des colonnes et filtre sur les lignes avant la jointure
  select(IDENT,SIRET,REGIO) %>%
  filter(REGIO == "11") %>%
  # Conversion au format caractères pour la jointure
  mutate(REGIO = as.character(REGIO)) |> 
  left_join(regions,
            by = c("REGIO" = "code_region")) %>% 
  boom()

#### EXERCICE 3 ####

library(logr)
library(dplyr)
library(ggplot2)

options("logr.traceback" = FALSE)
options("logr.autolog" = TRUE)

# Ouverture de la log
log_open("log_exo3.log")

put("Affichage var. d'environnement")

put(Sys.getenv("http_proxy"))


# Création jeu de données -------------------------------------------------
sep("Création jeu de données")

set.seed(123)
n <- 10000000
species <- c("setosa", "versicolor", "virginica")

simu_data <- data.frame(
  Species = sample(species, n, replace = TRUE),
  Sepal.Length = rnorm(n, mean = 6, sd = 0.8),
  Sepal.Width  = rnorm(n, mean = 3, sd = 0.5),
  Petal.Length = rnorm(n, mean = 4, sd = 1.2),
  Petal.Width  = rnorm(n, mean = 1.2, sd = 0.4)
)

put("Aperçu des données")
simu_data |> 
  head() |> 
  log_print()

# Traitement des données -------------------------------------------------
sep("Traitement des données")

# Calculer les moyennes et écarts-types
resultats <- simu_data %>%
  group_by(Species) %>%
  summarise(
    mean_sepal_length = mean(Sepal.Length),
    sd_sepal_length = sd(Sepal.Length),
    mean_petal_length = mean(Petal.Length),
    sd_petal_length = sd(Petal.Length),
    n = n()
  )

# Analyse de données -------------------------------------------------
sep("Analyse de données")

log_print(paste0(format(Sys.time(),"%Y-%m-%d %H:%M:%S"),
                 "# Prédire Petal.Length en fonction de Sepal.Length"))

# Prédire Petal.Length en fonction de Sepal.Length
modele <- lm(Petal.Length ~ Sepal.Length, data = simu_data)


log_print(paste0(format(Sys.time(),"%Y-%m-%d %H:%M:%S"),
                 "# Graphique sur un sous-échantillon"))

# Affichage d’un sous-échantillon pour la clarté du graphique
simu_data_sample <- simu_data %>% sample_n(5000)

ggplot(simu_data_sample, aes(x = Sepal.Length, y = Petal.Length)) +
  geom_point(alpha = 0.2, color = "steelblue") +
  geom_smooth(method = "lm", color = "darkred", se = FALSE) +
  labs(
    title = "Régression linéaire : Petal.Length ~ Sepal.Length",
    x = "Longueur du sépale",
    y = "Longueur du pétale"
  ) +
  theme_minimal()

# A retenir -------------------------------------------------
sep("A retenir")

# Envoi des résultats dans la log
summary(modele) |> 
  log_print()

# Fermeture de la log
log_close()
