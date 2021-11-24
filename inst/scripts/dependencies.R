# No Remotes ----
# Attachments ----
to_install <- c("devtri", "dplyr", "lubridate", "purrr", "rlang", "tibble", "tidyr")
  for (i in to_install) {
    message(paste("looking for ", i))
    if (!requireNamespace(i)) {
      message(paste("     installing", i))
      install.packages(i)
    }
  }
