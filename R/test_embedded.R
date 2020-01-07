


library(apbia)
tenant_id <- "95c66cc9-65c1-4b50-8937-10fdb9cfdcd0"

app_id <- "fb30d2cd-0a86-444c-85ae-eb45f625a896"

token <- pbi_get_azure_token(tenant = tenant_id, app = app_id)

id_client_workspace <- pbi_get_workspace_id_by_name("TestEmbedded", token)

id_report_embedded <- pbi_get_report_id_in_workspace(id_client_workspace,token)

id_data_set_embedded <- pbi_get_dataset_id(id_client_workspace,token)

paste("https://app.powerbi.com/reportEmbed?reportId=",)


body2 <- jsonlite::toJSON(jsonlite::fromJSON(s),auto_unbox = TRUE)
pbi_url_embedded <- function(id_client_workspace,id_report_embedded,token){

  url <- "https://api.powerbi.com/"

  endpoint <- paste(url,"groups/",id_client_workspace,"/reports/",id_report_embedded,"/GenerateToken", sep = "")

  body2 <- jsonlite::toJSON(jsonlite::fromJSON(s),auto_unbox = TRUE)
  # jsonlite::toJSON(list(accessLevel="View",identities=data.frame(username = "daniel.prieto")),
  #
  #                  auto_unbox = TRUE)

  httr::POST(url = endpoint,httr::add_headers(Authorization = paste("Bearer", AzureAuth::extract_jwt(token), sep = " ")),
             httr::content_type("application/json"),
             body = body2,
             encode = "json")


  browseURL("https://app.powerbi.com/reportEmbed?reportId=dd51e3bf-4f1f-4ee5-8ce9-a4e5bb7b744b&groupId=434fb6be-756d-4191-91f5-0bc4b08c314f&autoAuth=true")


}

browseURL(httr::GET("https://app.powerbi.com/reportEmbed?reportId=dd51e3bf-4f1f-4ee5-8ce9-a4e5bb7b744b&groupId=434fb6be-756d-4191-91f5-0bc4b08c314&config=eyJjbHVzdGVyVXJsIjoiaHR0cHM6Ly9XQUJJLVVTLU5PUlRILUNFTlRSQUwtcmVkaXJlY3QuYW5hbHlzaXMud2luZG93cy5uZXQifQ%3d%3d"))
pbi_url_embedded(id_client_workspace,id_report_embedded, token)




s <- "{\"accessLevel\": \"View\",\"identities\": [{\"username\": \"daniel.prieto\",\"roles\": [\"linemanager\"], \"datasets\": [\"6d53111e-4cb5-4ea9-97eb-1ee18b318302\"]}]}"

j <-jsonlite::toJSON(jsonlite::fromJSON(s), auto_unbox = TRUE)



https://app.powerbi.com/reportEmbed?reportId=f6bfd646-b718-44dc-a378-b73e6b528204&groupId=be8908da-da25-452e-b220-163f52476cdd&
