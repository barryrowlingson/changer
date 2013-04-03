##' Get the ID for a petition
##'
##' 
##' @title Get the ID for a petition
##' @param url The URL of the petition on www.change.org
##' @return a list with "petition_id" component that has the petition id,
##' and "result" component with the status string.
##' @author Barry Rowlingson
getID <- function(url){
  apikey=getAPIkey()
  apiroot=getAPIroot()
  url=paste0(apiroot,"get_id?api_key=",apikey,"&petition_url=",url,sep="")
  response  = getURL(url)
  fromJSON(response)
}
