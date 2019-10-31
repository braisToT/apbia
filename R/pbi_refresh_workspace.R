#' Refresh a workspace data
#'
#' @param wsId Workspace's target Id
#' @param dsId Dataset's target ID
#' @param key PowerBI application's Azure token
#' @return HTTP code to know the good/bad state of the POST request
#' @example
#' pbi_refresh_workspace("wsID","datasetId","token")
#' @import AzureAuth
#' @import httr
#'
#' @export

pbi_refresh_workspace <- function(wsId, dsId, key){

  url <- "https://api.powerbi.com/v1.0/myorg/"

  endpoint <- paste(url,"groups/",wsId,"/datasets/",dsId,"/refreshes", sep = "")

  httr::POST(url = endpoint,
             httr::add_headers(Authorization = paste("Bearer", AzureAuth::extract_jwt(key), sep = " ")),
             httr::content_type("application/json"))
}
