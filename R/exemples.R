library(dplyr)


# Print -------------------------------------------------------------


exemple1 <- function(indicateur) {
  
  print(indicateur) # <- on ajoute un print()
  
  if (indicateur == "Sepale") {
    resultat <- iris |> 
      select(Species,starts_with("Sepal")) |> 
      head(3)
  } else if (indicateur == "Petale") {
    resultat <- iris |> 
      select(Species,starts_with("Petal")) |> 
      head(3)
  }
  return(resultat)
  
}

exemple1("petale")


# Breakpoints --------------------------------------------------------


exemple1 <- function(indicateur) {
  
  if (indicateur == "Sepale") {
    resultat <- iris |> 
      select(Species,starts_with("Sepal")) |> 
      head(3)
  } else if (indicateur == "Petale") {
    resultat <- iris |> 
      select(Species,starts_with("Petal")) |> 
      head(3)
  }
  return(resultat)
  
}

exemple1("petale")


# Browser -------------------------------------------------------------


exemple1 <- function(indicateur) {
  
  browser() # <- on ajoute un browser()
  
  if (indicateur == "Sepale") {
    resultat <- iris |> 
      select(Species,starts_with("Sepal")) |> 
      head(3)
  } else if (indicateur == "Petale") {
    resultat <- iris |> 
      select(Species,starts_with("Petal")) |> 
      head(3)
  }
  return(resultat)
  
}

exemple1("petale")


# debug -------------------------------------------------------------


exemple1 <- function(indicateur) {
  
  if (indicateur == "Sepale") {
    resultat <- iris |> 
      select(Species,starts_with("Sepal")) |> 
      head(3)
  } else if (indicateur == "Petale") {
    resultat <- iris |> 
      select(Species,starts_with("Petal")) |> 
      head(3)
  }
  return(resultat)
  
}

debug(exemple1) # pour lancer le debuggeur sur la fonction
exemple1("petale") # maintenant le debuggeur se lance qd on soumet la fonction
undebug(exemple1) # pour arrêter le debuggeur sur la fonction

debugonce(exemple1) # Pour lancer le debuggeur qu'une seule fois
exemple1("petale") # le debuggeur ne va se lancer qu'une seule fois


# Recover ------------------------------------------------------------------

options(error = recover)

f <- function(x) {
  y <- x + 1
  g(y)
}

g <- function(z) {
  if (z < 10) {
    res <- z*z
  }
  return(res)
}

f(2) # le mode debug ne s'active pas
f(100) # le mode debug s'active

# Pour rétablir le comportement par défaut
options(error = NULL)

# Astuce ------------------------------------------------------------------

resultat <- iris  %>%
  group_by(Species) %>%
  summarise(moyenne_long_petale = mean(Petal.Length, na.rm = TRUE)) %>% 
  { print(head(.)); . } %>% 
  rename(Especes = Species)

iris  %>%
  group_by(Species) %>%
  summarise(moyenne_long_petale = mean(Petal.Length, na.rm = TRUE)) %>% 
  { tab_agr <<- . } %>% 
  rename(Especes = Species)

# boomer ------------------------------------------------------------------

library("boomer")

# Ecriture en une ligne
boom(iris |> head(2) |> filter(Sepal.Length > 5))

# Ecriture avec des crochets
boom({
  iris |> 
    head(2) |> 
    filter(Sepal.Length > 5)
})

# Ecriture à la fin de la chaîne de traitement
iris |> 
  head(2) |> 
  filter(Sepal.Length > 5) |> 
  boom()

# Un cas d'erreur
iris |> 
  head(2) |> 
  filter(Species == "virginica") |> 
  boom()

# Avec l'argument clock = TRUE
iris |> 
  head(2) |> 
  filter(Sepal.Length > 5) |> 
  boom(clock = TRUE)

# Avec l'argument print = list(data.frame = str)
iris |> 
  head(2) |> 
  filter(Sepal.Length > 5) |> 
  boom(clock = TRUE, print = list(data.frame = str))
