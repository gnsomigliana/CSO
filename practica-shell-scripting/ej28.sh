#!/bin/bash
#Realice un script que reciba como parámetro el nombre de un
# directorio. Deberá validar que el mismo exista y de no existir 
#causar la terminación del script con código de error 4. Si el
#directorio existe deberá contar por separado la cantidad de archivos
# que en él se encuentran para los cuales el usuario que ejecuta el
# script tiene permiso de lectura y escritura, e informar dichos
# valores en pantalla. En caso de encontrar subdirectorios, 
#no deberán procesarse, y tampoco deberán ser tenidos en cuenta
# para la suma a informar.

#IMPORTANTE: dentro del test (comprueba los permisos del usuario)
# -x comprueba si el archivo tiene permiso de ejecucion
# -r comprueba si el archivo tiene permiso de lectura
# -w comprueba si el archivo tiene permiso de lectura

if [ $# -ne 1 ]; then
	echo "Error: numero incorrecto de parametros"
	echo "Uso: $0 <ruta_absoluta_directorio>"
	exit 1
fi

if [ -d "$1" ]; then
	cant_l=0
	cant_e=0
	#IMPORTANTE: CUANDO RECORRO UN DIRECTORIO NO OLVIDARSE /* PARA ITERAR SOBRE ELEMENTOS DE UN DIRECTORIO
	for archivo in "$1"/*; do 
		if [ -f $archivo ]; then
			if [ -r $archivo ]; then
				cant_l=$(expr $cant_l + 1)
			fi
			#OJO: si uso elif no funciona correctamente
			if [ -w $archivo ]; then
				cant_e=$(expr $cant_e + 1)
			fi
		fi
	done
else
	echo "El directorio no existe"
	exit 4
fi

echo "El usuario tiene permiso de escritura en $cant_e archivos"
echo "El usuario tiene permiso de lectura en $cant_l archivos"
