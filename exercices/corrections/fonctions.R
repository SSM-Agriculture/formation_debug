#' @name calculs
#'
#' @param niveau_zoom indique le niveau de zoom souhaité par l'utilisateur
#'
#' @return un dataframe avec différentes statistiques
calculs <- function(niveau_zoom) {
  
  print(niveau_zoom)
  
  if (niveau_zoom %in% regions_utilisateur) {
    RESULTAT_ZOOM <- RESULTAT |> 
      filter(REG == niveau_zoom) |> 
      summarise(
        region = first(LIB_REG),
        nb_dep = n(),
        total_communes = sum(NB_COMMUNES),
        moyenne_par_dep = mean(NB_COMMUNES),
        min_dep = min(NB_COMMUNES),
        max_dep = max(NB_COMMUNES)
      )
    return(RESULTAT_ZOOM)
  } else {
    return(print("Le zoom n'est pas disponible dans les données"))
  }
  
}