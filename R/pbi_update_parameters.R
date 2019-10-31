#' Update parameters in a given workspace
#'
#' @param wsId Workspace's target Id
#' @param dsId Dataset's target ID
#' @param wsParam Name of the param what you want to update
#' @param newValue New value for the param what you want to update
#' @param key PowerBI application's Azure token
#' @return HTTP code to know the good/bad state of the POST request
#' @example
#' pbi_update_parameters("id_ws","dataset_id", "countryparam","France","token")
#' @import AzureAuth
#' @import httr
#' @import jsonlite
#'
#' @export

pbi_update_parameters <- function(wsId,dsId,wsParam,newValue, key){

  url <- "https://api.powerbi.com/v1.0/myorg/"

  endpoint <- paste(url,"groups/",wsId,"/datasets/",dsId,"/Default.UpdateParameters", sep = "")

  body <- jsonlite::toJSON(list(updateDetails=list(data.frame(name=wsParam,newValue = newValue))[[1]]),auto_unbox = TRUE)


  httr::POST(url = endpoint,httr::add_headers(Authorization = paste("Bearer", AzureAuth::extract_jwt(key), sep = " ")),
             httr::content_type("application/json"),
             body = body,
             encode = "json")

}
