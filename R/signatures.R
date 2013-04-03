getSignatures <- function(id){
  apikey=getAPIkey()
  apiroot=getAPIroot()
  url=paste0(apiroot,id,"/signatures?api_key=",apikey,sep="")
  response = getURL(url)
  json = fromJSON(response)
  sigs = json$signatures
  m = ldply(sigs,function(s){t(data.frame(unlist(s)))})
  atts=sigs[c("page","prev_page_endpoint","next_page_endpoint","total_pages","signature_count")]
  attr(m,"meta")=atts
  m
  
}
