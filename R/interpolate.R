# https://github.com/mages/ChainLadder/issues/26

interpolate_ldfs <- function(observed_ldf_df, interp_age){
  # observed_ldf_df <- sel_data
  # interp_age <- 9

  ## At some age ('ldf_2_one') all selected 'ldfs' = 1 for all 'ages' >= ldf_2_one
  ## Hence our 'pct_ibnr' -> inf for all 'ages' >= 'ldf_2_one',
  ## and recieve error when fit linear model
  ## Test if 'interp_age' >= 'ldf_2_one' then return 1. Else proceed to interpolation

  ldf_2_one <- min(observed_ldf_df$age[observed_ldf_df$ldf == 1])
  #the first age which the ldf is 1

  if (interp_age >= ldf_2_one) {
    return(1)
  } else {

    ## Exclude rows from 'observed_ldf_df' where ldf == 1
    observed_ldf_df <- observed_ldf_df[observed_ldf_df$ldf != 1,]

    observed_ldf_df <- observed_ldf_df %>%
      dplyr::mutate(pct_ibnr = 1 - (1 / ldf))

    ## Fit weibull model
    weibul_model <- lm(log(-log(observed_ldf_df$pct_ibnr)) ~
                         log(observed_ldf_df$age)) # Boor Eq (8)

    ## Define the age of the ldfs above and below the interpulated age
    age_below <- interp_age - (interp_age %% 12)
    age_above <- interp_age + (12 - (interp_age %% 12))


    fit_below <- exp(-exp(weibul_model$coefficients[1] +
                            weibul_model$coefficients[2] * log(age_below)))
    fit_above <- exp(-exp(weibul_model$coefficients[1] +
                            weibul_model$coefficients[2] * log(age_above)))
    fit_at <- exp(-exp(weibul_model$coefficients[1] +
                         weibul_model$coefficients[2] * log(interp_age)))

    ## Selected ldfs at age_below and age_above
    observed_below <- observed_ldf_df$pct_ibnr[observed_ldf_df$age == age_below]
    observed_above <- observed_ldf_df$pct_ibnr[observed_ldf_df$age == age_above]

    ## observed_below is na when age_below < 12. Set equal to 1
    if(interp_age < 12) observed_below = 1

    ## variables to make extrapolation easier
    max_obs_age <- max(observed_ldf_df$age)

    if(interp_age < max_obs_age){   # interpolate
      interp_along_curve <- observed_below + (((fit_at - fit_below) /
                                                 (fit_above - fit_below)) *
                                                (observed_above - observed_below))
    }  else{                           # extrapolate

      fit_at_max_age <- exp(-exp(weibul_model$coefficients[1] +
                                   weibul_model$coefficients[2] *
                                   log(max_obs_age)))

      obs_at_max_age <- observed_ldf_df$pct_ibnr[observed_ldf_df$age ==
                                                   max_obs_age]

      interp_along_curve <- fit_at * obs_at_max_age / fit_at_max_age
    }
    ## Calculate ldf
    implied_ldf <- 1 / (1 - interp_along_curve)
    ## Adjust for age < 12 months
    implied_full_ay_ldf <- ifelse(interp_age >= 12, implied_ldf,
                                  implied_ldf * 12 / interp_age)

    return(implied_full_ay_ldf)

  }}
