#!/bin/bash
#Implemente un script que recorra un arreglo compuesto por números
# e imprima en pantalla sólo los números pares y que cuente 
#sólo los números impares y los informe en pantalla al finalizar 
#el recorrido.

es_par() { # retorna 0 si el valor es par, 1 si es impar
	if [ $(expr $1 % 2) -eq 0 ]; then
		return 0
	else 
		return 1
	fi 
}

if [ $# -eq 0 ]; then
	echo "Error: numero incorrecto de parametros recibidos"
	echo "Uso $0 <num1> <num2> ..."
	exit 1
fi

arreglo=($@) #creo array con argumentos pasados al script
echo "Numeros pares:"
cant_im=0
for elem in ${arreglo[@]}; do
	if es_par $elem; then
		echo "$elem"
	else 
		cant_im=$(expr $cant_im + 1) 
	fi 
done
echo "La cantidad de numeros impares es de: $cant_im"
