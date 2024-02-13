library(DBI)
library(pool)

  UID <- Sys.getenv("DB2_USER")
  PASSWD <- Sys.getenv("DB2_PASSWD")

  pool <- dbPool(
    drv = RIBMDB::ODBC(),
    dbname = "SAMPLE",
    host = "waldevdbclnxtst06.dev.rocketsoftware.com",
    port = 60000,
    user = UID,
    password = PASSWD
  )
  dbGetQuery(pool, "SELECT * from table;")
  poolClose(pool)