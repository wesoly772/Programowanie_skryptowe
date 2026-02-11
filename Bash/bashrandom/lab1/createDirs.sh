#!/bin/bash

#Z1.1
sciezka=$1
mkdir $sciezka
#Z1.2
cd $sciezka

#Z1.3
mkdir dir1 dir2 dir3
mkdir dir1/dir1.1 dir2/dir2.1 dir3/dir3.1 dir3/dir3.2
touch dir1/text1.txt dir2/dir2.1/file1.csv dir3/dir3.2/file2.csv Aa Bb Cc

#Z1.4
mv dir1/text1.txt dir1/dir1.1
#Z1.5
cp dir2/dir2.1/file1.csv dir1
#Z1.6
mv Aa Aa1
#Z1.7
ls -d *[1,2]/
#Z1.8
du --max-depth=1



