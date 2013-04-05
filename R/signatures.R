##' Get signatures for a petitions
##'
##' @title Get Signatures 
##' @param id the petition id
##' @param page_size number of signatures to get
##' @param page starting signature, in units of page size
##' @return data frame of signatures, with some extra info in the "meta" attribute
##' @export
##' @author Barry Rowlingson
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
##' Get many pages of signatures
##'
##' To get more than one page of signatures, use this.
##' @title Get Pages of signatures
##' @param id petition id
##' @param pages page numbers
##' @param page_size number of signatures in each page
##' @param progress progress indicator, "none", "text", or "tk"
##' @return a data frame of signature info
##' @export
##' @author Barry Rowlingson
getSignaturePages <- function(id,pages,page_size,progress="text"){
  ldply(pages,
        function(page){getSignatures(id,page=page,page_size=page_size)},
        .progress=progress
        )
}
