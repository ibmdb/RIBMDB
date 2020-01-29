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

## Install

You may install the package using R install command:

```
Rcmd.exe INSTALL RIBMDB_1.0-20.tar.gz
```
For **Docker Linux Container**, use below commands:
```
*******
```
> For more installation details please refer:  [INSTALLATION GUIDE](https://github.com/ibmdb/RIBMDB/master/INSTALL.md)


### Important Environment Variables and Download Essentials 

While installing, the driver downloads and installs the CLI driver from below URL if the same is not present in the system/environment variable.

If you don't want the installer to download the CLI driver, you can download the same or copy from alternate source rather than below to your system's R.Home() directory.
The path should look like `<R_HOME>/clidriver`

Else, Download the driver in your selected directory and set the `IBM_DB_HOME` Environment variable for the same to be used.

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
work-around under `issues` or on google groups forum. Links are:   
    
https://github.com/ibmdb/RIBMDB/issues    
https://groups.google.com/forum/#!forum/RIBMDB   
   
If no solution found, you can open a new issue on github or start a new topic in google groups.

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