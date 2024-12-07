#!/bin/bash
#Crear un script que reciba como parámetro el nombre de un archivo
# e informe si el mismo existe o no, y en caso afirmativo indique si
# es un directorio o un archivo. En caso de que no exista el
# archivo/directorio cree un directorio con el nombre recibido
#como parámetro

#IMPORTANTE: a sustitución de comandos es útil en Bash y otros shells
# para capturar la salida de un comando y usarla como parte de
# otro comando.
#IMPORTANTE: -f dentro de test sirve para saber si es un archivo
# -d dentro de test sirve para saber si es un directorio


#verifico si recibo un parametro 
if [ "$#" -ne "1" ]; then
	echo "Error: numero incorrecto de parametros"
	exit 1
fi

if [ -e "$1" ]; then #verifico si el archivo/directorio existe
	if  [ -f "$1" ]; then #si es un archivo
	echo "$1 es un archivo"
	fi
	if [ -d "$1"  ]; then #si es un directorio
	echo "$1 es un directorio"
	fi
else 
	if echo "$1" | grep -q '\.'; then #verifico si es archivo tiene (.)
		touch $1
		echo "El archivo $1 ha sido creado"
	else
		mkdir $1
		echo "El directorio $1 ha sido creado"
	fi
fi


# el if se puede escribir con condicion como la 
#salida de otro comando, siempre y cuando sea boleano


