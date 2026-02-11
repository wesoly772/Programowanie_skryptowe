#!/bin/bash

#Z1
function bubbleSort(){
    tablica=("$@")
    n=${#tablica[@]}

    for((i=0;i<n;i++)); do
        if ! [[ ${tablica[$i]} =~ ^[0-9]+$ ]]; then
            echo "Arugemnty nie sa liczbami calkowitymi"
            exit -1
        fi
    done

    for((i=0;i<n;i++)); do
        for((j=0;j<n-1;j++)); do
            if (( tablica[$j] > tablica[$j+1] )); then
                temp=${tablica[$j+1]}
                tablica[$j+1]=${tablica[$j]}
                tablica[$j]=$temp
            fi
        done

    done
    echo ${tablica[@]}

}

#Z2
function multiplicationTab(){

    declare -A matrix

    if [[ $# -ne 2 ]]; then
        echo "Nieprawidlowa liczba argumentow"
        exit -1
    fi

    wiersze=$1
    kolumny=$2
    

    if ! [[ $wiersze =~ ^[0-9]+$ && $kolumny =~ ^[0-9]+$ ]]; then
        echo "Argumenty nie sa liczbami calkowitymi/dodatnimi"
        exit -1
    fi

    for((i=1;i<wiersze;i++)); do
        for((j=1;j<kolumny;j++)); do
            matrix[$i,$j]=$(($i*$j))
        done
    done
    
    
    printf "%4s" ''
    for((i=1;i<kolumny;i++)); do
        printf "%4s" $i
    done
    echo ""

    for((i=1;i<wiersze;i++)); do
        printf "%4s" $i
        for((j=1;j<kolumny;j++)); do
            printf "%4s" ${matrix[$i,$j]}
        done
        echo ""
    done
    

}

function Integration(){
    if [[ $# -lt 3 ]]; then
        echo "Za mala liczba argumentow"
        exit -1
    fi

    for liczba in "$@"; do
        if ! [[ $liczba =~ ^-?[0-9]*\.?[0-9]+$ ]]; then
            echo "Arguemnty nie sa liczbami rzeczywistymi!"
            exit -1
        fi
    done

    tablica=("$@")
    n=${#tablica[@]}
    suma=0

    for((i=0;i<n-1;i++)); do
        pole=$(echo "(${tablica[$i]} + ${tablica[$i+1]}) / 2 " | bc -l )
        suma=$(echo "$suma + $pole" | bc -l)
    done

    echo "Pole: $suma"
    
}
Integration 1 2 3