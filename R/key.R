
# put the api key in the package enviroment
setAPIkey <- function(key){
  e = ns_env("changer")
  assign("api_key",key,envir=e)
}

getAPIkey <- function(){
  e = ns_env("changer")
  get("api_key",envir=e,inherits=FALSE)
}
