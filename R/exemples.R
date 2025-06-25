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
