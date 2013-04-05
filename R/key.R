
##' Set the API Key
##'
##' You need an API key from www.change.org to use the API.
##' 
##' @title Set the API key
##' @param key Hexadecimal key value
##' @return nothing
##' @export
##' @author Barry Rowlingson
setAPIkey <- function(key){
  e = ns_env("changer")
  assign("api_key",key,envir=e)
  invisible(0)
}

##' Get the pre-set API key
##'
##' This function gets the API key from the package environment
##' 
##' @title Get the API Key
##' @return the hexadecimal string previously set.
##' @export
##' @author Barry Rowlingson
getAPIkey <- function(){
  e = ns_env("changer")
  if(!exists("api_key",envir=e, inherits=FALSE)){
    stop("No API key set with setAPIkey(...) function")
  }
  get("api_key",envir=e,inherits=FALSE)
}
