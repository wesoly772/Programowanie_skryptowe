#!/bin/bash

function stats(){
    if  [ -f $1 ]; then
        if ! [ -w $1 ]; then
            echo "Nie mozna odczytac pliku!"
            exit -1
        fi
    else
        echo "Plik zrodlowy nie istnieje!"
        exit -1
    fi 

    if [ -f $2 ]; then
        if ! [ -w $2 ]; then
            echo "Nie mozna zapisac do pliku!"
            exit -1
        fi
    else
        touch $2 2>/dev/null
        if [ $? -ne 0 ]; then
            echo "Nie mozna utworzyc pliku!"
            exit -1
        fi
    fi

    cat $1 | sed 's/[[:blank:]]\+/\n/g' | grep -v '^$' | sort | uniq -c | awk '{ print $2, $1}' | sort -k2 -r > $2
    
}
stats $@
