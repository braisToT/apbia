#' Export a report from a given workspace
#'
#' @param wsId Workspace target Id
#' @param name The name of the .pbix which you want to import
#' @param key PowerBI application's Azure token
#' @return HTTP code to know the good/bad state of the POST request
#' @example
#' pbi_import_report("workspaceId","reportName","token")
#' @import AzureAuth
#' @import httr
#'
#' @export

pbi_import_report <- function(wsId, name, key){

  url <- "https://api.powerbi.com/v1.0/myorg/"

  endpoint <- paste(url,"groups/",wsId,"/imports?datasetDisplayName=",name,".pbix", sep = "")

  httr::POST(endpoint,
             httr::add_headers(Authorization = paste("Bearer",AzureAuth::extract_jwt(key), sep = " ")),
             httr::content_type("multipart/form-data"),
             body = list(y = httr::upload_file(paste(name,".pbix",sep = ""))),
             encode = "multipart",
             httr::verbose())

}
