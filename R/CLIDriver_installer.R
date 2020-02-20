# RIBMDB CLI Driver Installer file.
#
CURRENT_DIR = R.home()

DOWNLOAD_DIR = CURRENT_DIR

installerURL = 'https://public.dhe.ibm.com/ibmdl/export/pub/software/data/db2/drivers/odbc_cli/'

license_agreement = paste('\n\n****************************************\nYou are downloading a package which includes the R module for IBM DB2/Informix.  The module is licensed under the Apache License 2.0. The package also includes IBM ODBC and CLI Driver from IBM, which is automatically downloaded as the R module is installed on your system/device. The license agreement to the IBM ODBC and CLI Driver is available in ',DOWNLOAD_DIR,'/clidriver/license. Check for additional dependencies, which may come with their own license agreement(s). Your use of the components of the package and dependencies constitutes your acceptance of their respective license agreements. If you do not accept the terms of any license agreement(s), then delete the relevant component(s) from your device.\n****************************************\n')

platform = .Platform$OS.type
arch = .Platform$r_arch

if((nchar(arch)==0)){
  arch = R.version$arch
}
rversion = R.version.string

cat(paste("platform = " , platform , ", arch = " , arch , ", R_Version = " , rversion, "\n\n"))

IBM_DB_HOME=Sys.getenv("IBM_DB_HOME")

install_R_ibm_db = function(installerURL)
{
  endian = .Platform$endian
  
  env = Sys.getenv("IBM_DB_HOME")
  
  IS_ENVIRONMENT_VAR=FALSE
  CLI_DIR=paste(DOWNLOAD_DIR,"/clidriver",sep="")
  RIBMDB_DIR=paste(DOWNLOAD_DIR,"/library/RIBMDB",sep="")
  if(!(nchar(env)==0) || dir.exists(CLI_DIR)){
    if((nchar(env)==0)){
      IBM_DB_HOME = CLI_DIR
      Sys.setenv("IBM_DB_HOME"=IBM_DB_HOME)
    }
    IS_ENVIRONMENT_VAR = TRUE
    cat(paste("<CLI_DRIVER_PATH>:",Sys.getenv("IBM_DB_HOME"),"\n\n"))
    if(dir.exists(RIBMDB_DIR)){
      if(grepl('darwin',R.version$os)){
        nameToolCommand = paste("install_name_tool -change libdb2.dylib ",
                                CLI_DIR, "/lib/libdb2.dylib ", 
                                RIBMDB_DIR, "/libs/RIBMDB.so",sep="")
        cat(nameToolCommand)
        system(nameToolCommand)
      }
    }
  }
  else
  {
    if(platform == 'windows') {
      if(grepl("64", arch)) {
        installerfileURL = paste(installerURL , 'ntx64_odbc_cli.zip',sep="")
      }
    }
    else if(platform == 'linux' || platform == 'unix')
    {
      if(grepl('darwin',R.version$os))
      {
        if(grepl("64", arch)) {
          installerfileURL = paste(installerURL , 'macos64_odbc_cli.tar.gz',sep="")
        } else {
          cat(paste('Mac OS 32 bit not supported. Please use an ' ,
                    'x64 architecture.\n'))
          return;
        }
      }else{
        if(grepl("64", arch)) {
          installerfileURL = paste(installerURL , 'linuxx64_odbc_cli.tar.gz',sep="")
        } else {
          installerfileURL = paste(installerURL , 'linuxia32_odbc_cli.tar.gz',sep="")
        }
      }
    }
    else if(platform == 'aix')
    {
      if(arch == 'ppc')
      {
        installerfileURL = paste(installerURL , 'aix32_odbc_cli.tar.gz',sep="")
      }
      else
      {
        installerfileURL = paste(installerURL , 'aix64_odbc_cli.tar.gz',sep="")
      }
    }

    else
    {
      installerfileURL = paste(installerURL , platform , arch ,
                               '_odbc_cli.tar.gz',sep="")
    }
    
    library(httr)

    if(http_error(installerfileURL)) {
      cat('Unable to fetch driver download file. Exiting the install process.\n')
      quit(status = 1)
    }

    file_name = basename(installerfileURL)
    #if(platform == 'windows') {
      INSTALLER_FILE = paste(DOWNLOAD_DIR, "/",file_name,sep="")
    #}else{
     # INSTALLER_FILE = file_name
    #}
    cat(paste('Downloading DB2 ODBC CLI Driver from ' , installerfileURL,'...\n'))
    copyAndExtractCliDriver(installerfileURL,INSTALLER_FILE)

  }  #END OF EXECUTION
}
copyAndExtractCliDriver = function(installerfileURL,INSTALLER_FILE) {
  if(platform == 'windows') {
    download.file(installerfileURL,INSTALLER_FILE,method = 'wininet',cacheOK = FALSE)
  }else{
    download.file(installerfileURL,INSTALLER_FILE,method = 'auto',cacheOK = FALSE)
  }

  # Using the "unzipper" module to extract the zipped "clidriver",
  # and on successful close, printing the license_agreement
if(platform == 'windows') {
  extractCLIDriver = unzip(INSTALLER_FILE,exdir=DOWNLOAD_DIR)
}else{
  cat("This is linux system")
  extractCLIDriver = untar(INSTALLER_FILE,exdir=DOWNLOAD_DIR)
}

  if(dir.exists(paste(DOWNLOAD_DIR,'/clidriver',sep=""))){
    cat(license_agreement);
    cat('Downloading and extraction of DB2 ODBC CLI Driver completed successfully... \n')
    IBM_DB_HOME = paste(DOWNLOAD_DIR, '/clidriver',sep="");
    Sys.setenv("IBM_DB_HOME"=IBM_DB_HOME)
    cat(paste("<CLI_DRIVER_PATH>:",IBM_DB_HOME,"\n\n"))
    invisible(file.remove(INSTALLER_FILE))
  }else{
    cat('Downloading and extraction of DB2 ODBC CLI Driver unsuccessful... \n')
    quit(status = 1)
  }
}

install_R_ibm_db(installerURL)