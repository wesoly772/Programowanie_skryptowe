#!/bin/bash

#Z1
function rodziel(){
    if ! [ -r "$1" ]; then
        echo "Pliki nie istnieja"
        exit -1
    fi
    if ! [[ -f "$2" && -f "$3" ]]; then
        touch $2
        touch $3
    else
        if ! [[ -w "$2" && -w "$3" ]]; then
            echo "Brak uprawnien do zapisu"
            exit -1
        else
            > $2
            > $3
        fi
    fi
    while read -r line; do
        numer=$(( RANDOM % 2 + 2 ))
        echo $line >> ${!numer}
    done < "$1"
}


#Z2

function struktura(){
    if ! [ -d "$1"  ]; then
        echo "Pierwszy argument nie jest katalogiem!"
        exit -1
    else
        if ! [ -w "$1" ]; then
        echo "Brak uprawnien do zapisu w katalogu!"
        exit -1
        fi
    fi

    if ! [ -r "$2" ]; then
        echo "Nie mozna odczytac pliku z nazwami katalogow!"
        exit -1
    fi

    while read -r line; do
        mkdir -p "$1/$line"
    done < "$2"
}

struktura $@