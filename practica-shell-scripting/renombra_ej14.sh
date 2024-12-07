#!/bin/bash
#Renombrando Archivos: haga un script que renombre solo archivos de
# un directorio pasado como parametro agregandole una CADENA
#, contemplando las opciones:
#“-a CADENA”: renombra el fichero concatenando CADENA al final 
#del nombre del archivo
#“-b CADENA”: renombra el fichero concantenado CADENA al
# principio del nombre del archivo
#Ejemplo:
#Si tengo los siguientes archivos: /tmp/a /tmp/b
#Al ejecutar: ./renombra /tmp/ -a EJ
#Obtendré como resultado: /tmp/aEJ /tmp/bEJ
#Y si ejecuto: ./renombra /tmp/ -b EJ
#El resultado será: /tmp/EJa /tmp/EJb

#en $1 tengo -a|-b , en $2 tengo la cadena y en $3 recibo el directorio
if [ "$#" -ne "3" ] ; then
	echo "Error: numero incorrecto de parametros"
	exit 1
fi

if [ -e "$3" ] && [ -d "$3" ]; then #verifico si existe y es un directorio
	if [ "$1" == "-a" ]; then #agrego cadena atras
		for archivo in "$3"/*; do
			if [ -f "$archivo" ]; then
				nombre="${archivo%.*}"
				extension="${archivo##*.}"
				nuevo_nom="${nombre}${2}.${extension}"
				mv "$archivo" "$nuevo_nom"  
			fi
		done	 
	elif  [ "$1" == "-b" ]; then #agrego cadena adelante
		for archivo in "$3"/*; do
			if [ -f "$archivo" ]; then
				#obs: archivo tiene la ruta completa
				nombre="${archivo##*/}" #tomo nombre y extension del archivo
				nuevo_nom="${3}/${2}${nombre}" #directorio/cadena+nombre
				mv "$archivo" "$nuevo_nom"
			fi
		done
		else
			echo "Operacion no reconocida"
			exit 1
	fi
else
	echo "El directorio: $3  no existe"
	exit 1
fi

#IMPORTANTE: Renombrar se hace con mv 
# in * es un comodin que se usa dentro del for in que significa
# para cada archivo o directorio 
#IMPORTANTE: nombre="${archivo%.*}" TOMO LA BASE DEL ARCHIVO CON RUTA
#            extension="${archivo##*.}" TOMO LA EXTENSION DEL ARCHIVO
# archivo in "direc"/* recorre todos los archivos o directorios del directorio

#Utilizacion de expansion de parametros:
#{variable}: Expande la variable.
#${variable#pattern}: Elimina la parte más corta que coincide con pattern al principio de la cadena.
#${variable##pattern}: Elimina la parte más larga que coincide con pattern al principio de la cadena.
#${variable%pattern}: Elimina la parte más corta que coincide con pattern al final de la cadena.
#${variable%%pattern}: Elimina la parte más larga que coincide con pattern al final de la cadena.
#${variable/pattern/replacement}: Reemplaza la primera ocurrencia de pattern por replacement.
#${variable//pattern/replacement}: Reemplaza todas las ocurrencias de pattern por replacement.
