# Do not automatically interpret strings as factors
options(stringsAsFactors = FALSE)

if (interactive()) {
  # Resize output to terminal dimensions
  suppressPackageStartupMessages(require('setwidth'))

  # Load history
  .First <- function() {
    try(utils::loadhistory('~/.Rhistory'), silent = TRUE)
  }

  # Save history
  .Last <- function() {
    try(utils::savehistory('~/.Rhistory'), silent = TRUE)
  }

  # Source Bioconductor
  .bioc <- function() {
    source('http://bioconductor.org/biocLite.R')
  }

  # Detailed ls
  .ls <- function() {
    pretty <- function(x) {
      ifelse(is.null(x), NA, prettyNum(x, big.mark = ',', scientific = FALSE))
    }
    extract <- function(symbol) {
      var <- get(symbol) 
      list('symbol' = symbol,
           'class'  = class(var)[1], 
           'mode'   = mode(var),
           'type'   = typeof(var),
           'size'   = pretty(object.size(var)),
           'length' = pretty(length(var)),
           'nrow'   = pretty(nrow(var)),
           'ncol'   = pretty(ncol(var)))
    }
    as.data.frame(do.call(rbind, lapply(ls(pos = 1), extract)))
  }
}

# vim: syntax=R
