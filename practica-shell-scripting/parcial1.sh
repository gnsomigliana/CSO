#!/bin/bash
#Parcial-30-09-2023.2
#11)

delete() {
 	#verifico num de parametros 
	for ((i=0 ; i < ${#cache[@]} ; i++)); do
		elem=${cache[$i]}
		if [ elem == $1 ]; then
			unset cache[$i]
			rm $1
			break
		fi
	done
	cache=("${cache[@]}")
}

index() {
	
}

size() {
	"Cache tiene ${#cache[@]}"
}

list() {
	echo "${cache[@]}"
}

if [ $# -ne 1 ]; then
	echo "Error: el script debe recibir la ruta como parametro"
	exit 1
fi
#en $1 recibo la ruta del directorio 

if [ ! -d $1 ]; then
	echo "El directorio no existe"
	exit 1	
fi	

for file in "$1/*"; do 
	if [ -f file ]; then
		cache+=("$file")
	fi
done

echo "${a[@]}"

