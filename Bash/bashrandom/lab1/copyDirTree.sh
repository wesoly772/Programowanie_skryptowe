#!/bin/bash

katalog=$2
#Z2.1
mkdir $katalog
#Z2.2
cp -r $1 $katalog
#Z2.3
cd $katalog
#Z2.4
ls -la
#Z2.5
tree -h
#Z2.6
pwd
#Z2.7
cd - >/dev/null
#Z.8
rm -r $katalog