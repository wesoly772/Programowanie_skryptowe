#!/bin/bash

#Z1
mkdir $2

#Z2
find $1 -type f -name '*.txt'

#Z3
find $1 -type d \( -iname "a*" -or -iname "b*" \)

#Z4
find $1 -type f -executable -name "*.sh"

#Z5
find $1 -type f -empty -user user

#Z6
find $1 -type l

#Z7 pliki nie przekraczajace 1MB
find $1 -type f -group kali -not -size +1M

#Z8 SUDI lub SGID
find $1 -type f -perm /u=s,g=s

#Z9 sticky bit
find $1 -type d -perm -o=t

#Z10 edytowane w przeciagu godziny
find $1 -type f -not -mmin +60

#Z11 blokowe - dysk twardy, cdom znakowe - klawiatura, drukarka
find /dev/ -type b -or -type c

#Z12 usuwanie pustych katalogow 
# {} - dotyczy aktualnego wyniku polecenia find
# \; - oznajmia koniec komendy find
# -prune - find nie wchodzi do usuwanych plikow

find $1 -type d -empty -exec rmdir {} \; -prune

#Z13
find $1 -type f -size +10M -exec cp {} $2 \;

#Z14
find ~ -type d -name "Z*" -exec cp -r {} folder \;