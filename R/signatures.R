getSignatures <- function(id,page_size,page){
  apikey=getAPIkey()
  apiroot=getAPIroot()
  url=paste0(apiroot,id,"/signatures?api_key=",apikey,sep="")
  if(!missing(page_size)){
    url=paste0(url,"&page_size=",page_size,sep="")
  }
  if(!missing(page)){
    url=paste0(url,"&page=",page,sep="")
  }
  response = getURL(url)
  json = fromJSON(response)
  sigs = json$signatures
  non.null.list <- lapply(sigs, Filter, f = Negate(is.null))
  m = rbind.fill(lapply(non.null.list, as.data.frame))
  atts=json[c("page","prev_page_endpoint","next_page_endpoint","total_pages","signature_count")]
  attr(m,"meta")=atts
  m
  
}

getSignaturePages <- function(id,pages,page_size,progress="text"){
  ldply(pages,
        function(page){getSignatures(id,page=page,page_size=page_size)},
        .progress=progress
        )
}
