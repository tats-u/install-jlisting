#

## What's this?
This is a shell script for installing jlisting.  It is a patch for listings.sty that fixes the bug about non-ASCII charactors in the lst(input)listing environment in (u)pLaTeX, when used with listings.  However, it is not distributed in CTAN, so an easy-installer is very convenient and needed.

## How to install
After install a TeX distribution, and execute the following command:
### Unix like OS (Linux/OS X)

``` bash
# Installing in your machine:
curl -Ls https://raw.githubusercontent.com/tats-u/install-jlisting/master/install-jlisting.sh | sudo sh -
# Installing in a shared machine:
curl -Ls https://raw.githubusercontent.com/tats-u/install-jlisting/master/install-jlisting-local.sh | sh -
```

### Windows
**Important: you must execute the following command in Git Bash or MSYS2!**

``` bash
# Installing in your machine (Important: Git Bash or MSYS2 must be run AS ADMINISTRATOR):
curl -Ls https://raw.githubusercontent.com/tats-u/install-jlisting/master/install-jlisting.sh | sh -
# Installing in a shared machine:
curl -Ls https://raw.githubusercontent.com/tats-u/install-jlisting/master/install-jlisting-local.sh | sh -
```

### How to use jlisting
jlisting is used with listings when the document is compiled by (u)pLaTeX.  i.e.

``` latex
\usepackage{listings,jlisting}
```

``` latex
\usepackage{ifuptex,listings}
\ifptex
\usepackage{jlisting}
\fi
```
