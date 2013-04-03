getSignatures <- function(id){
  apikey=getAPIkey()
  apiroot=getAPIroot()
  url=paste0(apiroot,id,"/signatures?api_key=",apikey,sep="")
  response = getURL(url)
  json = fromJSON(response)
  sigs = json$signatures
  non.null.list <- lapply(sigs, Filter, f = Negate(is.null))
  m = rbind.fill(lapply(non.null.list, as.data.frame))
  atts=json[c("page","prev_page_endpoint","next_page_endpoint","total_pages","signature_count")]
  attr(m,"meta")=atts
  m
  
}

