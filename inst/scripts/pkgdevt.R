require(devtools)
require(usethis)
require(pkgbuild)
require(roxygen2)
require(testthat)
require(knitr)
require(fs)
require(purrr)

usethis::use_git()
usethis::use_github()
usethis::use_namespace()
usethis::use_roxygen_md()
usethis::use_package_doc()

usethis::use_testthat()

fs::file_create("R/data.R")

usethis::use_data_raw("claims")
usethis::use_data_raw("triangles")
usethis::use_data_raw("exposures")
usethis::use_data_raw("industry")

usethis::use_vignette("A-actuarial-loss-reserving-overview", "Actuarial Loss Reserving Overview")
usethis::use_vignette("B-simulation-of-claims-data", "Simulation of Claims Data")
usethis::use_vignette("C-triangles", "Loss Development Triangles")
usethis::use_vignette("D-ldfs", "Loss Development Factors")

usethis::use_r("utils")
usethis::use_r("simulate_claims")
usethis::use_r("loss_run")
usethis::use_r("triangles")
