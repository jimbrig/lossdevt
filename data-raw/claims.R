
#  ------------------------------------------------------------------------
#
# Title : Claims Dataprep Script
#    By : Jimmy Briggs
#  Date : 2021-11-15
#
#  ------------------------------------------------------------------------

pak::pak("mdlincoln/docthis")

# simulate transaction claims -------------------------------------------
source("data-raw/scripts/1-simulate-transactional-claims")
claims_transactional <- qs::qread("data-raw/cache/trans.qs")

usethis::use_data(claims_transactional, overwrite = TRUE)
docthis::doc_this("claims_transactional") |> write(file = "R/data.R", append = TRUE)

source("data-raw/scripts/2-derive-lossruns.R")
lossruns <- qs::qread("data-raw/cache/lossruns.qs")

usethis::use_data(lossruns, overwrite = TRUE)
docthis::doc_this("lossruns") |> write(file = "R/data.R", append = TRUE)
