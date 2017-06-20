
# options(stringsAsFactors = FALSE)

if (interactive()) {



  # R()
  .First <- function() {

    try({
      library(utils)

      # Load history
      loadhistory('~/.Rhistory')

      # Load favourite packages
      pkgs <- c(
        # Automatically resize stdout to terminal dimensious
        'setwidth',
        # Hadley
        'magrittr', 'tidyverse',
        # data.table
        'dtplyr', 'data.table'
        )

      # pkgs <- pkgs[pkgs %in% installed.packages()]

      pkgs <- lapply(pkgs,
                     function (p) {
                       s <- suppressWarnings(
                         suppressPackageStartupMessages(
                           require(p, character.only = TRUE)
                         )
                       )
                       ifelse(s, p, paste0('!', p))
                     })

      message(paste0('R(): ', paste0(pkgs, collapse = ', ')))

    }, silent = TRUE)
  }



  # ~R()
  .Last <- function() {
    message('~R()')

    # Save history
    try({
      savehistory('~/.Rhistory')
    }, silent = TRUE)
  }



  # Source Bioconductor
  .bioc <- function() {
    source('http://bioconductor.org/biocLite.R')
  }




  # Detailed ls
  .ls <- function() {
    pretty <- function(x) {
      p <- prettyNum(x, big.mark = ',', scientific = FALSE)
      ifelse(is.null(x), NA, p)
    }
    extract <- function(symbol) {
      var <- get(symbol)
      list('symbol' = symbol,
           'class'  = var %>% class() %>% .[1],
           'mode'   = var %>% mode,
           'type'   = var %>% typeof,
           'size'   = var %>% object.size %>% pretty,
           'length' = var %>% length %>% pretty,
           'nrow'   = var %>% nrow %>% pretty,
           'ncol'   = var %>% ncol %>% pretty)
    }
    # Collect
    ls(pos = 1) %>% lapply(extract) %>% do.call(rbind, .) %>% data.table
  }



}

# vim: syntax=r
