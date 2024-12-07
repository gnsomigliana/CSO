#!/bin/bash
#Implemente un script que agregue a un arreglo todos los archivos del
# directorio /home cuya terminación sea .doc. Adicionalmente,
# implemente las siguientes funciones que le permitan acceder a la
# estructura creada:
#verArchivo <nombre_de_archivo>: Imprime el archivo en pantalla si
# el mismo se encuentra en el arreglo. Caso contrario imprime el 
#mensaje de error “Archivo no encontrado” y devuelve como valor de 
#retorno 5 
#cantidadArchivos: Imprime la cantidad de archivos del /home con
# terminación .doc
#borrarArchivo <nombre_de_archivo>: Consulta al usuario si quiere
# eliminar el archivo lógicamente. Si el usuario responde Si,
# elimina el elemento solo del arreglo. Si el usuario responde No,
# elimina el archivo del arreglo y también del FileSystem. 
#Debe validar que el archivo exista en el arreglo. En caso de no 
#existir, imprime el mensaje de error
# “Archivo no encontrado” y devuelve como valor de retorno 10

#IMPORTANTE: 
#Usa grep cuando necesites buscar texto dentro de archivos.Por defecto
#devuelve el archivo/s que coinciden con los criterios de busqueda
#Usa find cuando necesites localizar archivos o directorios
# en el sistema de archivos.Por defecto devuelve la ruta completa de
# los archivos o directorios que coinciden con los criterios de búsqueda


function verArchivo {
	if [ $# -ne 1 ]; then
		echo "La funcion $0 debe recibir el archivo a buscar en el arreglo"
		return 1
	fi
	for archivo in ${doc[@]}; do
		if [ "$archivo" == "/home/nicolas/$1" ]; then
			echo "$archivo"
			return 0
		fi
	done
	echo "Archivo no encontrado"
	return 5
}

#OBS: las funciones que no reciben parametros no deben validarse (lo dijeron en el parcial)
function cantidadArchivos {
	echo "La cantidad de archivos del /home terminados en .doc: ${#doc[@]}"
}

function borrarArchivo {
	if [ $# -ne 1 ]; then
		echo "La funcion $0 debe recibir el archivo a borrar "
		return 1
	fi
	verArchivo $1
	if [ $? -eq 5 ]; then
		return 10
	fi
	#obtengo la posicion
	pos=0
	for archivo in ${doc[@]}; do
		if [ "$archivo" == "/home/nicolas/$1" ]; then
			aux=$archivo
			break
		fi
		pos=$(expr $pos + 1 )	
	done
	echo "Desea borrar el archivo logicamente?(Si/No, otro para cancelar)"
	read opc
	if [ "$opc" == "Si" ]; then
		unset doc[$pos]
		doc=( "${doc[@]}" )
	elif [ "$opc" == "No" ];then
		unset doc[$pos]
		doc=( "${doc[@]}" )
		rm "$aux"
	fi
}

if [ $# -ne 0 ]; then
	echo "El script no debe recibir parametros"
	exit 1
fi

#OBS: no hace falta escapar del '.'
doc=( $(find "/home/nicolas" -type f -name "*.doc") ) 
echo "${doc[@]}"
verArchivo "prueba.doc"
cantidadArchivos
borrarArchivo "prueba.doc"
cantidadArchivos
echo "${doc[@]}"
