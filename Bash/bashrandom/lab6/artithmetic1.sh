#!/bin/bash

#Z1
function division(){
    if ! [[ $1 =~ [0-9]+ && $2 =~ [0-9]+ ]] then
        echo "Podano nieprawidlowe argumenty"
        exit -1
    fi
    if (( $1 - $2 == 0 )); then
        echo "Mianownik rowny 0"
        exit -1
    fi
    wynik=$(( ($1+$2) / ($1-$2) ))
    echo "Wynik:" $wynik
    
}

#Z2
function factorialRec(){
    if ! [[ $1 =~ [0-9]+ ]]; then
        echo "Nieprawidlowe dane!"
        exit -1
    fi
    if (( $1 <= 1 )); then
        echo 1
    else
        wczesniej=$(factorial $(($1-1)))
        echo $(($1 * $wczesniej))
    fi

}

#Z3
function facotrialIter(){
    if ! [[ $1 =~ [0-9]+ ]]; then
        echo "Nieprawidlowe dane!"
        exit -1
    fi

    wynik=1
    for ((i=2;i<=$1;i++)); do
        wynik=$(( ($wynik * $i) ))
    done
    echo $wynik   
}

#Z4
function sumArgs(){
    wynik=0
    for ((i=1;i<=$#;i++)); do
        liczba=${@:$i:1}
        if [[ $liczba =~ ^[0-9]$ ]]; then
            wynik=$((($wynik + $liczba)))
        fi
    done
    echo $wynik
}
sumArgs 12 2.5 2
