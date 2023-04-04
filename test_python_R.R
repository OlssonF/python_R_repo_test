
#test run python
install.packages('reticulate')


# install python packages
reticulate::py_install('torch')

# run python script
reticulate::source_python('c1.py')

# find forecast_fil to submit to challenge
team_name <- 'VT_aquaers'
forecast_date <-  Sys.Date()

forecast_file <- paste0(paste('aqautics', forecast_date, team_name), '.csv.gz')
