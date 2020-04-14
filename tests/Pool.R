library(DBI)
library(pool)
  pool <- dbPool(
    drv = RIBMDB::ODBC(),
    dbname = "bjhadb",
    host = "waldevdbclnxtst06.dev.rocketsoftware.com",
    port = 60000,
    user = "newton",
    password = "A2m8test"
  )
  dbGetQuery(pool, "SELECT * from priyankatestnew;")
  poolClose(pool)