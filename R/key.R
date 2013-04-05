
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
  options(changer.key=key)
  invisible(0)
}

##' Get the pre-set API key
##'
##' This function gets the API key from options or environment
##' 
##' @title Get the API Key
##' @return the hexadecimal string previously set.
##' @export
##' @author Barry Rowlingson
getAPIkey <- function(){
  option.key <- getOption("changer.key")
  env.key <- Sys.getenv("CHANGER_KEY")
  if (!is.null(option.key)){
    return(option.key)
  } else if (!env.key == "") {
    return(env.key)
  }else{
    stop("No API key set with setAPIkey(...) function")
  }

}
