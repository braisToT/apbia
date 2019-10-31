#' retrieve Azure token for PBI app
#'
#' @param tenant Directory (tenant) ID
#' @param app Application (client) ID
#' @return The Azure toke for your PowerBI App
#' @example
#' token <- pbi_get_azure_token("tenantId","appId")
#' @import AzureAuth
#'
#' @export

pbi_get_azure_token <- function(tenant, app){

  token <- AzureAuth::get_azure_token(
    resource = "https://analysis.windows.net/powerbi/api",
    tenant= tenant,
    app =   app,
    authorize_args=list(redirect_uri="http://localhost:8080/"),
    use_cache=FALSE, auth_type = "authorization_code")

  AzureAuth::extract_jwt(token)
}



