#' Get workspace id through it's name
#'
#' @param name Workspace's name
#' @param key PowerBI application's Azure token
#' @return The Id from the workspace which name you have passed as parameter
#' @example
#' workspace_id <- pbi_get_workspace_id_by_name("pepe","token")
#' @import AzureAuth
#' @import httr
#' @import jsonlite
#'
#' @export

pbi_get_workspace_id_by_name <- function(name, key){

  url <- "https://api.powerbi.com/v1.0/myorg/"

  endpoint <- paste(url,"groups?%24filter=name%20eq%20%27",name,"%27",sep = "")
  resp <- httr::GET(endpoint, httr::add_headers(Authorization = paste("Bearer", AzureAuth::extract_jwt(key), sep = " ")))

  if(httr::http_type(resp) != "application/json"){
    stop("API did not return a JSON", call. = FALSE)
  }

  parsed <- jsonlite::fromJSON(httr::content(resp, "text"), simplifyVector = FALSE)

  result <- toString(parsed$value[[1]][1])

}
