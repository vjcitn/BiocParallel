\name{bplapply}
\alias{bplapply}
\alias{bplapply,ANY,ANY-method}
\alias{bplapply,ANY,missing-method}

\title{Parallel lapply-like functionality}

\description{

  \code{bplapply} applies \code{FUN} to each element of \code{X}. Any
  type of object \code{X} is allowed, provided \code{length}, \code{[},
  and \code{[[} methods are available. The return value is a \code{list}
  of length equal to \code{X}, as with \code{\link[base]{lapply}}.

}

\usage{
bplapply(X, FUN, ..., BPPARAM)

\S4method{bplapply}{ANY,ANY}(X, FUN, ..., BPPARAM)

\S4method{bplapply}{ANY,missing}(X, FUN, ..., BPPARAM)
}

\arguments{
  \item{X}{
    Any object for which methods \code{length}, \code{[}, and \code{[[}
    are implemented.
  }

  \item{FUN}{The \code{function} to be applied to each element of \code{X}.}

  \item{\dots}{Additional arguments for \code{FUN}, as in
    \code{\link{lapply}}}

  \item{BPPARAM}{An optional \code{\link{BiocParallelParam}} instance
    determining the parallel back-end to be used during evaluation.}

}

\details{

  When \code{BPPARAM} is \code{missing}, \code{bplapply} uses
  \code{registered()[[1]]}, i.e., the default mechanism for parallel
  evaluation.

  When \code{BPPARAM} is a class for which no method is defined (e.g.,
  \code{\link{SerialParam}}), \code{\link[base]{lapply}} is used.

  See \code{showMethods{bplapply}} for additional methods, e.g.,
  \code{method?bplapply("MulticoreParam")}.

}

\value{See \code{\link[base]{lapply}}.}

\author{
  Martin Morgan \url{mailto:mtmorgan@fhcrc.org}. Original code as
  attributed in \code{\link[parallel]{mclapply}}.
}

\seealso{

  \code{\link{bpvec}} for parallel, vectorized
  calculations.

  \code{\link{BiocParallelParam}} for possible values of \code{BPPARAM}.

}

\examples{
showMethods("bplapply")

## ten tasks (1:10) so ten calls to FUN default registered parallel
## back-end. Compare with bpvec.
system.time(result <- bplapply(1:10, function(v) {
    message("working") ## 10 tasks
    sqrt(v)
}))
result

}

\keyword{manip}
