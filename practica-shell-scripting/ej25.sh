#!/bin/bash
#Realice un script que agregue en un arreglo todos los nombres de 
#los usuarios del sistema pertenecientes al grupo “users”.
# Adicionalmente el script puede recibir como parametro:
#“-b n”: Retorna el elemento de la posición n del arreglo si 
#el mismo existe. Caso contrario, un mensaje de error.
#“-l”: Devuelve la longitud del arreglo
#“-i”: Imprime todos los elementos del arreglo en pantalla

#para verificar que la posicion existe compruebo si esta en la dimension del arreglo
function retornar {
	if [ $# -ne 1 ]; then
		echo "Debe especificar la posicion a retornar"
		return 3
	fi
	pos=$1
	if [ $pos -ge 0 ] && [ $pos -lt ${#arreglo[@]} ]; then
		retornar=${arreglo[$pos]}
	else 
		echo "La posicion no existe en el arreglo"
	fi 
}

function longitud {
	echo "${#arreglo[@]}"
}

function imprimir {
	echo "${arreglo[@]}"
}



if [ $# -gt 2  ]; then
	echo "Error en el pasaje de parametros"
	echo "Uso: $0 [opc1] [opc2]"
	exit 
fi

lista_usuarios=($(cat /etc/passwd | cut -d: -f1))
arreglo=()
for usuario in ${lista_usuarios[@]}; do
	if groups "$usuario" | grep -q "users"; then
		arreglo+=("$usuario")
	fi	
done 
case $1 in
	"-b")
		retornar $2
		;;
	"-l")
		longitud
		;;
	"-i")
		imprimir
		;;
	*)
		exit 0
		;;	
esac
#IMPORTANTE: grep -q lo ejecuta en modo silencioso
