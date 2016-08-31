#!/bin/sh

# Copyright (C) 2016 Tats.U.
# This script is licensed under The MIT License.
# https://opensource.org/licenses/MIT

if ! which kpsewhich >/dev/null 2>&1; then
    echo 'Any TeX distributions are not installed or this script cannnot access one.' >&2
    exit 1
fi
TEXMFHOME=`kpsewhich -var-value TEXMFHOME`
if [ ! -d $TEXMFHOME ]; then
    echo 'Any TeX distributions are not installed or this script cannnot access one.' >&2
    exit 1
fi
atexit() {
    rm -f $TMPFILE
}
TMPFILE=`mktemp`
trap atexit EXIT
trap "trap - EXIT; atexit ; exit -1" SIGHUP SIGTERM SIGINT
curl -Ls http://prdownloads.osdn.jp/mytexpert/26068/jlisting.sty.bz2 | bunzip2 -c > $TMPFILE
if [ $? != 0 ]; then
    echo 'jlisting is not found and cannnot be installed.' >&2
    exit 1
fi
JLISTING_EXISTING=`kpsewhich jlisting.sty`
if [ -f $JLISTING_EXISTING ]; then
    if cmp -s $JLISTING_EXISTING $TMPFILE; then
       echo "jlisting is already installed in \`$JLISTING_EXISTING.'">&2
       exit 1
    fi
fi
JLISTING_DIR=$TEXMFHOME/tex/platex/jlisting
JLISTING=$JLISTING_DIR/jlisting.sty
mkdir -p $JLISTING_DIR && {
    cp $TMPFILE $JLISTING || {
	echo "cannot copy jlisting to \`$JLISTING.'">&2
	exit 1
    }
} || {
    echo "cannot make a directory \`$JLISTING_DIR.'">&2
    exit 1
}
echo 'jlisting was successfully installed.'
echo "To use it, add \`\\usepackage{jlisting}' into the preamble of your TeX document."
echo 'Note: you do not have to use it if your TeX document do not contain any source code with non-ASCII characters or is not compiled by (u)pLaTeX.'
