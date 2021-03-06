library(doParallel)                     # FIXME: unload?

.fork_not_windows <- function(expected, expr)
{
    err <- NULL
    obs <- tryCatch(expr, error=function(e) {
        if (!all(grepl("fork clusters are not supported on Windows",
                       conditionMessage(e))))
            err <<- conditionMessage(e)
        expected
    })
    checkTrue(is.null(err))
    checkIdentical(expected, obs)
}

test_bpvec_Params <- function()
{
    params <- list(serial=SerialParam(),
                   mc=MulticoreParam(2),
                   snow0=SnowParam(2, "FORK"),
                   snow1=SnowParam(2, "PSOCK"),
                   dopar=DoparParam())

    dop <- registerDoParallel(cores=2)
    ## FIXME: restore previously registered back-end?

    x <- 1:10
    expected <- sqrt(x)
    for (ptype in names(params)) {
        .fork_not_windows(expected, 
                          bpvec(x, sqrt, BPPARAM=params[[ptype]]))
    }
}
