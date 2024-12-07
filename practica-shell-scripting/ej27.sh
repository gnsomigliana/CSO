#!/bin/bash
#Realice un script que implemente a través de la utilización de 
#funciones las operaciones básicas sobre arreglos:
#inicializar: Crea un arreglo llamado array vacío
#agregar_elem <parametro1>: Agrega al final del arreglo el parámetro
# recibido
#eliminar_elem <parametro1>: Elimina del arreglo el elemento que se 
#encuentra en la posición recibida como parámetro.
# Debe validar que se reciba una posición válida
#longitud: Imprime la longitud del arreglo en pantalla
#imprimir: Imprime todos los elementos del arreglo en pantalla
#inicializar_Con_Valores <parametro1><parametro2>: Crea un arreglo con
# longitud <parametro1>y en todas las posiciones asigna el
# valor <parametro2>

inicializar() {
	array=()
}

agregar_elem() {
	if [ $# -ne 1 ]; then
		echo "La funcion debe recibir el elemento a agregar"
		return 5
	fi
	array+=($1)
}

eliminar_elem() {
	if [ $# -ne 1 ]; then
		echo "La funcion debe recibir la pos del elemento a eliminar"
		return 4
	fi
	pos=$1
	if [ $pos -ge 0 ] && [ $pos -lt ${#array[@]} ]; then
		elem=${array[$pos]}
		unset array[$pos]
		array=(${array[@]})
	else
		echo "La posicion $1 no existe en el arreglo"
		return 55
	fi
}

longitud() {
	echo "La longitud del arreglo es de: ${#array[@]}"
}

imprimir() {
	echo "${array[@]}"
}

inicializar_Con_Valores(){
	if [ $# -ne 2 ]; then
		echo "La funcion debe recibir 2 parametros"
		return 3
	fi
	arreglo=()
	longitud=$1
	valor=$2
	for ((i=0; i < $longitud; i++ )); do
		arreglo+=("$valor")
	done
	echo "Arreglo = ${arreglo[@]}"
}

inicializar
agregar_elem 1
agregar_elem 2
agregar_elem 3
imprimir 
longitud
eliminar_elem 5
eliminar_elem 1
imprimir 
longitud
inicializar_Con_Valores 5 2
