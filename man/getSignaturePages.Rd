\name{getSignaturePages}
\alias{getSignaturePages}
\title{Get Pages of signatures}
\usage{
  getSignaturePages(id, pages, page_size,
    progress = "text")
}
\arguments{
  \item{id}{petition id}

  \item{pages}{page numbers}

  \item{page_size}{number of signatures in each page}

  \item{progress}{progress indicator, "none", "text", or
  "tk"}
}
\value{
  a data frame of signature info
}
\description{
  Get many pages of signatures
}
\details{
  To get more than one page of signatures, use this.
}
\author{
  Barry Rowlingson
}

