
# Step 1: install additional R packages needed
remotes::install_github('eco4cast/neon4cast')




# Step 2: install python packages using reticulate
to_install <- scan('requirements.txt', character(), quote = "")
reticulate::py_install(packages = to_install)




# Step 3: run python script - include the import etc.
reticulate::source_python('forecast_script.py') 
# this should write the csv.gz file at the end




# Step 4: find forecast_file to submit to challenge
team_name <- 'your_team_name'
forecast_date <-  Sys.Date()
theme <- 'aquatics'

forecast_file <- paste0(paste(theme, forecast_date, team_name), '.csv.gz')
