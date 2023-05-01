library(tidyverse)
library(lubridate)


# Step 1: install additional R packages needed
remotes::install_github('eco4cast/neon4cast')




# Step 2: install python packages using reticulate
to_install <- scan('requirements.txt', character(), quote = "")
reticulate::py_install(packages = to_install)
message('package install complete')


message('starting python script')
# Step 3: run python script - include the import etc.
reticulate::source_python('forecast_script.py') 
# this should write the csv.gz file at the end




# Step 4: find forecast_file to submit to challenge
team_name <- 'VT_Aquaers'
forecast_date <-  Sys.Date()
theme <- 'aquatics'

# set to standard
forecast <- readr::read_csv('lake.csv.gz') |>
  dplyr::mutate(reference_datetime = min(datetime) - lubridate::days(1)) |> 
  dplyr::rename(parameter = parameters)


forecast_file <- paste0(paste(theme, forecast_date, team_name, sep = '-'), '.csv.gz')

readr::write_csv(forecast, forecast_file)

neon4cast::submit(forecast_file)
