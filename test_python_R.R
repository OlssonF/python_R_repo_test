
# install additional R packages
# install.packages('reticulate')
remotes::install_github('eco4cast/neon4cast')

# install python packages
reticulate::py_install('torch')

# run python script
reticulate::source_python('forecast_script.py') # this sh

# find forecast_fil to submit to challenge
team_name <- 'VT_aquaers'
forecast_date <-  Sys.Date()

forecast_file <- paste0(paste('aqautics', forecast_date, team_name), '.csv.gz')
