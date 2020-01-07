#' Get report title from a given workspace
#'
#' @param wsId Workspace's target Id
#' @param reportId Report's target Id
#' @param key PowerBI application's Azure token
#' @return The title from the report inside the workspace which id you have passed as parameter
#' @example
#' report_title <- pbi_get_title_from_report("workspaceId","reportId",key")
#' @import AzureAuth
#' @import httr
#' @import jsonlite
#'
#' @export

pbi_get_title_from_report <- function(wsId,reportId, key){

  url <- "https://api.powerbi.com/v1.0/myorg/"

  endpoint <- paste(url,"groups/",wsId,"/reports/",reportId,sep = "")

  resp <- httr::GET(endpoint, httr::add_headers(Authorization = paste("Bearer", AzureAuth::extract_jwt(key), sep = " ")))

  parsed <- jsonlite::fromJSON(httr::content(resp, "text"), simplifyVector = FALSE)

  result <- toString(parsed$name)

}
