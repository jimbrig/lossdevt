
#' Transactional Claims Data
#'
#' Simulated transactional claim payments.
#'
#' @format A data frame with 89266 rows and 12 variables:
#' \describe{
#'   \item{\code{claim_num}}{integer. DESCRIPTION.}
#'   \item{\code{claim_id}}{character. DESCRIPTION.}
#'   \item{\code{accident_date}}{double. DESCRIPTION.}
#'   \item{\code{state}}{character. DESCRIPTION.}
#'   \item{\code{claimant}}{character. DESCRIPTION.}
#'   \item{\code{report_date}}{double. DESCRIPTION.}
#'   \item{\code{status}}{character. DESCRIPTION.}
#'   \item{\code{payment}}{double. DESCRIPTION.}
#'   \item{\code{case}}{double. DESCRIPTION.}
#'   \item{\code{transaction_date}}{double. DESCRIPTION.}
#'   \item{\code{trans_num}}{integer. DESCRIPTION.}
#'   \item{\code{paid}}{double. DESCRIPTION.}
#' }
"claims_transactional"

#' Lossruns
#'
#' Merged individual lossruns as of evaluation dates derived from transactional
#' claims data.
#'
#' @format A data frame with 948124 rows and 22 variables:
#' \describe{
#'   \item{\code{eval_date}}{double. DESCRIPTION.}
#'   \item{\code{claim_num}}{integer. DESCRIPTION.}
#'   \item{\code{claim_id}}{character. DESCRIPTION.}
#'   \item{\code{accident_date}}{double. DESCRIPTION.}
#'   \item{\code{state}}{character. DESCRIPTION.}
#'   \item{\code{claimant}}{character. DESCRIPTION.}
#'   \item{\code{report_date}}{double. DESCRIPTION.}
#'   \item{\code{status}}{character. DESCRIPTION.}
#'   \item{\code{payment}}{double. DESCRIPTION.}
#'   \item{\code{case}}{double. DESCRIPTION.}
#'   \item{\code{transaction_date}}{double. DESCRIPTION.}
#'   \item{\code{trans_num}}{integer. DESCRIPTION.}
#'   \item{\code{paid}}{double. DESCRIPTION.}
#'   \item{\code{reported}}{double. DESCRIPTION.}
#'   \item{\code{accident_year}}{double. DESCRIPTION.}
#'   \item{\code{report_year}}{double. DESCRIPTION.}
#'   \item{\code{eval_year}}{double. DESCRIPTION.}
#'   \item{\code{ay_start}}{double. DESCRIPTION.}
#'   \item{\code{ay_end}}{double. DESCRIPTION.}
#'   \item{\code{ay_avg}}{double. DESCRIPTION.}
#'   \item{\code{devt_in_days}}{double. DESCRIPTION.}
#'   \item{\code{devt}}{double. DESCRIPTION.}
#' }
"lossruns"
