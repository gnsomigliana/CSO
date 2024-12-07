#!/bin/bash
#Escriba un script que reciba una cantidad desconocida de parámetros
# al momento de su invocación (debe validar que al menos se reciba
# uno). Cada parámetro representa la ruta absoluta de un archivo
# o directorio en el sistema. El script deberá iterar por todos 
#los parámetros recibidos, y solo para aquellos parámetros que se 
#encuentren en posiciones impares (el primero, el tercero, el q
#verificar si el archivo o directorio existen en el sistema, 
#imprimiendo en pantalla que tipo de objeto es (archivo o directorio).
# Además, deberá informar la cantidad de archivos o directorios 
#inexistentes en el sistema.

es_impar(){
	if [ $(expr $1 % 2) -eq 1 ]; then
		return 0
	else 
		return 1
	fi
}

if [ $# -lt 1 ]; then
	echo "El script debe recibir al menos un parametro"
	exit 1
fi

arreglo=("$@")
cant_i=0
pos=0
for elem in ${arreglo[@]}; do
	if es_impar $pos; then
		if [ -d "$elem" ]; then
			echo "El elemento $elem es un directorio del sistema"
		fi 
		if [ -f "$elem" ]; then
			echo "El elemento $elem es un archivo del sistema"
		fi
	fi
	if [ ! -e "$elem" ]; then
		cant_i=$(expr $cant_i + 1)	
	fi
	pos=$(expr $pos + 1)
done
echo "La cantidad de archivos inexistentes del sistema es de: $cant_i"
