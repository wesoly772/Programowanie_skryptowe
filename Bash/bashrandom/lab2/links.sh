#!/bin/bash

#Z1.1
mkdir $1

#Z1.2
cd $1
mkdir D1 D2 D3 D4
touch D2/F1.txt D3/F1.txt D4/F1.txt

#Z1.3
ln -s /etc/passwd ./D1/passwd_link

#Z1.4
readlink -f D1/passwd_link

#Z1.5
ln ./D3/F1.txt D2/F2.txt

#Z1.6

chmod u=rw,o-rwx,g-rwx D2/F2.txt

#Z1.7
chown users D2/F2.txt

#Z1.8
chgrp users D3/

#Z1.9 nie mozna wejsc do folderu
chmod a-x D3

#Z1.10 - nie mozna tworzyc plikow i podatalogow
chmod a-w D2

#Z1.11 - mozna tworzyc pliki i katalogi ale nie mozna wyswietlic zawartosci KATALOGU
chmod a-r D4

#Z1.12
chmod o+t D4

#Z1.13
touch D1/scr1.sh
chmod ug+x,o-x
#Z1.14
chmod u+s,g+s D1/scr1.sh