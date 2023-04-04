
# Step 1: install additional R packages needed
remotes::install_github('eco4cast/neon4cast')

# Step 2: install python packages
reticulate::py_install('torch')

# Step 3: run python script - include the import etc.
reticulate::source_python('forecast_script.py') 
# this should write the csv

# Step 4: find forecast_file to submit to challenge
team_name <- 'VT_aquaers'
forecast_date <-  Sys.Date()

forecast_file <- paste0(paste('aqautics', forecast_date, team_name), '.csv.gz')
