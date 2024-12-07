#!/bin/bash
#Realizar un script que visualice por pantalla los números del
# 1 al 100 así como sus cuadrados

#debemos declarar la funcion antes del  "main para que este la conozca
mostrar_cuadrado(){
	res=$(( $1 * $1 ))
	echo "$1 , $1^2 = $res" 
}


for i in $(seq 1 100); do
	mostrar_cuadrado $i 
done


