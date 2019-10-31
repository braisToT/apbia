#' Create a workspace with custom parameters
#'
#' @param name The name of the new workspace
#' @param key PowerBI application's Azure token
#' @return HTTP code to know the good/bad state of the POST request
#' @example
#' pbi_create_workspace("Analytics_workspace")
#' @import AzureAuth
#' @import httr
#' @import jsonlite
#'
#' @export

pbi_create_workspace <- function(name, key){

  url <- "https://api.powerbi.com/v1.0/myorg/"

  endpoint <- paste(url,"groups",sep = "")

  body <- jsonlite::toJSON(list(name=name),auto_unbox = TRUE)

  httr::POST(url = endpoint,httr::add_headers(Authorization = paste("Bearer", AzureAuth::extract_jwt(key), sep = " ")),
             httr::content_type("application/json"),
             body = body,
             encode = "json",
             httr::verbose())

}
