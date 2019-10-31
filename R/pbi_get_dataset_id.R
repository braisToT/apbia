#' Get dataset id from a given workspace
#'
#' @param wsId Workspace's target Id
#' @param key PowerBI application's Azure token
#' @return The Id from the first dataset inside the workspace which id you have passed as parameter
#' @example
#' dataset_id <- pbi_get_dataset_id("workspaceId","key")
#' @import AzureAuth
#' @import httr
#' @import jsonlite
#'
#' @export

pbi_get_dataset_id <- function(wsId, key){

  url <- "https://api.powerbi.com/v1.0/myorg/"

  endpoint <- paste(url,"groups/",wsId,"/datasets", sep = "")

  resp <- httr::GET(endpoint, httr::add_headers(Authorization = paste("Bearer", AzureAuth::extract_jwt(key), sep = " ")))

  if(httr::http_type(resp) != "application/json"){
    stop("API did not return a JSON", call. = FALSE)
  }

  parsed <- jsonlite::fromJSON(httr::content(resp, "text"), simplifyVector = FALSE)

  result <- toString(parsed$value[[1]][1])

}
