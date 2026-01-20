library(RPostgreSQL) # Load Necessary Libraries
library(RPostgres)
library(DBI)

con <- dbConnect( # Establish Database Connection
  RPostgres::Postgres(),
  dbname = "xxxxxxxxxxxx",
  host = "xxxxxxxxxxxxxxx",
  port = xxxx,
  user = "xxxxxx",
  password = "xxxxxxxx"
)

# Read the table into a data frame
coh_data <- dbReadTable(con, "table_name") # Read table and store on said variable

# View the first few rows
head(coh_data) 
# Database Disconnect
dbDisconnect(con)

