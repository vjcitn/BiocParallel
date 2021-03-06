\name{MulticoreParam-class}
\Rdversion{1.1}
\docType{class}

\alias{MulticoreParam}
\alias{MulticoreParam-class}

\alias{bpisup,MulticoreParam-method}
\alias{bpschedule,MulticoreParam-method}

\alias{bplapply,ANY,MulticoreParam-method}
\alias{bpvec,ANY,MulticoreParam-method}
\alias{bparallelize,ANY,MulticoreParam-method}

\alias{show,MulticoreParam-method}

\title{Enable multi-core parallel evaluation}

\description{

  This class is used to parameterize single computer multicore parallel
  evaluation on non-Windows computers.

}

\usage{
MulticoreParam(workers = detectCores(), setSeed = TRUE, recursive = TRUE, 
    cleanup = TRUE, cleanupSignal = tools::SIGTERM, verbose = FALSE, 
    ...) 

\S4method{bplapply}{ANY,MulticoreParam}(X, FUN, ..., BPPARAM)

\S4method{bpvec}{ANY,MulticoreParam}(X, FUN, ..., AGGREGATE=c, BPPARAM)

\S4method{bparallelize}{ANY,MulticoreParam}(X, ..., BPPARAM)
}

\arguments{

  \item{X}{A vector-like object supporting \code{length}, \code{[},
    and, for \code{bplapply}, \code{[[}.}

  \item{FUN}{A function operating on \code{X} and other arguments in
    \code{...}.}

  \item{...}{Additional arguments to \code{FUN}, or for classes derived
    from \code{MulticoreParam}.}

  \item{AGGREGATE}{A function taking any number of arguments \code{...}
    called to reduce results (elements of the \code{...} argument of
    \code{AGGREGATE} from parallel jobs. The default, \code{c},
    concatenates objects and is appropriate for vectors; \code{rbind}
    might be appropriate for data frames.}

  \item{BPPARAM}{An \code{MulticoreParam}-class instance.}

  \item{workers}{\code{integer(1)} number of cores to use for parallel
    evaluation.}

  \item{setSeed}{\code{logical(1)}, as described in
    \code{parallel::mcparallel} argument \code{mc.set.seed}.}

  \item{recursive}{\code{logical(1)} indicating whether recursive calls
    are evaluated in parallel; see \code{parallel::mclapply}
    argument \code{mc.allow.recursive}.}

  \item{cleanup}{\code{logical(1)} indicating whether forked children
    will be terminated before \code{bplapply} returns, as for
    \code{parallel::mclapply} argument \code{cleanup}. If
    \code{TRUE}, then the signal sent to the child is
    \code{cleanupSignal}.}

  \item{cleanupSignal}{\code{integer(1)} the signal sent to forked
    processes when \code{cleanup=TRUE}.}

  \item{verbose}{\code{logical(1)} when \code{TRUE} echo stdout of
    forked processes. This is the complement of
    \code{parallel::mclapply}'s argument \code{mc.silent}.}

}

\section{MulticoreParam constructor}{

  Return an object with specified values. The object may be saved to
  disk or reused within a session.

}

\section{Methods}{

  The following generics are implemented and perform as documented on
  the corresponding help page (e.g., \code{?bpisup}):
  \code{\link{bpworkers}}, \code{\link{bpstart}}, \code{\link{bpstop}},
  \code{\link{bpisup}}, \code{\link{bpschedule}},
  \code{\link{bpbackend}}.

}

\author{Martin Morgan \url{mailto:mtmorgan@fhcrc.org}}

\seealso{

  \code{getClass("BiocParallelParam")} for additional parameter classes.

  \code{register} for registering parameter classes for use in parallel
  evaluation.

}

\examples{
p <- MulticoreParam()
bplapply(1:10, sqrt, BPPARAM=p)
bpvec(1:10, sqrt, BPPARAM=p)

\dontrun{
register(MulticoreParam(), default=TRUE)
}
}

\keyword{classes}
