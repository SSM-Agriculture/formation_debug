library(dplyr)

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

# exemple1("Petale")
exemple1("petale")

