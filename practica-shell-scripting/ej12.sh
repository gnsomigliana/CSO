#!/bin/bash
# a-Script que solicira al usuario 2 numeros, los lee desde entrada 
# standar e imprime multiplicacion, suma, resta y cual es el mayor
# de los numeros leidos
# b- ahora pide que los numero se reciben por parametros y se debe 
# controlar que sean dos parametros 

if [ "$#" -ne "0" ]; then
	mul=$(( $1 * $2 ))
	sum=$(( $1 + $2 ))
	res=$(( $1 - $2 ))
	echo "$1 * $2 = $mul"
	echo "$1 + $2 = $sum"
	echo "$1 - $2 = $res"

	if [ "$1" -gt "$2" ]; then 
		echo "El numero $1 es mayor" 
	elif [ "$1" -lt "$2" ]; then
		echo "El numero $2 es mayor"
	else echo "Los numeros son iguales"
	fi
else
	echo "Error: numero incorrecto de parametros pasados" 
fi 

