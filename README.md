# PEIP SUPPLY
![PEIP SUPPLY](https://avatars2.githubusercontent.com/u/33991308?s=200&v=4) 

| LINUX                                                                                                                         | OSX                                                                                                                               | WINDOWS                                                                                                                                                                 |
|-------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [![CircleCI](https://circleci.com/gh/peip-supply/peip-supply.svg?style=svg)](https://circleci.com/gh/peip-supply/peip-supply) | [![Build Status](https://travis-ci.org/peip-supply/peip-supply.svg?branch=master)](https://travis-ci.org/peip-supply/peip-supply) | [![Build status](https://ci.appveyor.com/api/projects/status/693iii0inmuex2o9/branch/master?svg=true)](https://ci.appveyor.com/project/tidal/peip-supply/branch/master) |

**A fully tested meta provisioning tool for the (upcoming) version 2 of [PEIP Project](https://github.com/peip-project/). Provides an abstraction for APK, APT, BREW, CHOCOLATEY, DNF, EMERGE (PORTAGE), PACMAN, SNAP, YUM and ZYPPER packages on WINDOWS, MAC and (almost) every LINUX distribution. Provides a unified API to provision desktop PCs, bare metal servers, single-board computers, virtual machines, containers and deployment tools.**     

----------

Description: 
------------
The I in PEIP stands for Integration and PEIP SUPPLY's job is to serve as an integrator on the infrastructure level for operating systems and package managers. It provides an unified API to provision custom packages (shell script installations) and (until now) 10 different package managers. It is also meant to provide and provisioning abstraction for tools like vagrant, docker, chef, saltstack, ansible, puppet, etc. PEIP SUPPLY's scripts are fully united tested and integration tested on the different operating systems. Functional tests and examples for vagrant, docker, etc. are in the work at the moment. (For more information on the testing methods see below)     

Requirements: 
------------
PEIP SUPPLY works on a computer with barely any installs and uses BASH as a least common denominator. On systems which don't come with a BASH installation like windows or alpine linux it will provide one (For that reason PEIP SUPPLY's entry point is a pure shell script to make sure it can work). So the only requirement PEIP SUPPLY needs to work is a package manager for the operating system - on windows it needs a [chocolatey](https://chocolatey.org/) installation, and [homebrew](https://brew.sh/) on mac and the native package manager which comes which each linux distribution. 

Usage:   
------
A manual with examples is in the works, but a quick example can be found in the test [configuration](.circleci/config.yml) for circleci. Each of the tests for the different operating systems and package managers is provisioned in the same manner:
```bash
./peip-supply setup
./peip-supply curl
./peip-supply unzip
./peip-supply shunit2
```

- '**setup**' makes sure PEIP SUPPLY can fully work - Installs BASH and calls the package manager's update method if needed. 
- '**curl**' and '**unzip**' install the package manager's curl and unzip packages which are needed to download and unpack shunit2  
- '**shunit2**' is a PEIP SUPPLY custom package which globally installs shunit2  

How it works:   
------
Pckages in PEIP SUPPLY are configured in the script directory. Configuration is only needed for custom packages (a shell/bash script) or packages which need a special treatment, repositotry, etc. The work flow it uses to discover an installation strategy for an package is as follows:
1. It will look for a custom **BASH script** in the directory which has the same name as the package to install.
2. If it can't find one it will look an **install script** in the package managers directory of the package.
3. If it can't find one it will look for an **alias mapping file** in the package managers directory of the package.
4. At last it will try to install the package via the package managers **native install method**.

- A **BASH script** can be for example a custom downloader 
- A **install script** can be for example a some preperations for the package manager as discovering a certain repository. 
- A **alias mapping file** simply maps a package to a package name of the manager. For example the 'curl' package is mapped in portage/emerge to its 'net-misc/curl' package.
- The **native install method** simply wraps the package name with the install command of the manager.



Tests: 
------
PEIP SUPPLY's unit, functional and integration tests are executed with the [shUnit2](https://github.com/kward/shunit2) test framework for Bourne based shell scripts. It also comes with a package for shUnit2 which is used to provision the test environment. 

PEIP SUPPLY uses travis for OSX testing, appveyor for WINDOWS and circleci for LINUX systems. The integration test matrix looks as follows:

| Package Manager | Operating System | CI Provider |
|-----------------|------------------|-------------|
| APK             | Alpine Linux     | CircleCI    |
| APT             | Debian           | CircleCI    |
| BREW            | OSX              | Travis      |
| CHOCOLATEY      | Windows          | AppVoyer    |
| DNF             | Fedora           | CircleCI    |
| EMERGE/PORTAGE  | Gentoo           | CircleCI    |
| PACMAN          | Arch Linux       | CircleCI    |
| SNAP            | tbd              | tbd         |
| YUM             | CentOS           | CircleCI    |
| ZYPPER          | OpenSuse         | CircleCI    |

----------
To run the unit tests you have to install shUnit2 via the PEIP SUPPLY or call the setup method in the test directory which will locally install shUnit2 in a vendor directory. 
```bash
./tests/unit/setup.sh
```
Once shUnit2 is installed simply execute the test suite
```bash
./tests/unit/helpers/suite.sh
```
Do not call the individual test scripts separatly as the inherit variables and bash sources from the suite script.


License
--------

 - Software:
The software source code in this project is made available under the 'MIT License' which can be found in the project's 
[LICENSE](LICENSE) file or at: https://opensource.org/licenses/MIT  

Third Party Copyrights
----------------------

 - The Icon used as a Logo for PEIP SUPPLY is copyright [Icons8](https://icons8.com) and licensed under [CC BY-ND 3.0](https://creativecommons.org/licenses/by-nd/3.0/)
