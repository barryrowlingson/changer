\name{getSignatures}
\alias{getSignatures}
\title{Get Signatures}
\usage{
  getSignatures(id, page_size, page)
}
\arguments{
  \item{id}{the petition id}

  \item{page_size}{number of signatures to get}

  \item{page}{starting signature, in units of page size}
}
\value{
  data frame of signatures, with some extra info in the
  "meta" attribute
}
\description{
  Get signatures for a petitions
}
\examples{
\dontrun{
setAPIkey("insertyourAPIkeyhere")
id = getID("http://www.change.org/en-GB/petitions/michael-gove-keep-climate-change-in-the-curriculum")
pid = id$petition_id
sigs = getSignatures(pid, 10, 1)
head(sigs)
}
}
\author{
  Barry Rowlingson
}

