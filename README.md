changer
=======

Interface to www.change.org API.

Current functionality is reading signatures from petitions.

Make sure you have the dependencies

```
install.packages(c("RCurl","rjson","plyr"))
```

Then install via

```
require(devtools)
install_github("changer","barryrowlingson")
```

Next sign up on www.change.org and get an API key. This is a long hexadecimal string.

Then you can do

```
setAPIkey("insertyourAPIkeyhere")
id = getID("http://www.change.org/en-GB/petitions/michael-gove-keep-climate-change-in-the-curriculum")
pid = id$petition_id
sigs = getSignatures(pid, 10, 1)
head(sigs)
```
