#!/bin/bash

BUILD_DIR=genCoverLetter_build
SRC_DIR=genCoverLetter_src

FILE_BASENAME=FarooqiAashirCoverLetter

PDF_COMPILER=lualatex

cd $SRC_DIR # Need to do since cant change lualatex require search path
clear
$PDF_COMPILER --output-directory=../$BUILD_DIR ${FILE_BASENAME}.tex
cd ..

if [ "$1" = "-m" ]
then
	echo "Muted Output"
else
	google-chrome-stable ${BUILD_DIR}/${FILE_BASENAME}.pdf
	clear
fi
