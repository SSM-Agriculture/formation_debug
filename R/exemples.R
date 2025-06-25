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

