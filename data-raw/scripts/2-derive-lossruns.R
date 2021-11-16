#  ------------------------------------------------------------------------
#
# Title : Derive Individual Claim Level Lossruns by Evaluation
#    By : Jimmy Briggs
#  Date : 2020-11-10
#
#  ------------------------------------------------------------------------

library(lubridate)
library(dplyr)
library(randomNames)
library(devtri)
library(tidyr)

trans <- qs::qread("data-raw/cache/trans.qs")

source("R/loss_run.R")

loss_data <- loss_run_all_evals(trans, merge = TRUE)

qs::qsave(loss_data, "data-raw/cache/lossruns.qs")
