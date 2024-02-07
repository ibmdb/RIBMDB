# Installing RIBMDB

*Copyright (c) 2014 IBM Corporation and/or its affiliates. All rights reserved.*

Permission is hereby granted, free of charge, to any person obtaining a copy of this
software and associated documentation files (the "Software"), to deal in the Software
without restriction, including without limitation the rights to use, copy, modify, 
merge, publish, distribute, sublicense, and/or sell copies of the Software, 
and to permit persons to whom the Software is furnished to do so, subject to the 
following conditions:

The above copyright notice and this permission notice shall be included in all copies 
or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, 
INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR 
PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE 
FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR 
OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER 
DEALINGS IN THE SOFTWARE.

## Contents

1. [Overview](#Installation)
2. [ibm_db Installation on Linux](#inslnx)
3. [ibm_db Installation on MacOS](#insmac)
4. [ibm_db Installation on Windows](#inswin)
5. [ibm_db Installation on AIX](#insaix)

## <a name="overview"></a> 1. Overview

The [*RIBMDB*](https://github.com/ibmdb/RIBMDB) is an asynchronous/synchronous interface for RIBMDB to IBM DB2.

Following are the steps to installation in your system.

This RIBMDB driver has been tested on 64-bit/32-bit IBM Linux, MacOS and Windows.

## <a name="inslnx"></a> 2. RIBMDB Installation on Linux.

### 2.1 Install RIBMDB
You may install the package using R install command for source package i.e. .tar.gz:
```
sudo R CMD INSTALL RIBMDB_1.0-24.tar.gz
```
You can install the package directly from source folder as well using below command:

```
sudo R CMD INSTALL <Master Folder of RIBMDB Project. Make sure the name of same is different than RIBMDB like RIBMDB-src>
```

## <a name="insmac"></a> 3. RIBMDB Installation on MacOS.

### 3.1 Install RIBMDB 

MAC is a UNIX based system so all the above commands for LINUX are applicable for MAC as well with an exception below for installation where argument for **host_alias** is mandatory.

Command to install a package with args to CONFIGURE i.e. If you don't want the package installer to install the CLI driver (OR) You already have the CLI driver path set i.e. "/home/foo/bar/clidriver"
```
sudo R CMD INSTALL --no-staged-install RIBMDB_1.0-24.tar.gz --configure-args="host_alias=darwin15.6.0" --configure-args="IBM_DB_HOME=/home/foo/bar/clidriver"
```

Command to install a package with no args to CONFIGURE i.e. If you want the package installer to install the CLI driver based on LINUX version and Arch.
```
sudo R CMD INSTALL --no-staged-install RIBMDB_1.0-24.tar.gz --configure-args="host_alias=darwin15.6.0"
```

## <a name="inswin"></a> 4. RIBMDB Installation on Windows.

### 4.1 Install RIBMDB for Windows

You may install the package using R install command for source package i.e. .tar.gz:

```
Rcmd.exe INSTALL RIBMDB_1.0-24.tar.gz
```
You can install the package directly from source folder as well using below command:
```
Rcmd.exe INSTALL <Master Folder of RIBMDB Project. Make sure the name of same is different than RIBMDB like RIBMDB-src>
```


## <a name="insaix"></a> 5. RIBMDB Installation on AIX.

### 5.1 Install RIBMDB for AIX


AIX is a UNIX based system so all the above commands for LINUX are applicable for AIX as well with few exceptions and notes as follows:

Make sure you have YUM installed on your AIX machine. This facilitates R and other dependent softwares installation rather than doing the same manually from AIX toolbox. YUM installation steps, R RPM and other RPMs are available in IBM toolbox link: https://www.ibm.com/support/pages/node/883796

Command to install a package with args to CONFIGURE i.e. If you don't want the package installer to install the CLI driver (OR) You already have the CLI driver path set i.e. "/home/foo/bar/clidriver"
```
sudo R CMD INSTALL RIBMDB_1.0-24.tar.gz --configure-args="IBM_DB_HOME=/home/foo/bar/clidriver"
```


Command to install a package with no args to CONFIGURE i.e. If you want the package installer to install the CLI driver based on LINUX version and Arch.
```
sudo R CMD INSTALL RIBMDB_1.0-24.tar.gz
```


## <a name="m1chip"></a> 6. Steps to install ibm_db on MacOS M1/M2 Chip system (arm64 architecture)
**Warning:** If you use the ARM version of homebrew (as recommended for M1/M2 chip systems) you will get the following error message:
```
$ brew install gcc-12
Error: Cannot install in Homebrew on ARM processor in Intel default prefix (/usr/local)!
Please create a new installation in /opt/homebrew using one of the
"Alternative Installs" from:
  https://docs.brew.sh/Installation
You can migrate your previously installed formula list with:
  brew bundle dump
```
Install `gcc@12` using homebrew `(note: the x86_64 version of homebrew is needed for this, not the recommended ARM based homebrew)`. The clearest instructions on how to install and use the `x86_64` version of `homebrew` is by following below steps:
*	My arm64/M1 brew is installed here:
```
	$ which brew
	/opt/homebrew/bin/brew
```
*	Step 1. Install x86_64 brew under /usr/local/bin/brew
	`arch -x86_64 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"`
*	Step 2. Create an alias for the x86_64 brew
	I added this to my ~/.bashrc as below:
```
	# brew hack for x86_64
	alias brew64='arch -x86_64 /usr/local/bin/brew'
```
* Then install gcc@12 using the x86_64 homebrew:
```
	brew64 install gcc@12
```
* Now find location of `lib/gcc/12/libstdc++.6.dylib` file in your system. It should be inside `/usr/local/homebrew/lib/gcc/12` or `/usr/local/lib/gcc/12` or `/usr/local/homebrew/Cellar/gcc@12/12.2.0/lib/gcc/12` or something similar. You need to find the correct path.
Suppose path of gcc lib is `/usr/local/homebrew/lib/gcc/12`. Then update your .bashrc/.zshrc file with below line
```
export DYLD_LIBRARY_PATH=/usr/local/homebrew/lib/gcc/12:$DYLD_LIBRARY_PATH
```
