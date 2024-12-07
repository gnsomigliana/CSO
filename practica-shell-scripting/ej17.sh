#!/bin/bash
#Escribir un script que al ejecutarse imprima en pantalla los nombre
# de los archivos que se encuentran en el directorio actual,
# intercambiando minúsculas por mayúsculas, además de eliminar la 
#letra a (mayúscula o minúscula). Ejemplo, directorio actual:
#IsO
#pepE
#Maria
#Si ejecuto: ./ejercicio17
#Obtendré como resultado:
#iSo
#PEPe
#mRI
#Ayuda: Investigar el comando tr
#tr -d 'a'-> borra todos los caracteres a de la cadena recibida
#tr [:lower:] [:upper:] -> transforma las minusculas en mayusculas de la cadena recibida

if [ $# -ne 0 ]; then
	echo "Error: este script no acepta parametros"
	exit 1
fi

for directorio in $(ls); do
	if [ -d $directorio ]; then
		nuevo_nombre=$(echo $directorio | tr -d 'a' | tr '[:lower:]' '[:upper:]')
		echo $nuevo_nombre
	fi
done
