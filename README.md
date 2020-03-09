# RIBMDB

An asynchronous/synchronous interface for R to IBM DB2

**Supported Platforms** - Windows64, MacOS64, Linuxx64, Linuxia32, AIX

## API Documentation

> For complete list of RIBMDB APIs and example, please refer `/inst/doc/RIBMDB.pdf`

## Prerequisite

- Make sure your system has C++ compiler installed that support C++11 standard.

- For non-windows platforms: gcc compiler version >= 4.8.3 is required to install `RIBMDB`. Default compiler on RHEL 6 does not have the required support.
Install a newer compiler or upgrade older one.

- For Windows: compiler is optional as `RIBMDB` comes with pre-compiled binary on Windows64 for R version >= 3.x. To compile code on Windows, VC++ 2015.3 v14.00 (v140) or Visual Studio 2017 is required.

- On distributed platforms, you do need not to install any Db2 ODBC client driver for connectivity. `RIBMDB` itself downloads and installs an odbc/cli driver from IBM website during installation. Just install `RIBMDB` and it is ready for use.

- Recommended version of R is >= V3.X. to install `RIBMDB` on Windows.

- The latest R version using which `RIBMDB` is tested: 3.6.1

- RIBMDB package Depends on 'httr' package. Make sure you have this installed post R installation i.e. from R prompt:
```
install.packages('httr')
```

## Build
You can build the package using command:

**Windows**
```
Rcmd.exe build <Master Folder of Project. Make sure the name of same is different than RIBMDB>
```

**UNIX**
```
sudo R CMD build <Master Folder of Project. Make sure the name of same is different than RIBMDB>
```

## Install

You may install the package using R install command for source package i.e. .tar.gz:

**Windows**
```
Rcmd.exe INSTALL RIBMDB_1.0-20.tar.gz
```

**UNIX**
```
sudo R CMD INSTALL RIBMDB_1.0-20.tar.gz
```

You can install the package directly from source folder as well using below command:

**Windows**

```
Rcmd.exe INSTALL <Master Folder of RIBMDB Project. Make sure the name of same is different than RIBMDB like RIBMDB-src>
```

**UNIX**
```
sudo R CMD INSTALL <Master Folder of RIBMDB Project. Make sure the name of same is different than RIBMDB like RIBMDB-src>
```

For **Docker Linux Container**, use below commands:
```
*******
```
> For more installation details please refer:  [INSTALLATION GUIDE](https://github.com/ibmdb/RIBMDB/master/INSTALL.md)


### Important Environment Variables and Download Essentials 

**WINDOWS**

- While installing, the driver downloads and installs the CLI driver from below URL if the same is not present in the system/environment variable.

- If you don't want the installer to download the CLI driver, you can download the same or copy from alternate source rather than below to your system's R.Home() directory.
	The path should look like `<R_HOME>/clidriver`

- Else, Download the driver in your selected directory and set the `IBM_DB_HOME` Environment variable for the same to be used.

**LINUX**

- Binary installer(.zip) is only available for WIN and MAC, not supported for linux.

- General method of package installation is using the source.

- Command to check the dependency of a Shared Object i.e. ".so" file
```
> ldd RIBMDB.so
```

- Command to install in another folder rather than defaul R LIB using -l(. means in the same directory where you are running the command else you can specify the directory where you want to install the LIBRARY))
```
> sudo R CMD INSTALL -l . RIBMDB_1.0-20.tar.gz --no-test-load
```

- Command to install a package without test load
```
> sudo R CMD INSTALL RIBMDB_1.0-20.tar.gz --no-test-load
```

- Command to install a package with args to CONFIGURE i.e. If you don't want the package installer to install the CLI driver (OR) You already have the CLI driver path set i.e. "/home/foo/bar/clidriver"
```
> sudo R CMD INSTALL -c --no-test-load  RIBMDB_1.0-20.tar.gz --configure-args="IBM_DB_HOME=/home/foo/bar/clidriver"
```

- Command to install a package with no args to CONFIGURE i.e. If you want the package installer to install the CLI driver based on LINUX version and Arch.
```
> sudo R CMD INSTALL -c --no-test-load  RIBMDB_1.0-20.tar.gz
```

- Command to test a connection
```
> db2cli validate -database "<dbname>:<HOSTNAME>:<PORT>" -user <UID> -passwd <PASSWORD> -connect
```

- Connnection variable sample for RR file for test
```
 "DATABASE=<dbname>;hostname=<HOSTNAME>;PORT=<PORT>;UID=****;PWD=*****"
 ```

- Command to run a R script i.e. Master.R in the PWD
```
> Rscript Master.R
```

- Command to run R script i.e. Master.R in "/work/foo/R/" directory
```
> Rscript /work/foo/R/Master.R
```

**MAC OS**
- MAC is a UNIX based system so all the above commands for LINUX are applicable for MAC as well with an exception below for installation where argument for **host_alias** is mandatory.

- Command to install a package with args to CONFIGURE i.e. If you don't want the package installer to install the CLI driver (OR) You already have the CLI driver path set i.e. "/home/foo/bar/clidriver"
```
> sudo R CMD INSTALL --no-staged-install RIBMDB_1.0-20.tar.gz --configure-args="host_alias=darwin15.6.0" --configure-args="IBM_DB_HOME=/home/foo/bar/clidriver"
```

- Command to install a package with no args to CONFIGURE i.e. If you want the package installer to install the CLI driver based on LINUX version and Arch.
```
> sudo R CMD INSTALL --no-staged-install RIBMDB_1.0-20.tar.gz --configure-args="host_alias=darwin15.6.0"
```

**AIX**
- AIX is a UNIX based system so all the above commands for LINUX are applicable for AIX as well with few exceptions and notes as follows:

- Make sure you have YUM installed on your AIX machine. This facilitates R and other dependent softwares installation rather than doing the same manually from AIX toolbox. YUM installation steps, R RPM and other RPMs are available in IBM toolbox link: https://www.ibm.com/support/pages/node/883796

- Command to install a package with args to CONFIGURE i.e. If you don't want the package installer to install the CLI driver (OR) You already have the CLI driver path set i.e. "/home/foo/bar/clidriver"
```
> sudo R CMD INSTALL RIBMDB_1.0-20.tar.gz --configure-args="IBM_DB_HOME=/home/foo/bar/clidriver"
```

- Command to install a package with no args to CONFIGURE i.e. If you want the package installer to install the CLI driver based on LINUX version and Arch.
```
> sudo R CMD INSTALL RIBMDB_1.0-20.tar.gz
```

- R 32 bit and 64 bit version can be installed on AIX 64 bit machine. Make sure the R/bin path is pointing to 64 bit installation on 64 bit machine i.e. /opt/freeware/lib64/R/bin.

- make sure gtar is in available in /usr/bin location else use below command to create a link to gtar installation:
```
sudo ln -s /wsdb/oemtools/aixbin/gtar /usr/bin/gtar
```

- Make sure you have curl and curl-devel rpms installed for successfull installation of httr package.

- There is a known issue with httr package installation on 64bit R (Fix is expected soon as per IBM) because of some problem with latest mpfr rpm hence remove it and then retry httr package installation.
```
> sudo rm -rf /opt/freeware/lib64/libmpfr.a
```


**NOTE:**

Use `CLIDriver_Installer.R` to install the CLI driver from internet else if you already have the CLI driver installed, you can simply pass the same as argument i.e. --configure-args="IBM_DB_HOME=<CLI_DRIVER_PATH>" during RIBMDB package installation.

- How to run the installer? 
```
> Rscript CLIDriver_Installer.R
**Expected O/P: ** Installation Path which has to be used during RIBMDB installation in place of "CLI_DRIVER_PATH" in "configure-args"
```

### <a name="downloadCli"></a> Download clidriver ([based on your platform & architecture](#systemDetails)) from the below IBM Hosted URL:
> [DOWNLOAD CLI DRIVER](https://public.dhe.ibm.com/ibmdl/export/pub/software/data/db2/drivers/odbc_cli/)

#### <a name="systemDetails"></a> Cli Drivers for Specific Platform and Architecture

|Platform      |Architecture    |Cli Driver               |Supported     |
| :---:        |  :---:         |  :---:                  |  :---:       |
|AIX           |  ppc           |aix32_odbc_cli.tar.gz    |  Yes         |
|              |  others        |aix64_odbc_cli.tar.gz    |  Yes         |
|Darwin        |  x64           |macos64_odbc_cli.tar.gz  |  Yes         |
|Linux         |  x64           |linuxx64_odbc_cli.tar.gz |  Yes         |
|Windows       |  x64           |ntx64_odbc_cli.zip       |  Yes         |
|              |  x32           |nt32_odbc_cli.zip        |  Yes         |




## Quick Example

```
library(RIBMDB)
channel <- odbcConnect("<dbname>","<uid>","<pwd>")
```

## Un-Install

To uninstall node-RIBMDB from your system, just delete the RIBMDB or RIBMDB directory.


## Need Help?

If you encountered any issue with RIBMDB, first check for existing solution or
work-around under `issues` tab. Link for the same:   
    
https://github.com/ibmdb/RIBMDB/issues
   
If no solution found, you can open a new issue on github in this project under `Issues` tab.

## How to get RIBMDB instance?

The simple api is based on the instances of `Database` class. You may get an 
instance by one of the following ways:

```
library(RIBMDB)
```

## Build Options

### Debug

Standard R debugging. Refer https://support.rstudio.com/hc/en-us/articles/205612627-Debugging-with-RStudio

## Contributor

* Brian Ripley (ripley@stats.ox.ac.uk)
* Michael Lapsley
* Rocket Software
* IBM

## Contributing to the RIBMDB

[Contribution Guidelines](https://github.com/ibmdb/RIBMDB/blob/master/contributing/CONTRIBUTING.md)

```
Contributor should add a reference to the DCO sign-off as comment in the pull request(example below):
DCO 1.1 Signed-off-by: Random J Developer <random@developer.org>
```

## License

Copyright (c) 2002 Brian Ripley <ripley@stats.ox.ac.uk> & Michael Lapsley

Copyright (c) 2019 IBM Corporation

Permission is hereby granted, free of charge, to any person obtaining a copy of 
this software and associated documentation files (the "Software"), to deal in 
the Software without restriction, including without limitation the rights to 
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
the Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR 
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR 
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER 
IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.