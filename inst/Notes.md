# Notes

- Initially given transactional based claims data with payments

- Derive static loss runs from transactionals by evaluation date

- Summarize loss run data into triangles:

  - Development Triangles:
    + Paid Loss
    + Reported Loss
    + Reported Claim Counts

  - Diagnostic Triangles:
    + Case Reserves
    + Incremental Paid
    + etc.

- Derive Age-To-Age Triangles

- Derive Averages from Age-To-Age Triangles

- User selections: Selects Age-To-Age factors given averages, industry, and priors
  + Display save and reset button
  + Display feedback and validation for various LDF selection diagnostics and warnings
  + Once submitted, push selections to database

- Interpolate in-between age CDFs from user selected LDFs:
  + Linear interpolation for ages < 12
  + Double exponential interpolation for ages 12+
  + Decay factors for extrapolation beyond latest age

- Show % reported, % paid, and % counts reported

- Show initial derived ultimate based off development factors

- Show a table with aggregated data used to derive triangles

- Add conditional formatting to display any anomalies and weird trends

