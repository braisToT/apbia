#' Export a report from a given workspace
#'
#' @param wsId Workspace's Id
#' @param key PowerBI application's Azure token
#' @param reportId Report Id from the report which you want to export
#' @param name The name of the exported report
#' @return HTTP code to know the good/bad state of the POST request
#' @example
#' pbi_export_report("workspaceId","token","reportId","reportName")
#' @import AzureAuth
#' @import httr
#'
#' @export

pbi_export_report <- function(wsId,key ,reportId, name){

  url <- "https://api.powerbi.com/v1.0/myorg/"

  endpoint <-  paste(url,"groups/",wsId,"/reports/",reportId,"/Export",sep = "")

  httr::GET(endpoint,
            httr::add_headers(Authorization = paste("Bearer",AzureAuth::extract_jwt(key), sep = " ")),
            httr::write_disk(paste(name,".pbix",sep = ""), overwrite = TRUE))
}
