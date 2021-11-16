#  ------------------------------------------------------------------------
#
# Title : Derive Loss Development Triangles
#    By :
#  Date : 2020-11-10
#
#  ------------------------------------------------------------------------

library(lubridate)
library(dplyr)
library(devtri)
library(tidyr)
library(purrr)

loss_data <- qs::qread("data-raw/cache/lossruns.qs")

source("R/triangles.R")

tris <- purrr::map(c("paid", "reported", "case", "n_claims"),
                   function(x) { derive_triangles(loss_dat = loss_data, type = x, limit = NA) }) %>%
  rlang::set_names(c("paid", "reported", "case", "n_claims"))

qs::qsave(tris, "data-raw/cache/triangles.qs")
