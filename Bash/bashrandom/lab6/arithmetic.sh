#!/bin/bash

function division(){

    if [ "$#" -ne 2 ]; then
        echo "Nieprawidlowa liczba parametrow"
        exit -1
    fi    
    if (( $(($1-$2)) == 0 )); then
        echo "Mianownik rowny 0"
        exit -1
    fi
    echo $((($1+$2)/($1-$2)))
}

function factorialRec(){

    if [ "$#" -ne 1 ]; then
        echo "Nieprawidlowa liczba parametrow"
        exit -1
    fi

    if (( $1 > 1 )); then
        echo $(( $(factorialRec $(( $1 - 1 )) ) * $1 ))
    else
        echo 1
    fi

}

function factorialIter(){
    if [ "$#" -ne 1 ]; then
        echo "Nieprawidlowa liczba parametrow"
        exit -1
    fi

    wynik=1
    for((i=1;i<=$1;i++)); do
        wynik=$(( $wynik * $i ))
    done
    echo $wynik
}

function sumArgs(){

    wynik=0
    for i in $@; do
        if ! [[ "$i" =~ ^[0-9]+$ ]]; then
            echo "Podaj tylko liczby calkowite!"
            exit -1
        else
            wynik=$(( $wynik+$i ))
        fi
    done
    echo $wynik
}
sumArgs 1 2 3 5

