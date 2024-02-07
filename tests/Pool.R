library(DBI)
library(pool)
  pool <- dbPool(
    drv = RIBMDB::ODBC(),
    dbname = "SAMPLE"
    host = "waldevdbclnxtst06.dev.rocketsoftware.com",
    port = 60000,
    user = "db2user",
    password = "xxxxxx"
  )
  dbGetQuery(pool, "SELECT * from table;")
  poolClose(pool)